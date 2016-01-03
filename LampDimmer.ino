/*
 * LampDimmer.ino
 * 2015 WLWilliams
 * 
 * This sketch controls five separte dimmier channels using TRIACs. More may be added but
 * there will be a point at which the interrupt service routine can't process them all
 * fast enough. Why only five bands for this test? It's all the hardware I had. 
 * The MSGEQ7 seven channel equalizer chip is used to convert the audio to
 * seven discrete frequency bands: 63Hz, 160Hz, 400Hz, 1kHz, 2.5kHz, 6.25kHz and 16kHz. 
 * The sketch only uses five: 160 Hz, 400 Hz, 1 KHz, 2.5 KHz, 6.25 KHz
 * 
 * This program is free software: you can redistribute it and/or modify it under 
 * the terms of the GNU General Public License as published by the Free Software Foundation,
 * either version 3 of the License, or (at your option) any later version. 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details. You should have received a copy of
 * the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

//-------------------------- COMMON DEFINES ----------------------------------------------
#define MAX_PINS        5     // Total number of channels controlled
#define BOARD_LED      13     // All Arduinos have an onboard LED on this pin - I'm alive blinker
#define START_SELFTEST  2     // LOW detected on pin calls performSelfTest
//-------------------------- END COMMON DEFINES ------------------------------------------

/*-------------------------- COMMON INTERRUPT HANDLING -----------------------------------
 * Assuming 16MHz clock with a 256 prescaler, then each count is 16 usec
 * A 60 Hz AC input has ~8333 usec per half wave (each zero crossing)
 * so there are 8333 / 16 or ~ 520 'counts' between each zero crossing interrupt.
 */
#define MIN_DELAY   15   // Maximum brightness - need some delay to account for 
                         // skew in receiving interrupt and voltage on TRIAC has
                         // risen enough.
                         // Value determined mostly through testing
#define MAX_DELAY   480  // Minimum brightness. Not 520 since interrupt service
                         // routines need time to execute. 
                         // Zero cross plus five each ISR match and overflow.
                         // Value determined mostly through testing
const float delayMultipler = (MAX_DELAY - MIN_DELAY) / 100.0;

#define PW_COUNT    2    // 32 usec assuming 16MHz clock prescaled by 256 (16 usec per count)
#define ZERO_DETECT 3    // Interrupt pin for AC signal zero crossing detector
#define DETECT_LAMP 6    // Blinks on AC zero-crossing detect
#define GATE1       8    // Assume all pins are in order 8, 9, 10, 11, 12 for MAX_PINS = 5

/*-------------------------------------------------------------------------------------------
 * The main structure used to control the lamps. 'pins' is used by the interrupt service routines
 * 'newPins' is what is updated by the main process. When newPins is updated, then it is copied to 'pins' 
 */
typedef struct {
  byte pin;              // What lamp (GATE1, GATE1 + 1, ..., GATE1 + MAX_PINS-1)
  int  pinDelay;         // A value from MIN_DELAY to MAX_DELAY
} PinDef;

PinDef    pins[MAX_PINS], newPins[MAX_PINS];
volatile  boolean  inWork = false;        // While inWork, do not change values in the 'pins' array
volatile  byte     currentPin = 0;        // What lamp is currently being processed
          byte     zeroCrossCounter = 0;  // Counter - used to blink DETECT_LAMP
volatile  unsigned long interruptTimingUsec;  // Counter of microseconds used for timing interrupts
          bool     enableTimingDisplay = true;  // Print the interupt timing amount to Serial
//-------------------------- END COMMON INTERRUPT HANDLING ----------------------------------

unsigned long counter = millis();  // used for blinking BOARD_LED ('I'm alive')

//-------------------------- MSGEQ7 Chip function defines -----------------------------------

#define MSGEQ7_STB  4       // Active HIGH Strobe PW 18 usec min. Strobe to Strobe delay 72 usec min
                            // Output settling time from Strobe 36 usec min
#define MSGEQ7_RST  5       // Active HIGH Reset PW 100 nsec min. Reset to first Strobe 72 usec min
#define MSGEQ7_DCout  A0    // Analog input pin
// Sequence - Reset HIGH, delay 25 usec, Reset LOW, delay 100 usec
//            For each Strobe: Strobe HIGH, delay 25 usec, Strobe LOW, delay 50 usec, Read Analog
#define RESET_PW_USEC             25     // 
#define STROBE_PW_USEC            25
#define RESET_TO_STROBE_USEC      100
#define STROBE_TO_OUTPUT_USEC     50
#define DELAY_AFTER_ANALOG_USEC   50

