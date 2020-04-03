set backspace=indent,eol,start
set nu ai ci si sts=4 ts=4 sw=4 mouse=a

nmap<F3> : vs %<.in <CR>
"
nmap<F4> : !clear && time ./%< < %<.in  <CR>
"
nmap<F5> : !clear && time java %< < %<.in  <CR>
"
nmap<F6> : vs %<.out <CR>


map <F9> :call InitCompile()<CR>
func! InitCompile()
	if &filetype == 'c'
		exec "!clear && g++ % -o %<"
	elseif &filetype == 'cpp'
		exec "!clear && g++ -std=c++11 % -o %<"
	elseif &filetype == 'java' 
		exec "!clear && javac %" 
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

map <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!clear && time ./%<"
	elseif &filetype == 'cpp'
		exec "!clear && time ./%<"
	elseif &filetype == 'java' 
		exec "!clear && time java %<"
	elseif &filetype == 'python' 
		exec "!clear && time python3 %"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc


syntax on 
syntax enable
set mouse=a
set mousehide
set encoding=utf-8
scriptencoding utf-8
set backup "undo?
set number
set ruler
colorscheme desert
"set background=dark
set backspace=2
" set autoindent "自动缩进
" set smartindent "智能缩进
" set cindent "C系列缩进
 set softtabstop=4 "缩进长度
 set shiftwidth=4 "缩进长度
 set tabstop=4 "tab键长度
" set expandtab "tab设为空格
 set softtabstop=4 "缩进长度
   

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
" 括号自动生成

"
	

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


""""""""""""""""""""""""
""实用设置
""""""""""""""""""""""""
"set transparency=10 "透明度
set lines=55 "窗口多长，下为多宽
set columns=100
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
set langmenu=zh_CN.UTF-8
set helplang=cn
" 语言设置

set helplang=cn
set encoding=utf-8

autocmd BufWritePost $MYVIMRC source $MYVIMRC 
" 让配置变更立即生效

" colorscheme solarized
"配色沙漠 还有: torte, solarized, molokai, phd, ron, evening  等经典配色
" set guifont = Source_Code_Pro:h15
" 设置字体为  字体：大小
"set guifont=Menlo\ 16
set guifont=Monospace\ 14
"字体和大小
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
let Tlist_Use_Right_Window = 1
"在右侧窗口中显示taglist窗口
 set showmatch
"自动匹配
set wildmenu 
" vim 自身命令行模式智能补全
set nobackup
set noswapfile
"禁止生成临时文件

"复制粘贴控制 
nmap<C-A> ggvG
vmap<C-C> "+y
nmap <C-v> c<ESC>"+p 
imap <C-v> <ESC>"+pa


" 树形目录 
nmap <F12> :NERDTreeToggle<cr>

"根据文件名自动生成代码
if !exists("*SetTitlex")
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitlex()"
func SetTitlex()
	if &filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: Ricky")
		call append(line(".")+2, "\# Created Time:".strftime("%c"))
		call append(line(".")+3,"\#########################################################################")
		call append(line(".")+4, "\#!/bin/bash")
		call append(line(".")+5, "") 
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "    > File Name: ".expand("%"))
		call append(line(".")+1, "    > Author: Ricky")
		call append(line(".")+2, "    > Created Time: ".strftime("%c"))
		call append(line(".")+3, "") 
		call append(line(".")+4," ************************************************************************/")
		call append(line(".")+5, "") 
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "#include <cstdio>")
		call append(line(".")+8, "#include <cstring>")
		call append(line(".")+9, "#include <string>")
		call append(line(".")+10, "#include <cmath>")
		call append(line(".")+11, "#include <cstdlib>")
		call append(line(".")+12, "#include <queue>")
		call append(line(".")+13, "#include <map>")
		call append(line(".")+14, "#include <set>")
		call append(line(".")+15, "#include <vector>")
		call append(line(".")+16, "#include <stack>")
		call append(line(".")+17, "#include <algorithm>")
		call append(line(".")+18, "#include <ctime>")
		call append(line(".")+19, "using namespace std;")
		call append(line(".")+20, "#define debug(x) cout << #x << ' = ' << x << endl")
		call append(line(".")+21, "#define lowbit(x) (x & (-x))")
		call append(line(".")+22, "#define pi acos(-1)")
		call append(line(".")+23, "")
		call append(line(".")+24, "typedef long long LL;")
		call append(line(".")+25, "typedef unsigned long long ULL;")
		call append(line(".")+26, "typedef pair<int, int> PII;")
		call append(line(".")+27, "const int maxn = 1e5 + 10;")
		call append(line(".")+28, "const int inf  = 1 << 30;")
		call append(line(".")+29, "const int mod  = 1e9 + 7;")
		call append(line(".")+30, "")
		call append(line(".")+31, "int main(){")
		call append(line(".")+32, "")
		call append(line(".")+33, "    return 0;")
		call append(line(".")+34, "}")
	endif
	autocmd BufNewFile *normal G
endfunc
endif

"完成时间
if !exists("*FinishT")
map<F1> : call FinishT()<CR>
func FinishT()
let l = 4 | call setline(l,' * Ended  Time*  : '.strftime('%c'))
endfunc
endif


" 设置当文件被改动时自动载入
" set autoread

" set backspace=” (Vi compatible)
