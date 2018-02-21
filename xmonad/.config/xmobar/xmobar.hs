Config { font = "xft:DejaVu Sans Mono:size=9"
       , additionalFonts = [ "xft:FontAwesome:size=8" ]
       , position = Top
       , commands =
         [ Run StdinReader
         , Run BatteryP [ "BAT0" ]
                        [ "-f", "ADP1/online"
                        , "-L", "15", "-l", "red"
                        , "-H", "40", "-n", "pink"
                        , "-S", "On"

                        , "-t", "<leftipat>"
                        , "--"
                        , "--idle-icon-pattern", "<left>"
                        , "--off-icon-pattern", "<timeleft> / <left>"
                        , "--on-icon-pattern", "<watts> / <left>"

                        ] 900

         , Run MultiCpu ["-t", "<autovbar>"
                        , "-L", "30", "-n", "pink"
                        , "-H", "60", "-h", "red"
                        ] 10

         -- "-S" did not work here last time I've tested it.
         , Run ThermalZone 0 [ "-t", "PCH/<temp>°" ] 30
         , Run ThermalZone 1 [ "-t", "BAT/<temp>°"] 30
         , Run ThermalZone 2 [ "-t", "x86/<temp>°" ] 30

--       -- '-d' option was pushed to master just a few days ago...
--       -- I'm using pre-built binaries from Arch Linux, so I do not have this
--       -- feature working yet.
--       , Run CpuFreq [ "-t", "<cpu0> <cpu1> <cpu1> <cpu1>"
--                     , "-S", "On"
--                     , "-d", "1"
--                     ] 50
--       , Run Weather "UUEE" [ "-t", "<skyCondition>" ] 36000
         , Run Memory [ "-t", "<usedratio>", "-S", "On" ] 10

         , Run Date "%a, %b %_d" "date" 864000 -- update each day
         , Run Date "%I:%M %p" "time" 600
         ]
       , sepChar = "%"
       , alignSep = "{}"
       , template = "%StdinReader% { %date% // %time% } %multicpu% | %thermal0% %thermal1% %thermal2% <fn=1></fn> | %battery% <fn=1></fn> | %memory% <fn=1></fn> "
       }