//-------------------------- END MSGEQ7 Chip function defines ---------------------------------

void setup() {
  // Initalize the pins array
  for ( byte i = 0; i < MAX_PINS; i++ ) {
    pins[i].pin = GATE1 + i;
    pins[i].pinDelay = MAX_DELAY;
    pinMode(pins[i].pin,OUTPUT);
    digitalWrite(pins[i].pin,LOW);
  }
  memcpy(&newPins,&pins,MAX_PINS*sizeof(PinDef));

  pinMode(MSGEQ7_DCout,INPUT);
  pinMode(MSGEQ7_RST, OUTPUT); // reset
  pinMode(MSGEQ7_STB, OUTPUT); // strobe
  analogReference(DEFAULT);
  digitalWrite(MSGEQ7_RST,LOW); // reset low
  digitalWrite(MSGEQ7_STB,LOW); //pin 5 is RESET on the shield
  delayMicroseconds(1);
  digitalWrite(MSGEQ7_RST,HIGH); // reset low
  delayMicroseconds(1);
  digitalWrite(MSGEQ7_RST,LOW); // reset low
  digitalWrite(MSGEQ7_STB,HIGH);
  delayMicroseconds(1);

  Serial.begin(9600);
  
  pinMode(ZERO_DETECT,INPUT);     // Zero crossing detction channel
  digitalWrite(ZERO_DETECT,LOW ); // Enable internal pulldown resistor

  pinMode(START_SELFTEST,INPUT_PULLUP);
  digitalWrite(START_SELFTEST,HIGH );

  pinMode(DETECT_LAMP,OUTPUT);    // Lamp
  pinMode(BOARD_LED,OUTPUT);      // Lamp

  TIMSK1  = 0x03;                 // Enable Comparator A and Overflow interrupts
  TCCR1A  = 0x00;                 // Normal operation, timer disabled
  TCCR1B  = 0x00;

  attachInterrupt(digitalPinToInterrupt(ZERO_DETECT),AcZeroCrossingInterrupt,RISING);
}

void loop() {
  
  readMSGEQ7Data();

  if ( InSelfTest() ) {
    performSelfTest(true);
  }

  if ( millis() - counter > 500 ) {
    digitalWrite(BOARD_LED,!digitalRead(BOARD_LED));  // I'm alive blinker
    counter = millis();
  }

  if ( (! inWork)  && enableTimingDisplay )
    Serial.println(interruptTimingUsec);   // approx number of microseconds in all interrupts 
}

void AcZeroCrossingInterrupt () {
  interruptTimingUsec = micros();
  inWork = true;                   // we're using pins list. don't change it
  
  if ( ++zeroCrossCounter == 60 ) {     // blink LED approx every 1/2 second
    zeroCrossCounter = 0;
    digitalWrite(DETECT_LAMP,!digitalRead(DETECT_LAMP));
  }

  OCR1A = pins[0].pinDelay;       // How much to count up to
  TCCR1B = 0x04;                  // start timer with divide by 256 prescaler
  TCNT1 = 0;                      // Count from 0 up to value in OCR1A register
}

ISR ( TIMER1_COMPA_vect ) {       // reached count in OCR1A register, turn on TRIAC gate
  digitalWrite(pins[currentPin].pin,HIGH);
  TCNT1 = 65536 - PW_COUNT;       // set counter for ~ 32 usec pulse width
}

ISR ( TIMER1_OVF_vect ) {         // Overflowed pulse width count, turn off TRIAC gate
  digitalWrite(pins[currentPin].pin,LOW);

  if ( ++currentPin == MAX_PINS ) {
    currentPin = 0;
    TCCR1B = 0x00;
    inWork = false;                       // ok to change pin list
    interruptTimingUsec = micros() - interruptTimingUsec;
  }
  else {    // setup and start next count up interrupt 
    int val = pins[currentPin].pinDelay - pins[currentPin-1].pinDelay;
    OCR1A = ( val == 0 ) ? 1 : val;
    TCCR1B = 0x04;
    TCNT1 = 0;
  }
}

/* MSQEQ7 Theory (from Datasheet) The DC peak output for measurement is selected using the reset 
 * and strobe pins. Reset high resets the multiplexor. Reset low enables the strobe pin. 
 * After the first strobe leading edge, 63Hz output is on OUT. Each additional strobe leading edge 
 * advances the multiplexor one channel (63Hz, 160Hz, 400Hz, 1kHz, 2.5kHz, 6.25kHz, 16kHz etc.) 
 * and this will re- peat indefinitely. The multiplexor read rate is also the output decay time 
 * control. Each read decays that channel approximately 10%. Each of the analog voltages are converted
 * to the appropriate delays in the pins structure (pinDelay)
 */
