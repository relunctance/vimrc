" 1.检测/usr/bin/ctags是否存在,如果不存在yum -y install ctags.x86_64
" 2.创建C-C , C-X , C-V 复制,粘贴,剪切临时文件: touch  ~/.vim/.vimxfer

"设置字体
set guifont=Consolas:h14:cANSI

"设置搜索高亮 "取消请使用set nohlsearch
set hlsearch

" 关闭.swp 文件
set noswapfile


"去掉讨厌的有关vim一致性模式,避免以前版本的一些bug和局限.
set nocompatible  

"否则无法使用退格键
set backspace=indent,eol,start

"开启语法高亮
syntax on

set nu

"设置命令历史记录为10条. 
set history=100
 

"依据上面的对起格式，智能的选择对起方式，对于类似C语言编.
"set smartindent 
 

"设置替换tab键 [缩进]
set expandtab

"设置tab键为4个空格.
set tabstop=4
set softtabstop=4

"设置当行之间交错时使用4个空格
set shiftwidth=4

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch   

"搜索选项.(比如,键入"/bo",光标自动找到第一个"bo"所在的位置.)
set noincsearch

"字符集
set fileencodings=ucs-bom,utf-8,chinese,cp936





"自动缩进
"set autoindent 
"C风格缩进
set cindent



if &term=="xterm"
set t_Co=8
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif

"""""""""""""""""""""""""""""""""""""" 自定义快捷键 
"定义 mm返回最新修改的位置
map mm '.zz
"定义组合映射快捷键
let mapleader = ","




"设置文件类型
"set filetype=go
set filetype=php
"set filetype=html


ab w3c <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><ESC>o<html xmlns="http://www.w3.org/1999/xhtml"><CR><head><CR><title>1</title><CR><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><CR><script src="http://cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js" type="text/javascript"></script><CR><style><CR>body,ul,ol,li,p,h1,h2,h3,h4,h5,h6,form,fieldset,td,img,div{margin:0;padding:0;border:0;}<CR>/*,table	notice:The table we often usered by develop so we exegesis,if you publish you software please move on top of style css*/<CR>body{margin-top:0px;}<CR>ul,ol{list-style-type:none;}<CR>select,input,img,select{vertical-align:middle;}<CR>.clearit{clear:both;}<CR></style><CR><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /><CR></head><CR><body><CR></body><CR></html><ESC>kO


"NERD Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile= $HOME . '/.vim/bookmark.txt' 	"书签保存位置
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nmap <silent> <leader>t :NERDTreeToggle<CR>

"开启书签
map <leader>m :Bookmark 


"定义,a在多个tab中切换
map <leader>a :tabp<CR>
map <leader>f :tabn<CR>



"切换标签
map <leader>w <C-W><C-W>


"ALT+2取消设置行号
map <leader>2 :set nonu<ENTER>

""ALT+3定义HTML注释
map <leader>3 O<!--<ESC>yyp2xA><ESC>ddpk

"ALT+4以/**/格式注释掉一行
map <leader>4 O/**<ESC>yyp2xA/<ESC>ddpk
"map  O/**<ESC>yyp2xA/<ESC>ddpk



"ALT+8在上一行加分隔线...
map <leader>8 O/*------------------------------------------------------------------------*/<ESC>j



"定义清屏快捷键
map <leader>; ggdG


"ALT+9在行尾加 //  废弃掉
"map <leader>z A		/**/<ESC>hi


"<leader>j插入下一部分
map <leader>j O/*------------------------------------------------------------------------*/<ENTER>/*----------------------                           -----------------------*/<ENTER>/*----------------------        The Next Part      -----------------------*/<ENTER>/*----------------------                           -----------------------*/<ENTER>/*------------------------------------------------------------------------*/<ESC>j 


"重新定义K 取消讨厌的帮助
map K k



