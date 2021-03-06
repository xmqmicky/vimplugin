# 安装配置:

### 1. 安装vim中文帮助: 
	tar zxvf vimcdoc-1.5.0.tar.gz; 
	cd vimcdoc-1.5.0/; 
	./vimcdoc.sh -i; 

### 2. 安装cscope： 
	sudo apt-get install cscope; 

### 3. 安装 ctags: 
	tar zxvf ctags-5.8.tar.gz;
	cd ctags-5.8/; 
	./configure;
	make; 
	sudo make install;

	ps. 也可以用apt-get install 来安装ctags，但我们下面要用ctags工程做练习。
 
### 4. 安装 vim plugins: 
	./install.sh;
---
# 验证及用法:

## 我们使用ctags工程作为例子:
	cd ctags-5.8/;
	ctags -R;             // 生成tags文件。
	cscope -Rbkq;         // 生成cscope.* in out 文件
	vim main.c;           // 打开main.c
	normal模式输入【:set tags=./tags】        // 引入tags
	上述可直接按【F5键】生成并引入tags
	normal模式输入【:cs add ./cscope.out ./】 // 引入cscope
	上述可直接按【F4键】引入cscope，但其文件需要在外面cscope -Rbkq生成
	normal模式输入【wm】                      // 打开或关闭文件列表及符号列表
	normal模式输入【:e ant.c】                // 打开ant.c
	normal模式输入【crtl+w, ←】               // 切换到文件列表窗口
	normal模式输入【j】向下选择“debug.c”【Enter键】打开文件。
	normal模式输入【F12】                     // 切换debug.c和debug.h
	normal模式输入【crtl+w, ↑】               // 切换到文件标签
	normal模式输入【Tab键】                   //  切换选中main.c，回车打开main.c
	normal模式输入【F3键】，下方显示“Search for pattern:”输入“main”，【Enter键】，显示“Search in files: *”，输入“.c”,表示只搜索c文件，【Enter键】，出现搜索列表。
	normal模式输入【16G】，跳转到第16行，【Enter键】打开并定位到相应位置。
	向下移动，光标放在“cookedArgs *args”行上，输入【o】后，在本行下插入文本，输入“args”，按【Tab键】可补全“->”，再按【Tab键】，显示可选成员列表。按【ctrl+n或ctrl+p】进行上下选择，选中“item”(不要写分号)，按【Enter】输入。
	按【Esc键】退回到normal模式，输入【:w】保存文件，输入【:make】【Enter键】，编译出错，继续【Enter键】退回到编辑模式。可看到错误窗口（如果没有，输入【:cw】打开），在此窗口上下移动选中第三行，【Enter键】，定位到编辑器认为出错的地方。
	normal模式下输入【u】，进行撤销直到下方显示“已位于最旧的改变”，进行恢复，输入【:w】保存文件。【:make】进行编译。
	向下移动，光标放在“getredirection”接口上，输入【ctrl+shift+-】后，马上按【g】，跳转到此接口定义处。
	向右移动，光标放在“background_process”接口上，输入【ctrl+shift+-】后，马上按【c】，出现调用此接口的接口列表。若未打开，输入【:cw】打开。
	normal模式下输入【:qa】退出编辑。
