; Configuration file for SKR Pro (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.4-LPC-5 on Thu Oct 22 2020 21:31:39 GMT+0200 (CEST)

; General preferences
M80                                                   ; Power On
G90                                                   ; send absolute coordinates...
M83                                                   ; ...but relative extruder moves
M550 P"CoreIN Pro"                                    ; set printer name
M669 K1                                               ; select CoreXY mode

; Network
M552 P0.0.0.0 S1
;M587 S"SSID" P"p@$$w0rD"                       ; Configure access point. You can delete this line once connected                                     ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                            ; enable HTTP
M586 P1 S0                                            ; disable FTP
M586 P2 S0                                            ; disable Telnet

; Drives
M569 P0 S1 D3 V40                                     ; physical drive 0 goes forwards using default driver timings
M569 P1 S1 D3 V40                                     ; physical drive 1 goes forwards using default driver timings
M569 P2 S0                                            ; physical drive 2 goes backwards using default driver timings
M569 P3 S0                                            ; physical drive 3 goes backwards using default driver timings
M569 P4 S0                                            ; physical drive 4 goes backwards using default driver timings
M569 P5 S0                                            ; physical drive 5 goes backwards using default driver timings
M584 X0 Y1 Z2:4:5 E3                                  ; set drive mapping
M350 X16 Y16 Z16:16:16 E16 I1                         ; configure microstepping with interpolation
M92 X200.00 Y200.00 Z400.00:400.00:400.00 E418.00     ; set steps per mm
M566 X600.00 Y600.00 Z24.00:24.00:24.00 E2000.00      ; set maximum instantaneous speed changes (mm/min)
M203 X20000.00 Y20000.00 Z600.00:600.00:600.00 E2000  ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00:100.0:100.00 E5000.00  ; set accelerations (mm/s^2)
M906 X1600 Y1600 Z1600:1600:1600 E1600 I30            ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                               ; Set idle timeout

; Pressure advance
; M572 D0 S0.05                                       ; disabled Pressure advance

; Axis Limits
M208 X-23 Y0 Z0 S1                                    ; set axis minima
M208 X320 Y321 Z420 S0                                ; set axis maxima

; Endstops
M574 X1 S3 P"xstop"                                   ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S3 P"ystop"                                   ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2 P"probe"                                   ; configure Z-probe endstop for low end on Z

; Filament sensor
; M591 D0 P1 C3 S1				 					  ; Set Filament sensor Simple type (High) for extruder drive 0, connected to endstop input 3 (E0)

; Z-Probe
M950 S0 C"servo0"                                     ; create servo pin 0 for BLTouch
M558 P9 C"^probe" H5 F120 T6000                       ; set Z probe type to bltouch and the dive height + speeds
G31 P25 X28.5 Y-5 Z0                                  ; set Z probe trigger value, offset and trigger height
M557 X15:285 Y15:285 S20                              ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138        ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                                     ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                                      ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                               ; map heated bed to heater 0
M143 H0 S120                                          ; set temperature limit for heater 0 to 120C

M308 S1 P"e0temp" Y"thermistor" T100000 B4138         ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                  ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B00 S1.00                                     ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S300                                          ; set temperature limit for heater 1 to 300C

; PID
M307 H1 A372.3 C109.6 D4.6 B0			  	     	 ; Set PID for hotend values
M307 H0 A99.1 C453.2 D2.2 B0					     ; Set PID for heated bed values


; Fans
M950 F0 C"fan0" Q500                                  ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                        ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                                  ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 T45                                     ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q500                                  ; create fan 2 on pin fan2 and set its frequency
M106 P2 S0 H1 T45                                     ; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                      ; define tool 0
G10 P0 X0 Y0 Z0                                       ; set tool 0 axis offsets
G10 P0 R0 S0                                          ; set initial tool 0 active and standby temperatures to 0C


; Miscellaneous
M575 P1 S1 B57600                                     ; enable support for TFT
M575 P1 S3 B57600

; Automatic power saving
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; Set voltage thresholds and actions to run on power loss