"手动折叠
nmap <silent> <leader>q f{v%zf


"补全HTML标签
nmap <silent> <leader>e yiwh%a</><ESC>Pl%i




" 用空格键来开关折叠
set foldenable
set foldmethod=manual
"设置zf 自动增加折叠 下次打开代码还记录折叠
"set foldmethod=marker
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
map <leader>5 :set foldmethod=marker<ENTER>zR




"F9定义函数和类的注释 文件位置： 
"下载php-doc.vim  放到  ~/.vim/plugin/php-doc.vim
inoremap <F9> <ESC>:call PhpDocSingle()<CR>
nnoremap <F9> :call PhpDocSingle()<CR> 
vnoremap <F9> :call PhpDocRange()<CR> 





" Linux 利用临时文件来实现 复制 粘贴  , 必须在可视模式下 [可视模式: 使用v , 或者V  或者viw ..]
" ctrl+v 粘贴 
" ctrl+c 复制
" ctrl+x 剪切
for line in readfile($HOME . '/.vim/.vimxfer')
	if line == ''
		let vimxfer = 0
	else
		let vimxfer = 1
	endif
	break
endfor




"vi{gu  小写
"noremap <leader>y vi{guvi{<C-V>I`json:"<ESC>vi{<C-V>F<SPACE>A"`<ESC>vi{<C-V>F`yuu[{jp
noremap <leader>y vi{<C-V>:GoAddTags<ENTER>



imap <C-V> <ESC>:r $HOME/.vim/.vimxfer<CR>i
nmap <C-V> :r $HOME/.vim/.vimxfer<CR>
vmap <C-V> c<ESC>:r $HOME/.vim/.vimxfer<CR>

"必须在可视模式下复制
vmap <C-C> :w! $HOME/.vim/.vimxfer<CR>
"实现ctrl+x 剪切 , 利用vim书签来做
vmap <C-X> ma:w! $HOME/.vim/.vimxfer<CR>V'ad

"因为我们要替换掉ctrl+c为复制, ctrl+v 为粘贴 , 所以重新定义块操作为 ,v 
noremap <leader>v <C-V>

"重新定义ZZ , 同时清除复制缓存
map ZZ :!echo "" > $HOME/.vim/.vimxfer<CR>:wq<CR>




"去掉讨厌的有关vim一致性模式,避免以前版本的一些bug和局限.
"上面已经设置, 这里不需要再继续设置
":BundleList        - 列举列表(也就是.vimrc)中配置的所有插件
":BundleInstall     - 安装列表中的全部插件
":BundleInstall!    - 更新列表中的全部插件
":BundleSearch foo  - 查找foo插件
":BundleSearch! foo - 刷新foo插件缓存
":BundleClean       - 清除列表中没有的插件
":BundleClean!      - 清除列表中没有的插件
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
"colors
Plugin 'bluz71/vim-nightfly-colors'
Plugin 'joshdick/onedark.vim'

"替换vim-go中快捷键, gd左侧打开源码, gs 新窗口打开源码
Plugin 'relunctance/vim-godef'
Plugin 'relunctance/gotestfunc'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'

"超级注释插件
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/DoxygenToolkit.vim'

call vundle#end() 
"filetype plugin indent on
filetype plugin indent on


"颜色方案
"colorscheme   desert
"colorscheme  peachpuff
"colorscheme  molokai
"colorscheme  ron
"colorscheme  default
"colorscheme  delek
"colorscheme nightfly
colorscheme onedark

"vim-commentary
"gcc     注释当前行（普通模式）
"gc      可视模式下，注释当前选中的部分
"gcu     撤销上一次注释的部分，可以是一行也可以是多行
"gcgc    撤销注释当前行和邻近的上下两行
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,php,go,c,cpp set commentstring=//\ %s

""""""""""""""""""""""DoxygenToolkit golang 注释配置 """""""""""""""""""""""""""""""""""""

let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_startCommentTag = "// "
let g:DoxygenToolkit_startCommentBlock = "// "
let g:DoxygenToolkit_interCommentBlock = "// "
let g:DoxygenToolkit_interCommentTag = "// "
let g:DoxygenToolkit_endCommentTag = "// "
let g:DoxygenToolkit_endCommentBlock = "// "
let g:DoxygenToolkit_compactDoc = "no"
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre=""
let g:DoxygenToolkit_returnTag="return"
let g:DoxygenToolkit_python_autoRemoveSelfParam="no"
let g:DoxygenToolkit_python_autoFunctionReturn="no"
let g:DoxygenToolkit_authorName="gaoqilin"
let s:licenseTag = "Copyright (C) \<enter>\<enter>"
let s:licenseTag = s:licenseTag . "This program is free software; you can redistribute it and/or\<enter>"
let s:licenseTag = s:licenseTag . "modify it under the terms of the GNU General Public License\<enter>"
let s:licenseTag = s:licenseTag . "as published by the Free Software Foundation; either version 2\<enter>"
let s:licenseTag = s:licenseTag . "of the License, or (at your option) any later version.\<enter>\<enter>"
let s:licenseTag = s:licenseTag . "This program is distributed in the hope that it will be useful,\<enter>"
let s:licenseTag = s:licenseTag . "but WITHOUT ANY WARRANTY; without even the implied warranty of\<enter>"
let s:licenseTag = s:licenseTag . "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\<enter>"
let s:licenseTag = s:licenseTag . "GNU General Public License for more details.\<enter>\<enter>"
let s:licenseTag = s:licenseTag . "You should have received a copy of the GNU General Public License\<enter>"
let s:licenseTag = s:licenseTag . "along with this program; if not, write to the Free Software\<enter>"
let s:licenseTag = s:licenseTag . "Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.\<enter>"

"DoxygenToolkit 注释调用 f1 (键盘f建+1建)
"注释函数
map f1 [[:Dox<CR><ESC>
"License
map f2 gg:DoxLic<ESC>


" Tag list (tagbar)
" 
" 使用tagbar
nmap <silent> <leader>g :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'  
let g:tagbar_width = 60 


" 插入模式下 ctrl+j == ctrl+n
imap <C-J> <C-N>
imap <C-K> <C-P>


"定义,r :GoRun
map <leader>r :w<CR>:GoRun<CR>

"定义,r :GoDoc 打开帮助文档
map <leader>z :GoImports<CR>
"godef gd 右边新窗口打开
"let g:godef_command = '/usr/local/bin/go/godef'
"已修改go-def源码
"gd 左侧窗口打开
"gs 新窗口打开
"godef gd 相同页面左侧打开
let g:godef_split=3
" GoImplements 高度和宽度
let g:go_term_mode = "vsplit"
let g:go_term_height=20
let g:go_term_width = 20
let g:go_doc_max_height = 20
" g:go_list_height如果语法报错 , 能控制报错区域高度
let g:go_list_height = 5


" quickfix , locationlist
let g:go_list_type = "locationlist"
"定义,q 执行:GoImplements，显示当前类型实现的interface列表和实现的类情况
map <leader>q :GoImplements<CR>
" 用于查看通道在什么位置调用
map <leader>s :GoChannelPeers<CR>
let g:go_term_width=35

" 注意: 这里不要绝对路径, 必须使用gopath/src中的路径 , 否则报错 vim-go: guru: file xxx.go not found in loaded program
"let g:go_guru_scope = ['github.com/dgraph-io/dgraph/...']
" 查看函数会用在什么地方 , 相当于grep查找
map <leader>3 :GoReferrers<CR>
" 注意使用以下3个命令, 必须先配置g:go_guru_scope , 且不能报错 ,  如果出现'couldn't load packages due to errors' 说明go_guru_scope包中有错误
" 查看函数调用位置 ,  显示所选函数调用的可能目标
map <leader>1 :GoCallees<CR>
" 显示所选功能的可能调用者
map <leader>2 :GoCallers<CR>
" 查看函数调用完整调用栈 相当于debug栈, 过程可能较慢
map <leader>4 :GoCallstack<CR>
map <leader>c :GoIfErr<CR>kk
map <leader>d :call GoVimFindWord()<CR>






"定义,q 执行:GoImplements，显示当前类型实现的interface列表。
"map <leader>q :GoImplements<CR>


""""""""""""""""""""""" go 语言可执行的工具命令 """""""""""""""""""""""""""""""""""""""""
"--- 新起一行输入fmt.，然后ctrl+xo，Vim 会弹出补齐提示下拉框，不过并非实时跟随的那种补齐，这个补齐是由gocode提供的。
"--- 输入一行代码：time.Sleep(time.Second)，执行:GoImports，Vim会自动导入time包。
"--- 将光标移到Sleep函数上，执行:GoDef或命令模式下敲入gD，Vim会打开$GOROOT/src/time/sleep.go中 的Sleep函数的定义。执行:b 1返回到hellogolang.go。
"执行:GoLint，运行golint在当前Go源文件上。
"执行:GoDoc，打开当前光标对应符号的Go文档。
"执行:GoVet，在当前目录下运行go vet在当前Go源文件上。
"执行:GoRun，编译运行当前main package。
"执行:GoBuild，编译当前包，这取决于你的源文件，GoBuild不产生结果文件。
"执行:GoInstall，安装当前包。
"执行:GoTest，测试你当前路径下地_test.go文件。
"执行:GoCoverage，创建一个测试覆盖结果文件，并打开浏览器展示当前包的情况。
"执行:GoErrCheck，检查当前包种可能的未捕获的errors。
"执行:GoFiles，显示当前包对应的源文件列表。
"执行:GoDeps，显示当前包的依赖包列表。
"执行:GoImplements，显示当前类型实现的interface列表。
"执行:GoRename [to]，将当前光标下的符号替换为[to]。
"执行:GoImports 自动搜索并导入包
"块模式下执行:GoAddTags 自动补全JSON信息

"保留折叠：
"（1）要下一次打开的时候还保留折叠可以在离开的时候:mkview，再进来的时候:loadview就可以了。
"（2）当然也可以将这两句加到vimrc里面让其自动完成。
"每次关闭的时候自动保存折叠 , 和tagbar 中 BufWinLeave 冲突
"au BufWinLeave * mkview
"下次进来时保留折叠
"au BufWinEnter * silent loadview



"定义自动化提示 可用于go语言中提示函数
imap <C-L> <C-X><C-O>
"inoremap <c-o> <c-x><c-o>

" YouCompleteMe 配置
let g:ycm_server_python_interpreter='/usr/local/bin/python3'
" Note that you can install YCM with both libclang and clangd enabled. In that case clangd will be preferred unless you have the following in your vimrc:
"let g:ycm_use_clangd = 0
""寻找全局配置文件
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:ycm_log_level = 'debug'
set completeopt=longest,menu

map <leader>d :call GoVimFindWord()<CR>
" 检索项目目录
let g:govim_find_func_path="~/web/"


"autocmd FileType vue
"au BufRead,BufNewFile *.vue set filetype=vue
"autocmd FileType vue nnoremap  ff :call Hello()<CR>


"扩展和延伸窗口大小
nmap <leader><Up> :resize +20<CR>
nmap <leader><Down> :resize -20<CR>
nmap <leader><Right> :vertical resize +20<CR>
nmap <leader><Left> :vertical resize -20<CR>



" 解决mac无法复制内容到剪切板问题

" mac ctrl+c复制
" vmap <C-c> :w !pbcopy<CR><CR>
" mac ctrl+v粘贴 , 此命令与command+v一样 所以可以忽略
" nmap <C-v> :r !pbpaste<CR><CR>
