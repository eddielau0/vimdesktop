Apifox:
    global Apifox_Name := "Apifox"
    global Apifox_Class := "Chrome_WidgetWin_1"
    global Apifox := "ahk_class " . Apifox_Class
    global Apifox_Exe := "Apifox.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global Apifox_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<Apifox_Close_Window>", "关闭窗口")
    vim.comment("<Apifox_Siwtch_Tab_Left>", "👈")
    vim.comment("<Apifox_Siwtch_Tab_Right>", "👉")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(Apifox_Name, Apifox_Class, Apifox_Exe)

    Vim.Mode("normal", Apifox_Name)
    vim.map("<a-h>", "<Apifox_Siwtch_Tab_Left>", Apifox_Name)
    vim.map("<a-l>", "<Apifox_Siwtch_Tab_Right>", Apifox_Name)

    ; Vim.BeforeActionDo("Apifox_ForceInsertMode", Apifox_Name)
return

<Apifox_Siwtch_Tab_Left>:
    Send ^+{Tab}
    return

<Apifox_Siwtch_Tab_Right>:
    Send ^{Tab}
return