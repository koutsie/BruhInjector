; BruhInjector by Koutsie, 2019
; Uses ThreadJect by D4stiny

#SingleInstance, Force
#KeyHistory, 0
#NoTrayIcon
IfNotExist, %A_ProgramFiles%\BruhInjector\
   FileCreateDir, %A_ProgramFiles%\BruhInjector\

FileInstall, C:\Users\Beachpoison\Downloads\BruhInjector\ThreadJect.exe, %A_ProgramFiles%\BruhInjector\ThreadJect.exe, 1
FileInstall, C:\Users\Beachpoison\Downloads\BruhInjector\ControlColor.ahk, %A_ProgramFiles%\BruhInjector\ControlColor.ahk, 1
FileInstall, C:\Users\Beachpoison\Downloads\BruhInjector\BruhInjector.exe, %A_ProgramFiles%\BruhInjector\BruhInjector.exe, 1
SendMode Input
#Include, C:\Users\Beachpoison\Downloads\BruhInjector\ControlColor.ahk


SetBatchLines -1
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
    Gui Destroy
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
            nofile()



        else
                tor = %A_ProgramFiles%\BruhInjector\ThreadJect.exe
                jects = %Pid% %SelectedFile%
                RunWait, %tor% %jects%, , Hide,
                if (ErrorLevel = "0")
                    succ()
                else
                    fail()
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

nofile()
{
    MsgBox, "Nothing to inject!!"
    reload
}

fail() {
        SplashTextOn ,200 ,100 , BruhInjector, "Failed (Code; %ErrorLevel%)"
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
    sleep, 3
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

