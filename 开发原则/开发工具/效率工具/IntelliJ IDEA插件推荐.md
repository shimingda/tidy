# IntelliJ IDEA插件推荐

## GsonFormat

通过JSON字符串，生成POJO类

## Grep Console

自定义控制台输出样式和声音

## CodeGlance

## 翻译插件Translation

## Maven Helper

更加直观查看 Maven 依赖关系

## FindBugs

## CheckStyle

## Git Flow Integration

## String Manipulation

常用于驼峰命令和下划线命名之间的切换

## Properties to YAML Converter

把 Properties 格式转换成 YAML

## JD-IntelliJ

反编译工具。

## mybatis插件

```
Mybatis tools插件主要功能有：
1）提供Mapper接口方法与XML配置文件中对应SQL自由切换导航。
2）提供Mapper接口方法调用明细。

Mybatis plugin插件主要功能有：
1) 提供Mapper接口与配置文件中对应SQL的导航
2) 编辑XML文件时自动补全
3) 根据Mapper接口, 使用快捷键生成xml文件及SQL标签
4) ResultMap中的property支持自动补全，支持级联(属性A.属性B.属性C)
5) 快捷键生成@Param注解
6) XML中编辑SQL时, 括号自动补全
7) XML中编辑SQL时, 支持参数自动补全(基于@Param注解识别参数)
8) 自动检查Mapper XML文件中ID冲突
9) 自动检查Mapper XML文件中错误的属性值
1o) 支持Find Usage
11) 支持重构从命名
12) 支持别名
13) 自动生成ResultMap属性
快捷键:   Option + Enter(Mac) | Alt + Enter(Windows)

Mybatis Log plugin
  这是一个Intellij的插件，主要作用是把mybatis生成的PreparedStatement语句恢复成原始完整的sql语句。
它将用真实的参数值替换PreparedStatement语句的问号占位符。
通过 "Tools -> MyBatis Log Plugin" 这个菜单可以实时输出sql日志。
点击窗口左边的 "Filter" 按钮，可以过滤不想要输出的sql语句。
点击窗口左边的 "Format Sql" 按钮，可以格式化输出的sql语句。
前提条件：输出的sql日志必须包含"Preparing:"和"Parameters:"才能正常解析。

左边几个按钮的作用：
Filter: 过滤语句配置
Rerun: 重新启动
Stop: 停止输出
Format Sql: 格式化后续输出的Sql语句
Close: 关闭该窗口
效果参考 https://github.com/kookob/mybatis-log-plugin
```
