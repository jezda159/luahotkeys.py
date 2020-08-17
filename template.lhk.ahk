#SingleInstance force
SetTitleMatchMode, 2 ; look into any part of header
SetTitleMatchMode, Fast
#IfWinActive

 ; ! = ALT
 ; + = SHIFT
 ; ^ = CTRL

~F24::
  FileRead, code, C:/lhk/hotCode.txt

  ToolTip, %code%, 60, 40

  Switch code
  {
    case "C_Z":
      Send, ^+!x
      ToolTip, [%code%] Upload to server, 60, 40 

    case "0_9":
      Send, ^s
      ToolTip, [%code%] Save, 60, 40
  }
  
  SetTimer, RemoveToolTip, -600
  
Return

RemoveToolTip:
  ToolTip
Return

#IfWinActive

 ; public string Click(int x, int y, string button) => "  Click, " + x + ", " + y + ", " + button + " \n";
 ; public string Keys(string keys) => "  Send, " + keys + " \n";
 ; public string KeyDown(string key) => "  Send, {" + key + " down} \n";
 ; public string KeyUp(string key) => "  Send, {" + key + " up} \n";
 ; public string Wait(int miliseconds) => "  Sleep, " + miliseconds + " \n";
 ; public string MouseMode(string mode) => "  CoordMode, Mouse, " + mode + " \n";
 ; public string MouseMove(int x, int y) => "  MouseMove, " + x + ", " + y + " \n";
 ; public string MouseDrag(string button, int x1, int y1, int x2, int y2) => "  MouseClickDrag, " + button + ", " + x1 + ", " + y1 + ", " + x2 + ", " + y2 + " \n";
 ; public string Open(string item) => "  Run, " + item + " \n";
 ; public string Alert(string text) => "  MsgBox, " + text + " \n";