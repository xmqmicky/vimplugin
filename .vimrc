set number

syntax enable
syntax on

colorscheme desert

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags

set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
set cst " 同时搜索cscope数据库和标签文件
set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
set nocsverb
if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
	cs add cscope.out
elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
	cs add $CSCOPE_DB
endif
set csverb

map <F9> :b#<CR>
imap <F9> <ESC>:b#<CR>

map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>r :cs reset

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavArrows = 1

nnoremap <silent> <F12> :A<CR>
nnoremap <silent> <F3> :Grep<CR>

filetype plugin indent on
set completeopt=longest,menu

let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" 设置按下<Tab>后默认的补全方式, 默认是<C-P>, 
" " 现在改为<C-X><C-O>. 关于<C-P>的补全方式, 
" " 还有其他的补全方式, 你可以看看下面的一些帮助:
" " :help ins-completion
" " :help compl-omni

set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数  
set ruler "在编辑过程中，在右下角显示光标位置的状态行
