IDEA:
    global IDEA_Name := "IDEA"
    global IDEA_Class := "SunAwtFrame"
    global IDEA := "ahk_class " . IDEA_Class
    global IDEA_Exe := "idea64.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global IDEA_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<IDEA_Close_Window>", "关闭窗口")
    vim.comment("<IDEA_Siwtch_Tab_Left>", "👈")
    vim.comment("<IDEA_Siwtch_Tab_Right>", "👉")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(IDEA_Name, IDEA_Class, IDEA_Exe)

    Vim.Mode("normal", IDEA_Name)
    vim.map("<w-w>", "<IDEA_Close_Window>", IDEA_Name) ; Win+w
    vim.map("<a-j>", "<IDEA_Siwtch_Tab_Down>", IDEA_Name)
    vim.map("<a-k>", "<IDEA_Siwtch_Tab_Up>", IDEA_Name)
    vim.map("<a-h>", "<IDEA_Siwtch_Tab_Left>", IDEA_Name)
    vim.map("<a-l>", "<IDEA_Siwtch_Tab_Right>", IDEA_Name)
    ; vim.map("<sp-w>", "<IDEA_Close_Window>", IDEA_Name) ; 空格+w
    ; vim.map("<space>w", "<IDEA_Close_Window>", IDEA_Name) ; 空格+w。这种也可以实现，区别是按下 space 键会有弹窗提示

    ; Vim.BeforeActionDo("IDEA_ForceInsertMode", IDEA_Name)
return

<IDEA_Close_Window>:
    Send, ^{F4}
    return

<IDEA_Siwtch_Tab_Up>:
    Send, !{Up}
    return

<IDEA_Siwtch_Tab_Down>:
    Send, !{Down}
    return

<IDEA_Siwtch_Tab_Left>:
    Send, !{Left}
    return

<IDEA_Siwtch_Tab_Right>:
    Send, !{Right}
    return