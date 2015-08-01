set encoding=utf-8
set antialias
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R
set go-=e
highlight SpellBad term=underline gui=undercurl guisp=Orange

" ------------------------------------------
"  Macvim
"  -----------------------------------------
if has("gui_macvim")
  set guifont=Andale_Mono:h13
  macmenu File.Print key=<nop>
end
