v 20110115 2
C 40000 40000 0 0 0 title-B.sym
N 43200 50300 46400 50300 4
N 41100 49400 46400 49400 4
C 55400 49700 1 270 0 led-1.sym
{
T 56000 48900 5 10 0 0 270 0 1
device=LED
T 55900 49300 5 10 1 1 0 0 1
refdes=LED1
T 56200 48900 5 10 0 0 270 0 1
symversion=0.1
}
C 49500 44200 1 0 0 Arduino_Micro.sym
{
T 50000 50000 5 12 1 1 0 0 1
refdes=U6
}
C 45100 41200 1 0 0 MSGEQ7.sym
{
T 45500 43100 5 10 1 1 0 0 1
device=MSGEQ7
T 45500 42900 5 10 1 1 0 0 1
refdes=U7
}
N 52700 49400 53100 49400 4
N 53100 49400 53100 48200 4
N 52700 49200 53100 49200 4
N 52700 48800 53900 48800 4
N 53900 46000 53900 49700 4
N 52700 47500 55600 47500 4
N 52700 47300 55600 47300 4
N 52700 47100 55600 47100 4
N 55600 46900 52700 46900 4
N 52700 46700 55600 46700 4
C 55700 47700 1 90 0 asic-res-4.sym
{
T 55400 48900 5 8 0 0 90 0 1
device=RESISTOR
T 56100 48400 5 10 1 1 180 0 1
refdes=R11
T 56000 48200 5 10 1 1 180 0 1
value=1K
}
N 52700 47700 55600 47700 4
C 53700 49700 1 0 0 vcc-2.sym
C 55400 49700 1 0 0 vcc-2.sym
C 55800 44100 1 90 0 led-1.sym
{
T 55200 44900 5 10 0 0 90 0 1
device=LED
T 56300 44700 5 10 1 1 180 0 1
refdes=LED2
T 55000 44900 5 10 0 0 90 0 1
symversion=0.1
}
C 55500 46100 1 270 0 asic-res-4.sym
{
T 55800 44900 5 8 0 0 270 0 1
device=RESISTOR
T 55100 45400 5 10 1 1 0 0 1
refdes=R12
T 55200 45600 5 10 1 1 0 0 1
value=1K
}
C 55800 44100 1 180 0 vcc-2.sym
N 52700 46300 55600 46300 4
C 43800 42700 1 0 0 vcc-2.sym
N 41100 48900 46400 48900 4
N 49100 46100 49500 46100 4
N 52900 45900 52900 43700 4
N 52900 43700 44700 43700 4
N 44700 41900 45100 41900 4
N 44900 43500 53100 43500 4
C 44200 40500 1 90 0 capacitor-1.sym
{
T 43500 40700 5 10 0 0 90 0 1
device=CAPACITOR
T 44500 41100 5 10 1 1 180 0 1
refdes=C2
T 43300 40700 5 10 0 0 90 0 1
symversion=0.1
T 44100 40700 5 10 1 1 0 0 1
value=33pF
}
N 44000 41600 45100 41600 4
C 44100 41600 1 90 0 asic-res-4.sym
{
T 43800 42800 5 8 0 0 90 0 1
device=RESISTOR
T 43900 41900 5 10 1 1 90 0 1
refdes=R15
T 44300 41900 5 10 1 1 90 0 1
value=200K
}
C 47700 40500 1 90 0 capacitor-1.sym
{
T 47000 40700 5 10 0 0 90 0 1
device=CAPACITOR
T 48000 41100 5 10 1 1 180 0 1
refdes=C3
T 46800 40700 5 10 0 0 90 0 1
symversion=0.1
T 47600 40700 5 10 1 1 0 0 1
value=0.1uF
}
C 48400 42700 1 0 0 vcc-2.sym
N 47300 42000 48600 42000 4
C 48800 40500 1 90 0 capacitor-1.sym
{
T 48100 40700 5 10 0 0 90 0 1
device=CAPACITOR
T 49100 41100 5 10 1 1 180 0 1
refdes=C4
T 47900 40700 5 10 0 0 90 0 1
symversion=0.1
T 48700 40700 5 10 1 1 0 0 1
value=0.1uF
}
C 53000 47900 1 0 0 gnd-1.sym
C 47400 40200 1 0 0 gnd-1.sym
C 48100 40200 1 0 0 gnd-1.sym
C 43900 40200 1 0 0 gnd-1.sym
C 48500 40200 1 0 0 gnd-1.sym
N 48200 40500 48200 41700 4
N 44900 48000 44900 49400 4
T 43500 42500 5 10 0 0 0 0 1
device=FUSE
T 43500 43100 5 10 0 0 0 0 1
description=fuse
T 43500 42900 5 10 0 0 0 0 1
numslots=0
T 43500 42700 5 10 0 0 0 0 1
symversion=0.1
N 47300 41700 48200 41700 4
T 50300 40900 9 24 1 0 0 0 1
Five Channel Lamp DImmer
N 48600 42700 48600 41400 4
N 44700 43700 44700 41900 4
N 52700 46100 53100 46100 4
N 53100 46100 53100 43500 4
N 44900 42200 45100 42200 4
N 45100 42500 44500 42500 4
N 44500 42500 44500 43900 4
N 44500 43900 44000 43900 4
N 55600 46300 55600 46100 4
C 45600 44800 1 0 0 H11AA1.sym
{
T 46100 46000 5 10 1 1 0 0 1
device=H11AA1
T 46100 45800 5 10 1 1 0 0 1
refdes=U8
}
C 48000 45600 1 90 0 asic-res-4.sym
{
T 47700 46800 5 8 0 0 90 0 1
device=RESISTOR
T 47800 45900 5 10 1 1 90 0 1
refdes=R14
T 48200 45900 5 10 1 1 90 0 1
value=10K
}
C 47700 46700 1 0 0 vcc-2.sym
N 47600 45300 48300 45300 4
N 47900 45300 47900 45600 4
N 49500 47500 48300 47500 4
N 48300 47500 48300 45300 4
C 47800 44700 1 0 0 gnd-1.sym
C 45000 46900 1 90 0 asic-res-4.sym
{
T 44700 48100 5 8 0 0 90 0 1
device=RESISTOR
T 44700 47000 5 10 1 1 90 0 1
refdes=R16
T 44700 47600 5 10 1 1 90 0 1
value=15K
T 45200 47300 5 10 1 1 90 0 1
description=1/2 W
}
C 45500 45900 1 90 0 asic-res-4.sym
{
T 45200 47100 5 8 0 0 90 0 1
device=RESISTOR
T 45200 46100 5 10 1 1 90 0 1
refdes=R17
T 45200 46600 5 10 1 1 90 0 1
value=15K
T 45700 46300 5 10 1 1 90 0 1
description=1/2 W
}
N 45400 47000 45400 50300 4
N 45400 45900 45400 45600 4
N 45400 45600 45700 45600 4
N 44900 46900 44900 45000 4
N 44900 45000 45700 45000 4
C 46000 48600 1 0 0 GND.sym
T 40200 50500 9 10 1 0 0 0 1
AC In (115V 60 Hz)
T 40200 49600 9 10 1 0 0 0 1
AC Neutral
T 40200 48600 9 10 1 0 0 0 1
Ground
C 41800 43800 1 0 0 asic-res-4.sym
{
T 43000 44100 5 8 0 0 0 0 1
device=RESISTOR
T 42000 44100 5 10 1 1 0 0 1
refdes=R18
T 42500 44100 5 10 1 1 0 0 1
value=22K
}
C 44000 44100 1 180 0 capacitor-1.sym
{
T 43800 43400 5 10 0 0 180 0 1
device=CAPACITOR
T 43400 44200 5 10 1 1 0 0 1
refdes=C1
T 43800 43200 5 10 0 0 180 0 1
symversion=0.1
T 43800 43600 5 10 1 1 180 0 1
value=0.1uF
}
T 45500 47100 9 10 1 0 0 0 2
Resistors should be
at least 1/2 watt
C 41800 43300 1 0 0 asic-res-4.sym
{
T 43000 43600 5 8 0 0 0 0 1
device=RESISTOR
T 42000 43600 5 10 1 1 0 0 1
refdes=R19
T 42500 43600 5 10 1 1 0 0 1
value=22K
}
N 43000 43400 43000 43900 4
C 47300 47800 1 0 0 gnd-1.sym
N 47600 48200 47400 48200 4
N 47400 48200 47400 48100 4
N 49500 47700 48800 47700 4
C 48900 48500 1 90 0 asic-res-4.sym
{
T 48600 49700 5 8 0 0 90 0 1
device=RESISTOR
T 48700 48800 5 10 1 1 90 0 1
refdes=R13
T 49100 48800 5 10 1 1 90 0 1
value=10K
}
N 48800 47700 48800 48500 4
C 48600 49600 1 0 0 vcc-2.sym
T 47600 48800 9 10 1 0 0 0 1
Selftest
C 40700 50200 1 0 0 con2.sym
C 40700 49300 1 0 0 con2.sym
C 40700 48800 1 0 0 con2.sym
C 47600 48200 1 0 0 switch-spst-1.sym
{
T 48000 48900 5 10 0 0 0 0 1
device=SPST
T 47900 48500 5 10 1 1 0 0 1
refdes=S2
}
C 41500 42700 1 0 0 gnd-1.sym
N 41300 43600 41600 43600 4
N 41600 43000 41600 43700 4
N 41600 43300 41300 43300 4
N 41300 43700 41600 43700 4
N 41800 43400 41300 43400 4
N 41800 43900 41300 43900 4
N 42900 43900 43100 43900 4
C 40500 43300 1 0 0 StereoPlug.sym
{
T 40500 44200 5 10 1 1 0 0 1
device=Stereo Plug
T 40500 44000 5 10 1 1 0 0 1
refdes=J1
}
T 50700 40200 9 16 1 0 0 0 1
1
T 51600 40200 9 16 1 0 0 0 1
2
T 54100 40200 9 14 1 0 0 0 1
WLWilliams
C 41600 46500 1 0 0 PowerSupply.sym
{
T 42000 48000 5 10 1 1 0 0 1
device=Power Supply
T 42000 47800 5 10 1 1 0 0 1
refdes=PS1
T 42800 47100 5 10 1 0 0 0 1
Imax=1A
T 43200 47400 5 10 1 0 0 0 1
V=5V
}
N 44900 42200 44900 43500 4
N 47300 42500 47500 42500 4
N 48800 48200 48400 48200 4
N 47500 43900 47500 42500 4
N 47500 41400 47300 41400 4
C 42400 50300 1 0 0 switch-spst-1.sym
{
T 42800 51000 5 10 0 0 0 0 1
device=SPST
T 42700 50600 5 10 1 1 0 0 1
refdes=S1
}
N 42400 50300 41100 50300 4
N 52700 45900 52900 45900 4
N 49100 46100 49100 43900 4
N 49100 43900 47500 43900 4
N 44600 48500 41600 48500 4
N 41600 47500 41600 48500 4
N 41400 47100 41400 49400 4
N 41400 47100 41600 47100 4
N 41200 46700 41200 48900 4
N 41200 46700 41600 46700 4
C 44000 46400 1 0 0 gnd-1.sym
T 41300 49800 9 10 1 0 0 0 1
AWG 14 wire
C 44200 49400 1 90 0 glow-lamp-1.sym
{
T 43600 49600 5 10 0 0 90 0 1
device=GLOW_LAMP
T 43700 50000 5 10 1 1 180 0 1
refdes=GL1
T 43400 49600 5 10 0 0 90 0 1
symversion=0.1
T 43300 49600 5 10 1 1 0 0 1
description=AC On
}
T 45900 49800 9 10 1 0 0 0 1
AWG 14 wire
C 43900 47400 1 0 0 marker.sym
{
T 44004 47746 5 10 1 1 0 0 1
refdes=5V
}
C 53700 45100 1 90 0 capacitor-1.sym
{
T 53000 45300 5 10 0 0 90 0 1
device=CAPACITOR
T 54000 45600 5 10 1 1 180 0 1
refdes=C5
T 52800 45300 5 10 0 0 90 0 1
symversion=0.1
T 53600 45300 5 10 1 1 0 0 1
value=0.1uF
}
C 53400 44800 1 0 0 gnd-1.sym
C 54100 46000 1 270 0 capacitor-2.sym
{
T 54800 45800 5 10 0 0 270 0 1
device=POLARIZED_CAPACITOR
T 54600 45500 5 10 1 1 0 0 1
refdes=C6
T 55000 45800 5 10 0 0 270 0 1
symversion=0.1
T 54400 45300 5 10 1 1 0 0 1
value=10uF
}
C 54200 44800 1 0 0 gnd-1.sym
N 53500 46000 54300 46000 4
C 49800 43900 1 0 0 marker.sym
{
T 49904 44246 5 10 1 1 0 0 1
refdes=5V
}
C 51200 44000 1 0 0 gnd-1.sym
N 50000 43900 50700 43900 4
N 50700 43900 50700 44300 4
N 44000 41400 44000 41600 4
T 45700 44500 9 10 1 0 0 0 1
Zero crossing detector
T 46200 40600 9 10 1 0 0 4 5
Seven band graphic
equalizer. Frequencies:
63Hz, 160Hz, 400Hz,
1KHz, 2.5kHz, 6.25kHz,
16kHz
T 54700 48900 9 10 1 0 0 0 1
I'm alive
T 53900 44300 9 10 1 0 0 0 1
Zero cross detect
T 42300 46200 9 10 1 0 0 0 1
Digital supply
C 55600 47400 1 0 0 OffPage.sym
{
T 55920 47433 5 10 1 1 0 0 1
refdes=Ch5
}
C 55600 47200 1 0 0 OffPage.sym
{
T 55920 47233 5 10 1 1 0 0 1
refdes=Ch4
}
C 55600 47000 1 0 0 OffPage.sym
{
T 55920 47033 5 10 1 1 0 0 1
refdes=Ch3
}
C 55600 46800 1 0 0 OffPage.sym
{
T 55920 46833 5 10 1 1 0 0 1
refdes=Ch2
}
C 55600 46600 1 0 0 OffPage.sym
{
T 55920 46633 5 10 1 1 0 0 1
refdes=Ch1
}
C 46400 50200 1 0 0 OffPage.sym
{
T 46720 50233 5 10 1 1 0 0 1
refdes=AC
}
C 46400 49300 1 0 0 OffPage.sym
{
T 46720 49333 5 10 1 1 0 0 1
refdes=Neu
}
C 46400 48800 1 0 0 OffPage.sym
{
T 46720 48833 5 10 1 1 0 0 1
refdes=Gnd
}
N 44600 48500 44600 50300 4
N 43000 43400 42900 43400 4
N 47600 45000 47900 45000 4
C 48600 46800 1 270 0 pot-bourns.sym
{
T 49500 46000 5 10 0 0 270 0 1
device=VARIABLE_RESISTOR
T 48900 46400 5 10 1 1 0 0 1
refdes=R20
}
N 49200 46300 49500 46300 4
C 48500 46800 1 0 0 vcc-2.sym
C 48600 45600 1 0 0 gnd-1.sym
T 48900 46700 9 10 1 0 0 0 1
Gain