---
# 补充备忘

	vimtutor：帮助教程，一定要执行一下
  
	vim中：
	:help 或F1键 帮助，:help C-w, 打开ctrl+w的帮助；
	/main 查找main，n为向下查找，N为向下查找；
	20G，跳到第20行；gg，跳到文件首部，G跳到文件末尾；
	... 基础命令在vimtutor中学习；
  
	mm   高亮本行
	%    跳转到配对的括号去
	[{   跳转到代码块的开头去(但要求代码块中'{'必须单独占一行)
	gD   跳转到局部变量的定义处
	''   跳转到光标上次停靠的地方, 是两个', 而不是一个"
	mx   设置书签,x只能是a-z的26个字母
	`x   跳转到书签处("`"是1左边的键)
	>>   增加缩进,"x>"表示增加以下x行的缩进
	<<   减少缩进,"x<"表示减少以下x行的缩进
	F6   跳转到上一个文件（对应命令为:bp）
	F7   跳转到下一个文件（对应命令为:bn）
	F9   两个文件来回切换（对应命令为:b#）
---
	$ ctags -R 创建tags文件
	vim中
	:set tags=xxxxxx/tags ，加入tags文件。
	在接口名称上<C-]>，跳转到定义。<C-T>，跳回。
	$ ctags -R 更新tags
---
	wm 打开，关闭文件和符号窗口。
  
	文件列表窗口，常用：
	<F1>  显示帮助
	<cr>  如果光标下是目录, 则进入该目录; 如果光标下文件, 则打开该文件
	-     返回上级目录
	c     切换vim 当前工作目录正在浏览的目录
	d     创建目录
	D     删除目录或文件
	i     切换显示方式
	R     文件或目录重命名
	s     选择排序方式
	x     定制浏览方式, 使用你指定的程序打开该文件
---
	$ cscope -Rbq 生成cscope文件
	:cs add xxxxx/cscope.out xxxxx 加入cscope文件
	"cscope find"的用法:
	cs find c|d|e|f|g|i|s|t name，即<C-_>再按相应字母数字
	 0 或 s    查找本 C 符号(可以跳过注释)
	 1 或 g    查找本定义
	 2 或 d    查找本函数调用的函数
	 3 或 c    查找调用本函数的函数
	 4 或 t    查找本字符串
	 6 或 e    查找本 egrep 模式
	 7 或 f    查找本文件8 或 i查找包含本文件的文件
	cs reset，<C-_>+r，更新。
---
	多文件标签窗口中：
	<Tab>   向前循环切换到每个buffer名上
	<S-Tab> 向后循环切换到每个buffer名上
	<Enter> 在打开光标所在的buffer
	d       删除光标所在的buffer

---
	切换c或h文件：F12或者
	:A    在新Buffer中切换到c/h文件
	:AS   横向分割窗口并打开c/h文件
	:AV   纵向分割窗口并打开c/h文件
	:AT   新建一个标签页并打开c/h文件
---
	查找命令，F3或：
	:Grep        按照指定的规则在指定的文件中查找
	:Rgrep       同上, 但是是递归的grep
	:GrepBuffer  在所有打开的缓冲区中查找
	:Bgrep       同上
	:GrepArgs    在vim的argument filenames (:args)中查找
	:Fgrep       运行fgrep
	:Rfgrep      运行递归的fgrep
	:Egrep       运行egrep
	:Regrep      运行递归的egrep
	:Agrep       运行agrep
	:Ragrep      运行递归的agrep
---
	Tab键或Ctrl+x Ctrl+o补全，以及：
	Ctrl+P        向前切换成员
	Ctrl+N        向后切换成员
	Ctrl+E        表示退出下拉窗口, 并退回到原来录入的文字
	Ctrl+Y        表示退出下拉窗口, 并接受当前选项
	Ctrl+X Ctrl+L 整行补全
	Ctrl+X Ctrl+N 根据当前文件里关键字补全
	Ctrl+X Ctrl+K 根据字典补全
	Ctrl+X Ctrl+T 根据同义词字典补全
	Ctrl+X Ctrl+I 根据头文件内关键字补全
	Ctrl+X Ctrl+] 根据标签补全
	Ctrl+X Ctrl+F 补全文件名
	Ctrl+X Ctrl+D 补全宏定义
	Ctrl+X Ctrl+V 补全vim命令
	Ctrl+X Ctrl+U 用户自定义补全方式
	Ctrl+X Ctrl+S 拼写建议

# 参考链接：

http://blog.csdn.net/namecyf/article/details/7787479
