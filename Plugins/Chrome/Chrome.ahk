Chrome:
    global Chrome_Name := "Chrome"
    global Chrome_Class := "Chrome_WidgetWin_1"
    global Chrome := "ahk_class " . Chrome_Class
    global Chrome_Exe := "chrome.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global Chrome_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<Chrome_Close_Window>", "关闭窗口")
    vim.comment("<Chrome_Siwtch_Tab_Left>", "👈")
    vim.comment("<Chrome_Siwtch_Tab_Right>", "👉")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(Chrome_Name, Chrome_Class, Chrome_Exe)

    Vim.Mode("normal", Chrome_Name)
    ; vim.map("<w-w>", "<Chrome_Close_Window>", Chrome_Name) ; Win+w
    vim.map("<a-h>", "<Chrome_Siwtch_Tab_Left>", Chrome_Name)
    vim.map("<a-l>", "<Chrome_Siwtch_Tab_Right>", Chrome_Name)
    ; vim.map("<sp-w>", "<Chrome_Close_Window>", Chrome_Name) ; 空格+w
    ; vim.map("<space>w", "<Chrome_Close_Window>", Chrome_Name) ; 空格+w。这种也可以实现，区别是按下 space 键会有弹窗提示

    ; Vim.BeforeActionDo("Chrome_ForceInsertMode", Chrome_Name)
return

<Chrome_Close_Window>:
    Send, ^w
    return

<Chrome_Siwtch_Tab_Left>:
    Send, ^+{Tab}
    return

<Chrome_Siwtch_Tab_Right>:
    Send, ^{Tab}
    return