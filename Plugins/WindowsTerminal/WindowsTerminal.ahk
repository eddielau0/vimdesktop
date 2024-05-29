WindowsTerminal:
    global WindowsTerminal_Name := "WindowsTerminal"
    global WindowsTerminal_Class := "CASCADIA_HOSTING_WINDOW_CLASS"
    global WindowsTerminal := "ahk_class " . WindowsTerminal_Class
    global WindowsTerminal_Exe := "WindowsTerminal.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global WindowsTerminal_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<WindowsTerminal_Close_Window>", "关闭窗口")
    vim.comment("<WindowsTerminal_Siwtch_Tab_Left>", "👈")
    vim.comment("<WindowsTerminal_Siwtch_Tab_Right>", "👉")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(WindowsTerminal_Name, WindowsTerminal_Class, WindowsTerminal_Exe)

    Vim.Mode("normal", WindowsTerminal_Name)
    ; vim.map("<w-w>", "<WindowsTerminal_Close_Window>", WindowsTerminal_Name) ; Win+w

    ; Vim.BeforeActionDo("WindowsTerminal_ForceInsertMode", WindowsTerminal_Name)
return

; <WindowsTerminal_Close_Window>:
;     Send ^+w
;     return