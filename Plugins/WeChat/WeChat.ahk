WeChat:
    global WeChat_Name := "WeChat"
    global WeChat_Class := "WeChatMainWndForPC"
    global WeChat := "ahk_class " . WeChat_Class
    global WeChat_Exe := "WeChat.exe"
    
    ; global WeChat_Dir := "C:\Program Files\Double Commander"
    ; global WeChat_Path := WeChat_Dir . "\doublecmd.exe --no-splash"
    ; 用于记录文件打开对话框所属窗体
    global WeChat_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<WeChat_Msg_List>", "进入消息列表选择")
    vim.comment("<WeChat_Toolbar>", "进入左侧工具栏")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(WeChat_Name, WeChat_Class, WeChat_Exe)

    Vim.Mode("normal", WeChat_Name)
    vim.map("<a-1>", "<WeChat_Msg_List>", WeChat_Name) ; Alt+1
    vim.map("<a-2>", "<WeChat_Toolbar>", WeChat_Name)  ; Alt+2

    ; Vim.BeforeActionDo("WeChat_ForceInsertMode", WeChat_Name)
return

;; Only for WeChat
; #IfWinActive ahk_exe WeChat.exe
; !1::
; Send, ^f
; Sleep, 100  ; 等待操作完成
; Send, {Esc}
; Sleep, 100  ; 等待操作完成
; Send, {Tab}
; return
<WeChat_Msg_List>:
    Send, ^f
    Sleep, 100  ; 等待操作完成
    Send, {Esc}
    Sleep, 100  ; 等待操作完成
    Send, {Tab}
    return

<WeChat_Toolbar>:
    Send, ^f
    Sleep, 100  ; 等待操作完成
    Send, {Tab}
    Sleep, 100  ; 等待操作完成
    Send, +{Tab}
    Sleep, 100  ; 等待操作完成
    Send, +{Tab}
    Sleep, 100  ; 等待操作完成
    Send, {Down}
    Sleep, 100  ; 等待操作完成
    Send, {Down}
    return