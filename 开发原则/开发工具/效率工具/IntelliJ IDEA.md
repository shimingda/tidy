# IDEA

[TOC]


## 不要使用IDEA内置OpenJDK
```
可能会造成jinfo pid时报jdk版本不兼容的问题。

如下操作：
按CMD+Shift+A，输入JDK，选择 Switch IDE boot JDk... 可以选择 JDK。

或者直接删除
删除IDEA内置的OPENJDK,删除${IDEA_HOME}/Contents/jre文件夹，重启。
```
## 内存优化
```
vi ${IDEA_HOME}/Contents/bin/idea.vmoptions

优化参数如下：

-server
-Xms750m
-Xmx750m
-XX:MaxMetaspaceSize=512m
-XX:ReservedCodeCacheSize=240m
-XX:+UseCompressedOops
```

