DataGrip:
    global DataGrip_Name := "DataGrip"
    global DataGrip_Class := "SunAwtFrame"
    global DataGrip := "ahk_class " . DataGrip_Class
    global DataGrip_Exe := "datagrip64.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global DataGrip_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<DataGrip_Close_Window>", "关闭窗口")
    vim.comment("<DataGrip_Siwtch_Tab_Left>", "👈")
    vim.comment("<DataGrip_Siwtch_Tab_Right>", "👉")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(DataGrip_Name, DataGrip_Class, DataGrip_Exe)

    Vim.Mode("normal", DataGrip_Name)
    vim.map("<w-w>", "<DataGrip_Close_Window>", DataGrip_Name) ; Win+w
    vim.map("<a-j>", "<DataGrip_Siwtch_Tab_Down>", DataGrip_Name)
    ; vim.map("<a-k>", "<DataGrip_Siwtch_Tab_Up>", DataGrip_Name)
    vim.map("<a-h>", "<DataGrip_Siwtch_Tab_Left>", DataGrip_Name)
    vim.map("<a-l>", "<DataGrip_Siwtch_Tab_Right>", DataGrip_Name)
    ; vim.map("<sp-w>", "<DataGrip_Close_Window>", DataGrip_Name) ; 空格+w
    ; vim.map("<space>w", "<DataGrip_Close_Window>", DataGrip_Name) ; 空格+w。这种也可以实现，区别是按下 space 键会有弹窗提示

    ; Vim.BeforeActionDo("DataGrip_ForceInsertMode", DataGrip_Name)
return

<DataGrip_Close_Window>:
    Send ^{F4}
    return

<DataGrip_Siwtch_Tab_Up>:
    Send !{Up}
    return

<DataGrip_Siwtch_Tab_Down>:
    Send !{Down}
    return

<DataGrip_Siwtch_Tab_Left>:
    Send !{Left}
    return

<DataGrip_Siwtch_Tab_Right>:
    Send !{Right}
return