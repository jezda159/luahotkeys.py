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

  Switch code
  {

    case "1_0_minus":
      ToolTip, Step back, 60, 40
      Send, ^z

    case "1_0_plus":
      ToolTip, Step forward, 60, 40
      Send, ^y

    case "1_0_0":
      ToolTip, F5 [reload], 60, 40
      Send, {F5}

    case "1_0_5":
      ToolTip, Commit [phpStorm], 60, 40
      Send, ^k

    case "1_0_7":
      ToolTip, Copy, 60, 40
      Send, ^c

    case "1_0_8":
      ToolTip, Paste, 60, 40
      Send, ^v

    case "1_0_9":
      ToolTip, Save, 60, 40
      Send, ^s

    case "1_A_0":
      ToolTip, F12 [inspector], 60, 40
      Send, {F12}

    case "1_A_2":
      ToolTip, Serach, 60, 40
      Send, ^f

    case "1_C_minus":
      ToolTip, Delete line, 60, 40
      Send, {end}
      Send, +{home}
      Send, {delete}
      Send, {delete}

    case "1_C_3":
      ToolTip, console.log(, 60, 40
      Send, console.log(

    case "1_C_X":
      ToolTip, Duplicate line, 60, 40
      Send, {end}
      Send, +{home}
      Send, ^c
      Send, {right}
      Send, {enter}
      Send, ^v
      Send, {up}

    case "1_C_Z":
      ToolTip, Send to server, 60, 40
      Send, ^+!x

    case "2_0_0":
      ToolTip, Text, 60, 40
      Send, ^!0

    case "2_0_1":
      ToolTip, Nadpis 1, 60, 40
      Send, ^!1

    case "2_0_2":
      ToolTip, Nadpis 2, 60, 40
      Send, ^!2

    case "2_0_3":
      ToolTip, Nadpis 3, 60, 40
      Send, ^!3

    case "2_0_4":
      ToolTip, Tucne, 60, 40
      Send, ^b

    case "2_0_5":
      ToolTip, Podtrzene, 60, 40
      Send, ^u

    case "2_0_6":
      ToolTip, Kurziva, 60, 40
      Send, ^i

    case "2_0_9":
      ToolTip, Snimek, 60, 40
      Send, {PrintScreen}

  }

  SetTimer, RemoveToolTip, -600

Return

RemoveToolTip:
  ToolTip
Return
#IfWinActive
