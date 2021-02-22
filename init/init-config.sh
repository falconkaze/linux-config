
#!/usr/bin/env bash

mkdir -p ~/bin

if [[ $(uname) == "Darwin" ]]; then
  brew install trash # 移动文件到回收站
  git clone https://github.com/minoki/InputSourceSelector.git ~/bin/ # 输入法切换工具
fi
