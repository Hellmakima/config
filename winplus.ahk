#Requires AutoHotkey v2.0

#SingleInstance

#o::{
    if WinExist("ahk_exe obs64.exe") {
        WinActivate
    } else {
        Run "C:\Program Files\obs-studio\bin\64bit\obs64.exe"
    }
}

#Requires AutoHotkey v2.0
#SingleInstance

#s::
{
    sublimePath := "C:\Program Files\Sublime Text\sublime_text.exe"
    taskFile := "C:\Users\Sufiyan Attar\Desktop\task.md"
    shell := ComObject("Shell.Application")
    selected := []

    ; if Sublime is active -> open task.md
    if WinActive("ahk_exe sublime_text.exe") {
        if FileExist(taskFile)
            Run '"' sublimePath '" "' taskFile '"'
        else
            MsgBox "task.md not found."
        return
    }

    ; otherwise, check active Explorer
    activeHwnd := WinActive("A")

    for window in shell.Windows {
        try {
            if (window.HWND = activeHwnd) {
                if (window.Name = "File Explorer") {
                    sel := window.Document.SelectedItems
                    if (sel && sel.Count > 0) {
                        for item in sel {
                            selected.Push(item.Path)
                        }
                    }
                }
                break
            }
        } catch {
        }
    }

    if (selected.Length > 0) {
        for path in selected {
            Run '"' sublimePath '" "' path '"'
        }
    } else {
        if WinExist("ahk_exe sublime_text.exe")
            WinActivate
        else
            Run sublimePath
    }
}

#c::{
    codePath := "C:\Users\Sufiyan Attar\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    shell := ComObject("Shell.Application")
    selected := []

    ; if VS Code active -> just activate it
    if WinActive("ahk_exe Code.exe") {
        WinActivate
        return
    }

    activeHwnd := WinActive("A")

    ; otherwise, check active Explorer
    for window in shell.Windows {
        try {
            if (window.HWND = activeHwnd) {
                if (window.Name = "File Explorer") {
                    sel := window.Document.SelectedItems
                    if (sel && sel.Count > 0) {
                        for item in sel {
                            selected.Push(item.Path)
                        }
                    }
                }
                break
            }
        } catch {
        }
    }

    if (selected.Length > 0) {
        for path in selected {
            Run '"' codePath '" "' path '"'
        }
    } else {
        if WinExist("ahk_exe Code.exe")
            WinActivate
        else
            Run codePath
    }
}


#q::{
    if WinExist("ahk_exe mstsc.exe") {
        WinActivate
    } else {
        Run "C:\WINDOWS\system32\mstsc.exe"
    }
}

#n::{
    if WinExist("ahk_exe notepad.exe") {
        WinActivate
    } else {
        Run "notepad"
    }
}

#t::{
    if WinExist("ahk_exe powershell.exe") {
        WinActivate
    } else {
        Run "powershell -NoLogo -WorkingDirectory ~"
    }
}

; win shift t for terminal as admin
#+t:: ; win + shift + t
{
    Run '*RunAs powershell.exe'
}
