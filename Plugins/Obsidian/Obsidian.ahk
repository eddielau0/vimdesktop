Obsidian:
    global Obsidian_Name := "Obsidian"
    global Obsidian_Class := "Chrome_WidgetWin_1"
    global Obsidian := "ahk_class " . Obsidian_Class
    global Obsidian_Exe := "Obsidian.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global Obsidian_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<Obsidian_Close_Window>", "关闭窗口")
    vim.comment("<Obsidian_Siwtch_Tab_Left>", "👈")
    vim.comment("<Obsidian_Siwtch_Tab_Right>", "👉")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(Obsidian_Name, Obsidian_Class, Obsidian_Exe)

    Vim.Mode("normal", Obsidian_Name)
    ; vim.map("<a-j>", "<Obsidian_Siwtch_Tab_Down>", Obsidian_Name)
    ; vim.map("<a-k>", "<Obsidian_Siwtch_Tab_Up>", Obsidian_Name)
    vim.map("<a-h>", "<Obsidian_Siwtch_Tab_Left>", Obsidian_Name)
    vim.map("<a-l>", "<Obsidian_Siwtch_Tab_Right>", Obsidian_Name)
    ; vim.map("<sp-w>", "<Obsidian_Close_Window>", Obsidian_Name) ; 空格+w
    ; vim.map("<space>w", "<Obsidian_Close_Window>", Obsidian_Name) ; 空格+w。这种也可以实现，区别是按下 space 键会有弹窗提示

    ; Vim.BeforeActionDo("Obsidian_ForceInsertMode", Obsidian_Name)
return

<Obsidian_Siwtch_Tab_Up>:
    Send, !{Up}
    return

<Obsidian_Siwtch_Tab_Down>:
    Send, !{Down}
    return

<Obsidian_Siwtch_Tab_Left>:
    Send, ^+{Tab}
    return

<Obsidian_Siwtch_Tab_Right>:
    Send, ^{Tab}
    return