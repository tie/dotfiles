Config { font = "xft:DejaVu Sans Mono:size=9"
       , additionalFonts = [ "xft:FontAwesome:size=8" ]
       , position = Top
       , commands =
         [ Run StdinReader
         , Run BatteryP [ "BAT0" ]
                        [ "-f", "ADP1/online"
                        , "-L", "15", "-l", "red"
                        , "-H", "40", "-n", "pink"
                        , "-S", "On", "-p", "3"

                        , "-t", "<leftipat>"
                        , "--"
                        , "--idle-icon-pattern", "<left>"
                        , "--off-icon-pattern", "<left> / <timeleft>"
                        , "--on-icon-pattern", "<watts>W <left>"

                        ] 900

         , Run MultiCpu ["-t", "<autovbar>"
                        , "-L", "30", "-n", "pink"
                        , "-H", "60", "-h", "red"
                        ] 10

         -- "-S" did not work here last time I've tested it.
         , Run ThermalZone 0 [ "-t", "PCH/<temp>°" ] 30
         , Run ThermalZone 1 [ "-t", "BAT/<temp>°"] 30
         , Run ThermalZone 2 [ "-t", "x86/<temp>°" ] 30

           -- '-d' option was pushed to master just a few days ago...
           -- I'm using pre-built binaries from Arch Linux, so I do not have this
           -- feature working yet.
         --, Run CpuFreq [ "-t", "<cpu0> <cpu1> <cpu1> <cpu1>"
         --              , "-S", "On"
         --              , "-d", "1"
         --              ] 50
           -- Because I Don't Use Windows
         --, Run Weather "UUEE" [ "-t", "<skyCondition>" ] 36000
         , Run Memory [ "-t", "<usedratio>"
                      , "-S", "On", "-w", "3" ] 10

         , Run Date "%a, %b %_d" "date" 864000 -- updates each day
         , Run Date "%I:%M %p" "time" 600
         ]
       , sepChar = "%"
       , alignSep = "{}"
       --, template = "%StdinReader% { %date% // %time% // %UUEE% } | %battery% <fn=1></fn> | %cpu% <fn=1></fn> | %memory% <fn=1></fn> "
       , template = "%StdinReader% { %date% // %time% } %multicpu% | %thermal0% %thermal1% %thermal2% <fn=1></fn> | %battery% <fn=1></fn> | %memory% <fn=1></fn> "
       }
