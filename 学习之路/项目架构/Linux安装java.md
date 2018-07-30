#Linux安装java

##创建文件夹

在服务器usr下创建目录java

##下载JDK包

> JDK下载官网 http://www.oracle.com/technetwork/java/javase/downloads/index.html

找到Linux版本文件，通过wget +下载地址。如 wget http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz?AuthParam=1530072379_cad4d4397afcbe80ab8d4b379217960e

下载tar.gz压缩包，将压缩包进行解压 tar -xzf +压缩包名称。如tar -xzf  jdk-8u171-linux-x64.tar.gz 将文件解压得到jdk1.8.0_171

##配置环境变量

###编辑环境配置指令

> vim /etc/profile

### 修改内容

```
JAVA_HOME=/usr/java/jdk1.8.0_171
JRE_HOME=/usr/java/jdk1.8.0_171/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
```

###使环境变量生效

> source /etc/profile

##检验安装结果

> 执行指令：java -version

```
java version "1.8.0_171"
Java(TM) SE Runtime Environment (build 1.8.0_171-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.171-b11, mixed mode)
```

安装成功