void readMSGEQ7Data ( void )
{
  digitalWrite(MSGEQ7_RST, HIGH);
  delayMicroseconds(25);
  digitalWrite(MSGEQ7_RST, LOW);
  delayMicroseconds(100);
   for ( int band=0; band < 7; band++ )    // Ignore bands 0 and 6 - 60 Hz and 16 KHz
     {
     digitalWrite(MSGEQ7_STB,LOW); // strobe pin on the shield - kicks the IC up to the next band 
     delayMicroseconds(100); // 
     int val = analogRead(MSGEQ7_DCout)
     if ( band >= 1 && band <= 5 )  {
        // The value runs from 0 to 1023 (max)
        // Convert to range MAX_DELAY (min brightness) to MIN_DELAY (max brightness)
        newPins[band].pinDelay = map(val,0,1023,MAX_DELAY,MIN_DELAY);
     }
     digitalWrite(MSGEQ7_STB,HIGH); 
     delayMicroseconds(1);
     }
     
  sortNewPinsAndCopyToPins(true);
}

void performSelfTest ( bool debug ) {
  int   value;
  bool  ok = true;
  /*
   * Run selfTest if the START_SELFTEST pin goes LOW. Blink any LEDs then output patterns to 
   * the lamps to allow visual verification. Continue until START_SELFTEST goes HIGH.
   */

  // Blink all LEDs so the user knows they are working
  for ( value=0; value < 20; value++ ) {
    digitalWrite(DETECT_LAMP,ok);   
    digitalWrite(BOARD_LED,ok);
    ok = ! ok;     
    delay ( 100 );
   }

  /* 
   * Loop through each lamp - increasing each from MIN to MAX then MAX to MIN
   * Repeat until START_SELFTEST goes HIGH
   */
  while ( true ) {
    // Then loop through lighting the lamps. Create some patterns
    resetNewPins();
    for ( byte j = 0; j < MAX_PINS; j++ ) {
      for ( value = MAX_DELAY; value >= MIN_DELAY; value -= 72 ) {
        newPins[j].pinDelay = value;
        sortNewPinsAndCopyToPins(debug);
        delay(50);
        //if ( ! InSelfTest() ) return;
      }
      for ( value = MIN_DELAY; value <= MAX_DELAY; value += 72 ) {
        newPins[j].pinDelay = value;
        sortNewPinsAndCopyToPins(debug);
        delay(50);
        //if ( ! InSelfTest() ) return;
      }  
    }
  }
}

void sortNewPinsAndCopyToPins ( bool printList )  {    
  bubbleSortPinDefStruct(printList);     // arrange in ascending order, optional print pinlist

  while ( inWork ) { continue; }    // Loop here until interrupt routines are done
  memcpy(&pins,&newPins,MAX_PINS*sizeof(PinDef)); // When OK, copy newPins into pins

  resetNewPins();    // Reset the order of newPins.pin back    
}

// Could also try a QuickSort.
void bubbleSortPinDefStruct ( bool printList ) {
  PinDef swap;

  if ( printList ) printPinDefStruct();

  for ( byte c = 0 ; c < ( MAX_PINS - 1 ); c++ )  {
    
    for ( byte d = 0 ; d < (MAX_PINS - c - 1); d++ )  {
      
      if ( newPins[d].pinDelay > newPins[d+1].pinDelay )  {
        memcpy(&swap,&newPins[d],sizeof(PinDef));
        memcpy(&newPins[d],&newPins[d+1],sizeof(PinDef));
        memcpy(&newPins[d+1],&swap,sizeof(PinDef));
      }
    }
  }

  if ( printList ) printPinDefStruct();
}

void printPinDefStruct () {
  for ( byte i = 0; i < MAX_PINS; i++ ) {
      Serial.print(newPins[i].pin);
      Serial.print(" ");
      Serial.print(newPins[i].pinDelay);
      Serial.print("\t");
  }
  Serial.println();
  Serial.println("---------------");
}

void resetNewPins ( void ) {
  for ( byte i= 0; i < MAX_PINS; i++ ) {    // All OFF
    newPins[i].pin = GATE1 + i;
    newPins[i].pinDelay = MAX_DELAY;
  }  
}

inline bool InSelfTest ( void ) {
  return digitalRead(START_SELFTEST) == LOW;
}


