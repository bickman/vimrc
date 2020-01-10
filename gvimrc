"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                   GUI Setting                                 │
"╰───────────────────────────────────────────────────────────────────────────────╯
"英文字体设置，中文字体需要等宽
"很多中文字体没有等宽，使用system link可以解决这个问题
"set guifont=Sarasa/ Mono/ SC/ 12  " linux should be like this
"中文字体设置,使用 system link忽略此项,字体必需是vim可以识别的中文字体
"set guifontwide=黑体:h12
set guifont=Sarasa_Mono_SC_Semibold:h10.5
"设置标签页显示内容
set guitablabel=[%N]\ %t\ %M
set selectmode+=mouse
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove left-hand scroll bar
set guioptions+=b
"set guioptions-=m  "remove menu bar
"set guioptions-=r  "remove right-hand scroll bar
