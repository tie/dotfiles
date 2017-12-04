Config { font = "xft:Unifont:size=9"
       , additionalFonts = [ "xft:FontAwesome:size=8" ]
       , position = Top
       , bgColor = "#002b36"
       , fgColor = "#586e75"
       --, alpha = 0
       , commands =
         [ Run StdinReader
         , Run BatteryP [ "BAT0" ]
                        [ "-t", "(<timeleft> left) (<watts>W) (<acstatus>) <left>%"
                        , "-L", "10", "-H", "80", "-p", "3"
                        , "--"
                        ,  "-O", "Charging", "-i", "Idle", "-o", "Off"
                        , "-L", "-15", "-H", "-5"
                        , "-l", "red", "-m", "blue", "-h", "green"
                        ] 900
         , Run Cpu [ "-L", "3", "-H", "50"
                   , "--normal", "green", "--high", "red"
                   , "-t", "<total>%"
                   ] 10
           -- Because I Don't Use Windows
         --, Run Weather "UUEE" [ "-t", "<skyCondition>" ] 36000
         , Run Memory [ "-t", "<usedratio>%" ] 10
         , Run Date "%a, %b %_d" "date" 864000 -- day
         , Run Date "%I:%M %p" "time" 600
         ]
       , sepChar = "%"
       , alignSep = "{}"
       --, template = "%StdinReader% { %date% // %time% // %UUEE% } | %battery% <fn=1></fn> | %cpu% <fn=1></fn> | %memory% <fn=1></fn> "
       , template = "%StdinReader% { %date% // %time% } | %battery% <fn=1></fn> | %cpu% <fn=1></fn> | %memory% <fn=1></fn> "
       }
