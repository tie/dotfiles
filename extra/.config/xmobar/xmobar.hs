Config { position = Top
       , font = "xft:Unifont:size=10"
       , template = "%StdinReader% } %date% { %multicpu% %memory% | %thermal0% %thermal1% %thermal2% | %battery%"
       , commands =
         [ Run StdinReader
         , Run BatteryP [ "BAT0" ]
                        [ "-f", "ADP1/online"
                        , "-L", "15", "-l", "red"
                        , "-H", "40", "-n", "pink"
                        , "-S", "On"
                        , "-t", "BAT:<leftipat>"
                        , "--"
                        , "--idle-icon-pattern", "<left>"
                        , "--off-icon-pattern" , "<left> :: <timeleft>"
                        , "--on-icon-pattern"  , "<left> :: <watts>"
                        ] 900

         , Run MultiCpu [ "-t", "<autovbar>"
                        , "-L", "30", "-n", "pink"
                        , "-H", "60", "-h", "red"
                        ] 10

         , Run ThermalZone 0 [ "-t", "PCH:<temp>℃" ] 30
         , Run ThermalZone 1 [ "-t", "BAT:<temp>℃" ] 30
         , Run ThermalZone 2 [ "-t", "X86:<temp>℃" ] 30

--       -- '-d' option was pushed to master just a few days ago.
--       -- I'm using pre-built binaries from Arch Linux, so I do not have this
--       -- feature working yet.
--       , Run CpuFreq [ "-t", "<cpu0> <cpu1> <cpu2> <cpu3>"
--                     , "-S", "On"
--                     , "-d", "1"
--                     ] 50
--       , Run Weather "UUEE" [ "-t", "<skyCondition>" ] 36000
         , Run Memory [ "-t", "RAM:<usedratio>", "-S", "On" ] 10

         , Run Date "%a, %b %-d :: %I:%M %p" "date" 600
         ]
       }
