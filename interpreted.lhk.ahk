#SingleInstance force
SetTitleMatchMode, 2 ; look into any part of header
SetTitleMatchMode, Fast
#IfWinActive

 ; ! = ALT
 ; + = SHIFT
 ; ^ = CTRL

~F23::
  FileRead, layout, C:/lhk/hotCode.txt

  ToolTip, Layout = %layout%, 60, 40

  SetTimer, RemoveToolTip, -600

Return

~F24::
  FileRead, code, C:/lhk/hotCode.txt

  ToolTip, %code%, 60, 40

  Switch code
  {

    case "0_minus":
      ToolTip, [%code%] Copy, 60, 40
      Send, ^z

    case "0_plus":
      ToolTip, [%code%] Copy, 60, 40
      Send, ^y

    case "0_7":
      ToolTip, [%code%] Copy, 60, 40
      Send, ^c

    case "0_8":
      ToolTip, [%code%] Paste, 60, 40
      Send, ^v

    case "0_9":
      ToolTip, [%code%] Save, 60, 40
      Send, ^s

    case "A_0":
      ToolTip, [%code%] Just enter, 60, 40
      Send, {enter}

    case "A_1":
      ToolTip, [%code%] Mode, 60, 40
      CoordMode, screen 

    case "A_2":
      ToolTip, [%code%] Move, 60, 40
      MouseMove, 100, 100 
      MouseMove, 100, 200 
      MouseMove, 200, 200 
      MouseMove, 200, 100 
      MouseMove, 100, 100 

    case "C_1":
      ToolTip, [%code%] l 100 100, 60, 40
      Click, 100, 100, left 

    case "C_2":
      ToolTip, [%code%] r 100 100, 60, 40
      Click, 100, 100, right 

    case "C_X":
      ToolTip, [%code%] Duplicate line, 60, 40
      Send, {end}
      Send, +{home}
      Send, ^c
      Send, {right}{enter}
      Send, ^v
      Send, {up}

    case "C_Z":
      ToolTip, [%code%] Send to server, 60, 40
      Send, ^+!x

  }

  SetTimer, RemoveToolTip, -600

Return

RemoveToolTip:
  ToolTip
Return
#IfWinActive
