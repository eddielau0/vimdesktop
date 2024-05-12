Windows:
    ; ; 定义注释
    ; vim.comment("<Windows_Copy_Ahk_Class_To_Clipboard>", "复制 ahk_class to clipboard")
    ; ; insert模式
    ; vim.mode("insert", "Windows")
    ; ; normal模式
    ; vim.mode("normal", "Windows")
    ; vim.map("<c-]>", "<Windows_Copy_Ahk_Class_To_Clipboard>", "Windows")
return

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 获取 ahk_class to clipboard
#-::
  WinGetClass, title,A
  MsgBox,%title%
  clipboard=%title%
return

; #; Windows 的 Context Menu 上下文键，Menu. This is the key that invokes the right-click context menu.
#;::Send {AppsKey}f
; Send {RButton Down}
; KeyWait, ]
; Send {RButton Up}
; Send {Win Up}
Return

; #[ 鼠标左键
; #[::
; ; Send {LButton Down} {LButton Down}
; Send {LButton Down}
; KeyWait, [
; Send {LButton Up}
; Send {Win Up}
; Return

; 双击 ESC 关闭软件窗口，我本地是映射了 CapsLock -> Esc，所以是用的 CapsLock，如果要
~CapsLock::
Keywait, CapsLock, , t0.5
if errorlevel = 1
return
else
Keywait, CapsLock, d, t0.1
if errorlevel = 0
{
WinGetActiveTitle, Title
WinClose, %Title%
return
}
return
; ~Esc::
; Keywait, Escape, , t0.5
; if errorlevel = 1
; return
; else
; Keywait, Escape, d, t0.1
; if errorlevel = 0
; {
; WinGetActiveTitle, Title
; WinClose, %Title%
; return
; }
; return

; Windows and Q closes active window
; #q::
; if !WinActive("ahk_class WorkerW")
; 	WinClose, A
; return

; ; Alt + Enter changes Window between maximized and minimized
; !Enter::
; WinGet, maximized, MinMax, A
; if (maximized)
; 	WinRestore, A
; else
; 	WinMaximize, A
; return

; Window + ` Toggle Windows Terminal
; #`::
;     app_exe := WinExist("ahk_exe WindowsTerminal.exe")
;     if (app_exe) 
;     {
;         active := WinActive("ahk_id " app_exe)
;         if (active)
;             WinMinimize, ahk_id %active%
;         else
;             WinActivate, ahk_id %app_exe%
;     }
;     else
;         Run, wt.exe
; Return

; Window + s Toggle Everything
; #s::
; app_exe:= WinExist("ahk_exe Everything.exe")
; if (app_exe) 
; {
; active := WinActive("ahk_id " app_exe)
; if (active)
; 	WinMinimize, ahk_id %active%
; else
; 	WinActivate, ahk_id %app_exe%
; }
; else
; Run, C:\Users\Daniel\scoop\apps\everything\current\Everything.exe
; Return

; Window + e Toggle TotalCMD 
; #e::
; app_exe:= WinExist("ahk_exe TotalCMD64.exe")
; if (app_exe) 
; {
; active := WinActive("ahk_id " app_exe)
; if (active)
; 	WinMinimize, ahk_id %active%
; else
; 	WinActivate, ahk_id %app_exe%
; }
; else
; Run, C:\Users\Daniel\AppData\Local\TotalCMD64\TotalCMD64.exe
; Return

; Window + c Toggle Google Chrome
; #c::
; app_exe:= WinExist("ahk_exe chrome.exe")
; if (app_exe) 
; {
; active := WinActive("ahk_id " app_exe)
; if (active)
; 	WinMinimize, ahk_id %active%
; else
; 	WinActivate, ahk_id %app_exe%
; }
; else
; Run, chrome.exe
; Return

; #/::
; Send {Alt Down} {Space Down} 
; Send {n Down}
; KeyWait, /  
; Send {Alt Up} {Space Up} {n Up}
; Return

; #w::    ;;这里的 #->表示window键  w->表示字母w键					
; WinMinimize,A    ;;最小化当前窗口
; return	   ;;结束代码段

;; Only for Double Commander
; #IfWinActive ahk_class DClass
; k::Send {Up}
; return
; j::Send {Down}
; return
; h::Send {Left}
; return
; l::Send {Right}
; return