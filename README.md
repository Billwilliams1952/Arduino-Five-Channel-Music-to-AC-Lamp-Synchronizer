#Synopsis

**Lampdimmer.ino**: An Arduino controlled, five channel AC lamp controller. 

This sketch controls five separte dimmier channels using TRIACs. More may be added but there will be a point at which the interrupt service routine can't process them all fast enough. Why only five bands for this test? It's all the hardware I had. The MSGEQ7 seven channel equalizer chip is used to convert the audio to seven discrete frequency bands: 63Hz, 160Hz, 400Hz, 1kHz, 2.5kHz, 6.25kHz and 16kHz. The sketch only uses five: 160 Hz, 400 Hz, 1 KHz, 2.5 KHz, 6.25 KHz

##Motivation

This project came about from the need to control more than one set of AC lamps .  

##Installation

Download the INO file to your Sketchbook directory and run the Arduino IDE to download and program to the target processor. Refer to the schematics **Lampdimmer1.png** and **Lampdimmer2.png** located under the **Design** folder for the hardware description.

**Schematics**

![alt tag](https://github.com/Billwilliams1952/Arduino-Five-Channel-Music-to-AC-Lamp-Synchronizer/blob/master/Design/lampdimmer.png?raw=true)

![alt tag](https://github.com/Billwilliams1952/Arduino-Five-Channel-Music-to-AC-Lamp-Synchronizer/blob/master/Design/lampdimmer2.png?raw=true)

##API Reference

This program uses the Arduino API. No special libraries are required. It has been tested on the Arduino Micro

##Tests

The code comes with a built-in self test than can be activated by setting pin 2 on the Arduino Micro LOW

##License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program.  If not, see http://www.gnu.org/licenses/.
