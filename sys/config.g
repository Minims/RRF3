; Configuration file for SKR v1.3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3-LPC on Mon Aug 03 2020 18:49:07 GMT+0200 (Mitteleuropäische Sommerzeit)

; General preferences
M80                                                    ; Power On
M669 K1                                                ; select CoreXY mode

; Network
M552 S0                                                ; disable Network
M550 P"BLV1"                                           ; set printer name
M587 S"SSID" P"PASSWD"
M552 P0.0.0.0 S1                                       ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                             ; enable HTTP
M586 P1 S0                                             ; disable FTP (RRF3_LPC limitation)
M586 P2 S0                                             ; disable Telnet (RRF3_LPC limitation)
M552 S1                                                ; enable Network

G90                                                    ; send absolute coordinates...
M83                                                    ; ...but relative extruder moves

; Drives
M569 P0 S0 D2                                          ; physical drive 0 goes backwards using default driver timings, spread cycle
M569 P1 S0 D2                                          ; physical drive 1 goes backwards using default driver timings, spread cycle
M569 P2 S0 D3                                          ; physical drive 2 goes backwards using default driver timings, stealthChop
M569 P3 S1 D3                                          ; physical drive 3 goes forwards using default driver timings, stealthChop
M569 P4 S0 D3                                          ; physical drive 4 goes backwards using default driver timings, stealthChop
M584 X0 Y1 Z2:4 E3                                     ; set drive mapping
M350 X16 Y16 Z16 E16 I1                                ; configure microstepping with interpolation
M92 X200.00 Y200.00 Z1600.00 E408.00                   ; set steps per mm
M566 X600 Y600 Z24 E300                                ; Set maximum instantaneous speed changes (Jerk) (mm/min) 
M203 X10000 Y10000 Z600 E2000                          ; Set maximum speeds (mm/min) 
M201 X2200 Y2200 Z100 E5000			   				   ; Set accelerations (mm/s^2)
M906 X1600 Y1600 Z800 E800 I30                         ; Set current and idle percent
M84 S30                                                ; Set idle timeout

; Axis Limits
M208 X-37:235 Y-67:306 Z0:195                          ; set axis min/max

; Endstops
M574 X1 S1 P"xstop"                                    ; configure active-high endstop for low end on X via pin xstop
M574 Y2 S1 P"ystopmax"                                 ; configure active-high endstop for high end on Y via pin ystop
M574 Z1 S2                                             ; configure Z-probe endstop for low end on Z

; Z-Probe
M558 P9 H5 F300 T10000 X117.5 Y117.5 Z1 C"^zstop"	   ; disable Z probe but set dive height, probe speed and travel speed
M950 S0 C"servo0"									   ; Setup servo 0 as servo port on SKR
M671 X-37:274.5 Y117.5:117.5 S3                        ; Z alignment
M557 X20:215 Y20:215 P3:3                              ; define mesh grid, 3 points X 3 points Y
G31 P500 X41 Y-1 Z2.55                         	       ; set Z probe trigger value, offset and trigger height

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 C0 R4700; configure sensor 0 as thermistor on pin bedtemp
M140 S-273                                             ; start with Bed off
M950 H0 C"bed" T0                                      ; create bed heater output on bed and map it to sensor 0
M143 H0 S120                                           ; set temperature limit for bed to 120C
M140 H0                                        		   ; map heated bed to heater 0
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                   ; create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S285                                           ; set temperature limit for hotend 0 to 285C

; Fans
M950 F0 C"fan0" Q500                                   ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                         ; set fan 0 value. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 F0                                       ; define tool 0
G10 P0 X0 Y0 Z0                                        ; set tool 0 axis offsets
G10 P0 R0 S0                                           ; set initial tool 0 active and standby temperatures to 0C

; Filament sensor Extruder 0
M950 J1 C"xstopmax"                                    ; filament monitor connected to xstopmax

; Pressure advance
M572 D0 S0.75

; Custom settings are not defined
M501                                                   ; load saved parameters from non-volatile memory
T0                                                     ; select first tool
