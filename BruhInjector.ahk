; BruhInjector by Koutsie, 2019
; Uses ThreadJect by D4stiny

#SingleInstance on
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
#include C:\Users\Beachpoison\Downloads\BruhInjector\
FileInstall C:\Users\Beachpoison\Downloads\BruhInjector\ThreadJect.exe, %A_ScriptDir%\,ThreadJect.exe 1
SetBatchLines -1
#Include %A_ScriptDir%\ControlColor.ahk
Menu Tray, Icon, shell32.dll, 13



Gui +hWndhMainWnd -MinimizeBox -MaximizeBox -SysMenu +AlwaysOnTop +OwnDialogs +ToolWindow -Theme -Caption +Owner
Gui Font,, Lucida Console
Gui Color, 0x000000
Gui Font
Gui Font, q4 cNavy, Lucida Console
Gui Add, Text, hWndhTxtText x78 y5 w85 h23 cFF8040 +0x200 BackgroundTrans , BruhInjector
Gui Font
Gui Font,, Lucida Console
Gui Add, Text, x-16 y32 w266 h5 +0x10
Gui Add, Progress, x7 y290 w227 h28 +Background0x000000 +C0xFF8040 -Smooth vScanlist, %newz%
Gui Font
Gui Font, s7, Lucida Console
Gui Add, ListView, x8 y48 w225 h233 +AltSubmit -Hdr +Grid -Multi  +LV0x4000 +LV0x9000 +LV0x100 +Sort +Background0x000000 +C0xFF8040 +NoSortHdr +LV0x840 gProcessList, Process | PID
Gui Font
Gui Show, w241 h340, BruhInjector by Koutsie

Gui,1:-border

reescan()
return

GuiEscape:
GuiClose:
    ExitApp

Terminate:
    ExitApp

ProcessList:
if (A_GuiEvent = "DoubleClick")
    {
        LV_GetText(Softa, A_EventInfo)
        LV_GetText(Pid, A_EventInfo, 2)
        GuiControl,, statusbaz, +90
        Gui Destroy





        FileSelectFile, SelectedFile, 3, , BruhInjector, DLL Files (*.dll)
            if (SelectedFile = "")
            MsgBox, "Nothing to inject!!"


            else
                tor = %A_ScriptDir%\ThreadJect.exe
                jects = %Pid% %SelectedFile%
                torjects = %tor%%jects%
                RunWait, %tor% %jects%, , Hide,
                if (ErrorLevel = "0")
                succ()
                else
                    msgbox, Failed :( (Code; %ErrorLevel%)
        return
    }

rainbowz()
{

    sleep 1000
    FormatTime, TimeString,, Time
    Gui Add, Text, hWndhTxtReady3 x206 y320 w30 h14 cWhite +0x200 BackgroundTrans , %TimeString%
    Gui Add, Text, hWndhTxtReady3 x7 y320 w250 h14 cWhite +0x200 BackgroundTrans , v0.0.2 alpha  |  %A_UserName%
}

succ() {
        SplashTextOn ,200 ,100 , BruhInjector, "Injected! (Code; %ErrorLevel%)"
        sleep, 3000
        SplashTextOff
        Gui Destroy
        ExitApp
}


scanProceszz()
{
for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")
{
    GuiControl,, Scanlist, +1
    LV_Add("", process.Name, process.processId)
; this sleep here is only for the l o o k s
    sleep, 2
}
loop, % LV_GetCount("Column")
    LV_ModifyCol(A_Index, "AutoHdr")
}


reescan()
{
scanProceszz()
rainbowz()
    loop {
        sleep, 18000
        scanProceszz()
}
}
