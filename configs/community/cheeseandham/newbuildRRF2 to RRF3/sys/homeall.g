  G91                                                      ; Relative mode.
  G1 Z15 F900 H2                                           ; Lower Z
  ;#### Probe Y Axis
  G1 X-350 F3000 H1                                         ; move X towards X0 and sense endstop
  G1 X4 F3000                                             ; back off
  G1 X-6 F1000 H1                                           ; move X towards X0 and sense endstop

  ;#### Probe Y Axis
  G1 Y-350 F3000 H1                                        ; move X towards X0 and sense endstop
  G1 Y4 F3000                                              ; back off enough to avoid hitting Z yokes.
  G1 Y-6 F1000 H1                                          ; move X towards X0 and sense endstop

  ;#### Probe centre
  G90                                                      ; Absolute mode.
  G1 X{move.axes[0].max/2} Y{move.axes[1].max/2}-35 F99999 ; Move NOZZLE to the center of the bed
  G30                                                      ; Probe Z

  ;#### Perform a mini-3 point probe. By just probing a tiny area, the chance of damaging the bed is reduced.
  G30 P0 X130 Y130 Z-99999
  G30 P1 X130 Y170 Z-99999
  G30 P2 X175 Y150 Z-99999 S3
