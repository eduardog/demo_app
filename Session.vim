let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/opt/railtut/demo_app
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 app/models/micropost.rb
badd +1 ^M^W^W
badd +3 Gemfile
badd +0 app/models/user.rb
args app/models/micropost.rb
set lines=34 columns=85
edit app/models/micropost.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 15 + 17) / 34)
exe '2resize ' . ((&lines * 16 + 17) / 34)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 6 - ((5 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 02l
wincmd w
argglobal
edit app/models/user.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 021l
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 15 + 17) / 34)
exe '2resize ' . ((&lines * 16 + 17) / 34)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
