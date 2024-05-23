; TODO 后期考虑是否放到全局 General 里面去
Windows:
    ; ; 定义注释
    ; vim.comment("<Windows_Copy_Ahk_Class_To_Clipboard>", "复制 ahk_class to clipboard")
    ; ; insert模式
    ; vim.mode("insert", "Windows")
    ; ; normal模式
    ; vim.mode("normal", "Windows")
    ; vim.map("<c-]>", "<Windows_Copy_Ahk_Class_To_Clipboard>", "Windows")
return

; #; AppsKey 是 Windows 的 Context Menu 上下文键，Menu. This is the key that invokes the right-click context menu.（代替鼠标右键，应为鼠标可能会带到别处位置）
#;::Send {AppsKey}
Return

; ; #[ 鼠标左键（平时作用不大）
; #[::Send {LButton}
; Return
; #[ 鼠标中间滚轮键
#'::Send {MButton} Return

; LWin+j/k/h/l 来控制窗口
; Remove current app from screen or minimize the desktop window.
#!j::Send, #{Down}
Return
; Maximize the window.
#!k::Send, #{Up}
Return
; 往左移动窗口
#!h::Send, #{Left}
Return
; 往右移动窗口
#!l::Send, #{Right}
Return
; 往另一块屏幕移动窗口 Move an app or window in the desktop from one monitor to another.
#+h::Send, #+{Left}
Return
; 往另一块屏幕移动窗口 Move an app or window in the desktop from one monitor to another.
#+l::Send, #+{Right}
Return

; 弃用，改用下面双击 CapsLock 的方式
; Windows and Q closes active window
; #q::
; if !WinActive("ahk_class WorkerW")
; 	WinClose, A
; return

; 双击 ESC 关闭软件窗口，我本地是映射了 CapsLock -> Esc，所以是用的 CapsLock，如果要
; 监听 CapsLock 键的状态变化
~CapsLock::
    ; 等待 CapsLock 键状态变化，等待时间为 0.5 秒
    Keywait, CapsLock, , t0.5
    ; 如果 CapsLock 键被按下，立即返回
    if ErrorLevel = 1
        return
    ; 如果 CapsLock 键被释放
    else
    {
        ; 等待 0.1 秒，检查是否有连续的 CapsLock 按下事件
        Keywait, CapsLock, d, t0.1
        ; 如果没有连续的 CapsLock 按下事件
        if ErrorLevel = 0
        {
            ; 获取当前活动窗口的标题
            WinGetActiveTitle, Title
            ; 关闭当前活动窗口
            WinClose, %Title%
        }
    }
return

; ==================================== 启动程序快捷键 start
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
; ==================================== 启动程序快捷键 end

; @Deprecated (弃用，直接可以使用 ahk 程序的 Window Spy 功能查询到）获取 ahk_class to clipboard
; #-::
;   WinGetClass, title, A
;   MsgBox, %title%
;   clipboard=%title%
; return