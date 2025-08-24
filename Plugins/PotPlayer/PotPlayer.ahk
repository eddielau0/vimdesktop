PotPlayer:
    global PotPlayer_Name := "PotPlayer"
    global PotPlayer_Class := "PotPlayer64"
    global PotPlayer := "ahk_class " . PotPlayer_Class
    global PotPlayer_Exe := "PotPlayer64.exe"
    
    ; 用于记录文件打开对话框所属窗体
    global PotPlayer_CallerId := 0

    ; 定义注释（可选）
    vim.comment("<PotPlayer_Play_Pause>", "播放/暂停")
    vim.comment("<PotPlayer_Next_Frame>", "下一帧")
    vim.comment("<PotPlayer_Prev_Frame>", "上一帧")
    vim.comment("<PotPlayer_Volume_Up>", "音量增加")
    vim.comment("<PotPlayer_Volume_Down>", "音量减少")
    vim.comment("<PotPlayer_Seek_Forward>", "快进")
    vim.comment("<PotPlayer_Seek_Backward>", "快退")
    vim.comment("<PotPlayer_Fullscreen>", "全屏切换")
    vim.comment("<PotPlayer_Speed_Up>", "倍速增加")
    vim.comment("<PotPlayer_Speed_Down>", "倍速减少")

    ; 如果 class 和 exe 同时填写，以 exe 为准
    Vim.SetWin(PotPlayer_Name, PotPlayer_Class, PotPlayer_Exe)

    Vim.Mode("normal", PotPlayer_Name)
    
    ; 基本播放控制
    vim.map("<space>", "<PotPlayer_Play_Pause>", PotPlayer_Name)      ; 空格键播放/暂停
    vim.map("f", "<PotPlayer_Fullscreen>", PotPlayer_Name)            ; f键全屏
    vim.map("l", "<PotPlayer_Next_Frame>", PotPlayer_Name)            ; l键下一帧
    vim.map("h", "<PotPlayer_Prev_Frame>", PotPlayer_Name)            ; h键上一帧
    
    ; 进度控制
    vim.map("<s-l>", "<PotPlayer_Seek_Forward>", PotPlayer_Name)          ; Shift+L键快进
    vim.map("<s-h>", "<PotPlayer_Seek_Backward>", PotPlayer_Name)         ; Shift+H键快退
    vim.map("j", "<PotPlayer_Seek_Forward_Long>", PotPlayer_Name)     ; j键长时间快进（替代PageDown）
    vim.map("k", "<PotPlayer_Seek_Backward_Long>", PotPlayer_Name)    ; k键长时间快退
    
    ; 播放速度控制
    vim.map(".", "<PotPlayer_Speed_Up>", PotPlayer_Name)              ; .键倍速增加
    vim.map(",", "<PotPlayer_Speed_Down>", PotPlayer_Name)            ; ,键倍速减少

    ; Vim.BeforeActionDo("PotPlayer_ForceInsertMode", PotPlayer_Name)
return

; 播放/暂停
<PotPlayer_Play_Pause>:
    Send, {Space}
    return

; 下一帧
<PotPlayer_Next_Frame>:
    Send, {Right}
    return

; 上一帧
<PotPlayer_Prev_Frame>:
    Send, {Left}
    return

; 音量增加
<PotPlayer_Volume_Up>:
    Send, {Up}
    return

; 音量减少
<PotPlayer_Volume_Down>:
    Send, {Down}
    return

; 快进
<PotPlayer_Seek_Forward>:
    Send, ^{Right}
    return

; 快退
<PotPlayer_Seek_Backward>:
    Send, ^{Left}
    return

; 长时间快进（替代PageDown）
<PotPlayer_Seek_Forward_Long>:
    Send, {PgDn}
    return

; 长时间快退
<PotPlayer_Seek_Backward_Long>:
    Send, {PgUp}
    return

; 全屏切换
<PotPlayer_Fullscreen>:
    Send, {Enter}
    return

; 倍速增加
<PotPlayer_Speed_Up>:
    Send, c
    return

; 倍速减少
<PotPlayer_Speed_Down>:
    Send, x
    return