# Linux必装工具

## percol
### 安装
```
$ git clone git://github.com/mooz/percol.git
$ cd percol
Then, run a command below.

$ sudo python setup.py install
```

### zsh支持
```
vi ~/.zshrc
将下面文本复制到.zshrc。

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

source ~/.zshrc
```

### pgrep、pkill增强
```
Interactive pgrep / pkill
Here is an interactive version of pgrep,
$ ps aux | percol | awk '{ print $2 }'
and here is an interactive version of pkill.
$ ps aux | percol | awk '{ print $2 }' | xargs kill


可以在~/.zshrc中加入如下脚本：

For zsh users, command versions are here (ppkill accepts options like -9).

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

```


## git

## curl、wget

## vi、vim

## lrzsz

```
rz、sz,文件上传下载
centos安装sz、rz
yum install lrzsz 
```

## JDK

## Python

## Lua

## Ruby

## Maven

## Tomcat 

## Nginx

## zookeeper

## wtool

## useful-cripts

## 开发工具、编译库
```
1)ubuntu
sudo apt-get update && sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
2)centos
yum install -y gcc gcc-c++ makepcre pcre-devel kernel-devel openssl-devel libnl-devel popt*
```

## sshd

## cheat
```
命令帮助。
#cheat命令需要python环境的支持，需要安装python和pip

yum install python-pip –y
pip install --upgrade pip
pip install cheat
#或者通过github安装

pip install docopt pygments appdirs
git clone git@github.com:chrisallenlane/cheat.git
cd cheat
python setup.py install

使用：
cheat top
cheat tar
```


## 压力测试工具
> abtest
> jmeter

