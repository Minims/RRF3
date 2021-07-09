; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Sat Jul 11 2020 20:25:37 GMT-0500 (Central Daylight Time)

; General preferences
M80													; Turns on the ATX power supply
G90                                                ; send absolute coordinates...
M83                                                ; ...but relative extruder moves
M669 K1                                            ; select CoreXY mode

;Network
;M550 P"BLV CUBE"                                   ; Set machine name-Now set through RPI
M552 S1                                            ; Enable network
;M587 S"NETWORK_NAME" P"PASSWORD"	           	   ; Configure access point. You can delete this line once connected
M552 P###.###.###.###							   ; IP Address
M553 P###.###.###.###							   ; Subnet Mask
M554 P###.###.###.###							   ; Default Gateway
M586 P0 S1                                         ; Enable HTTP
M586 P1 S0                                         ; Disable FTP
M586 P2 S0                                         ; Disable Telnet

; Drives
M569 P0.0 S1                                       ; physical drive 0.0 goes forwards
M569 P0.1 S0                                       ; physical drive 0.1 goes backwards
M569 P0.2 S0                                       ; physical drive 0.2 goes backwards
M569 P0.3 S0                                       ; physical drive 0.3 goes backwards
M569 P0.4 S0                                       ; physical drive 0.4 goes backwards
M569 P0.5 S0                                       ; physical drive 0.5 goes backwards

M671 X-36:345:346 Y157:301:17 S10	   			   ; leadscrew pivot point: Front left -36:157, Right Rear 345:301, and Right Front 346:17

M584 X0.1 Y0.2 Z0.3:0.4:0.5 E0.0                   ; set drive mapping Z3=Left Front, Z4= Right Rear, Z5=Right Front
M350 X32 Y32 Z16 E16 I1                            ; configure microstepping with interpolation
M92 X200.00 Y200.00 Z400.00 E406.56                ; set steps per mm
M566 X700.00 Y700.00 Z24.00 E2000.00               ; set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z800 E20000                     ; Set maximum speeds (mm/min) mm per minute/60=mm per second
M201 X3000 Y3000 Z100 E4000			   			   ; Set accelerations (mm/s^2)
M906 X1600 Y1600 Z1600 E800 I30                    ; Set motor currents (mA) and motor idle factor in per cent
M84 S120                                           ; Disable motor idle current reduction

; Axis Limits
M208 X0 Y1 Z0 S1                                   ; set axis minima
M208 X330 Y319 Z445 S0                             ; set axis maxima

; Endstops
M574 X1 S1 P"io1.in"                              ; configure active-high endstop for low end on X via pin i01.in
M574 Y2 S1 P"io2.in"                              ; configure active-high endstop for high end on Y via pin i02.in
M574 Z1 S2                                         ; configure Z-probe endstop for low end on Z
M591 D0 P1 C"io3.in" S1							  ; configure filament runout sensor for high end on extruder drive 0 via pin i03.in

; Z-Probe
M950 S0 C"io7.out"                                 ; create servo pin 0 for BLTouch
M558 P9 C"^io7.in" H10 F300 T9000                   ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X0 Y0 Z1.230                               ; set Z probe trigger value, offset and trigger height
M557 X65:328 Y21:291 P4                           ; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" A"Bed Temp" T100000 B4700 C0.0000000706                   ; configure sensor 0 as thermistor on pin temp0
M308 S1 P"temp1" Y"thermistor" A"Extruder Temp" T100000 B4725 C0.0000000706               ; configure sensor 1 as thermistor on pin temp1
M950 H0 C"out1" T0                                 ; create bed heater output on out0 and map it to sensor 0
M950 H1 C"out2" T1                                 ; create nozzle heater output on out1 and map it to sensor 1
M307 H0 A326.4 C1281.8 D11.0 V24.5 B0              ; Set PID for bed heater
M140 H0                                            ; map heated bed to heater 0
M143 H0 S100                                       ; set temperature limit for heater 0 to 100C
M307 H1 A319.6 C112.6 D2.2 V24.5 S1.0 B0			; Set PID for Hotend .4Bmm nozzle
M143 H1 S260                         				; Set temperature limit for heater 1 to 260C
M308 S2 P"mcu-temp" Y"mcu-temp" A"Duet Board" ; Configure MCU sensor

; Fans
M950 F0 C"out9" Q500                               ; create fan 0 on pin out9 and set its frequency
M106 P0 C"Layer Fan" S0 H-1                                     ; set fan 0 value. Thermostatic control is turned off
M950 F2 C"out7" Q500                               ; create fan 1 on pin out7 and set its frequency
M106 P2 C"MB Fan" T40:55 H2                                  ; set fan 1 value. Thermostatic control is turned on
M950 F1 C"out8" Q500                               ; create fan 1 on pin out8 and set its frequency
M106 P1 S255 H1 T30                                  ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                   ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined
M564 H0                                   	   ; Let the Jog buttons work blv: added to allow jog buttons

; Miscellaneous
M575 P1 S1 B57600                                  ; enable support for PanelDue
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss

;out0 NC
;out1 Bed heater
;out2 Hotend Heater
;out3 NC
;out4 NC
;out5 NC
;out6 NC
;out7 Fan 2-MB Fan
;out8 Fan 1-Layer Fan
;out9,Fan 0-Hotend Fan
;out4.tach NC
;out5.tach NC
;out6.tach NC
;io0.in PanelDue
;io1.in X Endstop
;io2.in Y Endstop
;io3.in Runout Sensor 
;io4.in NC
;io5.in NC
;io6.in NC
;io7.in BLTouch Z-
;io8.in Off button C
;io0.out PanelDue
;io1.out NC
;io2.out NC
;io3.out NC
;io4.out NC
;io5.out NC
;io6.out NC
;io7.out BLTouch S
;io8.out NC
;servo, out10 (only on v0.5, not on v0.6)
;pson Power on SSR 3+
;spi.cs0 NC
;spi.cs1 NC - this can be your PT100 board
;spi.cs2 NC
;spi.cs3 NC
;temp0 Bed heater temp sensor
;temp1 Hotend Fan temp sensor
;temp2 NC
;temp3 NC
;mcu-temp Virtual Temp Sensor