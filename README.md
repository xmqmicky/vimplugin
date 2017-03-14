# 安装配置:

1. 安装vim中文帮助:

  tar zxvf vimcdoc-1.5.0.tar.gz;
  
  cd vimcdoc-1.5.0/;
  
  ./vimcdoc.sh -i;
  
2. 安装cscope：

  sudo apt-get install cscope;
    
3. 安装 ctags:

  tar zxvf ctags-5.8.tar.gz;
  
  cd ctags-5.8/;
  
  ./configure;
  
  make;
  
  sudo make install;
   
4. 安装 vim plugins:

  tar zxvf vimplugin.tgz -C ~/;
   
# 验证及用法:

 我们使用ctags工程作为例子:

   cd ctags-5.8/;
   
   ctags -R;            // 生成tags文件。
   
   cscope -Rbq;         // 生成cscope.* in out 文件
   
   vim main.c;          // 打开main.c 
      
   normal模式输入【:set tags=./tags】				// 引入tags
   
   normal模式输入【:cs add ./cscope.out ./】			// 引入cscope
   
   normal模式输入【wm】						// 打开或关闭文件列表及符号列表
   
   normal模式输入【:e ant.c】						// 打开ant.c
   
   normal模式输入【crtl+w, ←】					// 切换到文件列表窗口
   
   normal模式输入【j】向下选择“debug.c”【Enter键】打开文件。
   
   normal模式输入【F12】						// 切换debug.c和debug.h
   
   normal模式输入【crtl+w, ↑】					// 切换到文件标签
   
   normal模式输入【Tab键】						//  切换选中main.c，回车打开main.c
   
   normal模式输入【F3键】，下方显示“Search for pattern:”输入“main”，【Enter键】，显示“Search in files: *”，输入“.c”,表示只搜索c文件，【Enter键】，出现搜索列表。
   
   normal模式输入【16G】，跳转到第16行，【Enter键】打开并定位到相应位置。
   
   向下移动，光标放在“cookedArgs *args”行上，输入【o】后，在本行下插入文本，输入“args”，按【Tab键】可补全“->”，再按【Tab键】，显示可选成员列表。按【ctrl+n或ctrl+p】进行上下选择，选中“item”(不要写分号)，按【Enter】输入。
   
   按【Esc键】退回到normal模式，输入【:w】保存文件，输入【:make】【Enter键】，编译出错，继续【Enter键】退回到编辑模式。可看到错误窗口（如果没有，输入【:cw】打开），在此窗口上下移动选中第三行，【Enter键】，定位到编辑器认为出错的地方。
   
   normal模式下输入【u】，进行撤销直到下方显示“已位于最旧的改变”，进行恢复，输入【:w】保存文件。【:make】进行编译。
   
   向下移动，光标放在“getredirection”接口上，输入【ctrl+shift+-】后，马上按【g】，跳转到此接口定义处。
   
   向右移动，光标放在“background_process”接口上，输入【ctrl+shift+-】后，马上按【c】，出现调用此接口的接口列表。若未打开，输入【:cw】打开。
   
   normal模式下输入【:qa】退出编辑。
   
# 参考链接：

http://blog.csdn.net/namecyf/article/details/7787479
