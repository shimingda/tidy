**插件篇--maven**

（只整干货）

Maven官网：[https://maven.apache.org/（下载，安装，配置环境变量）](https://maven.apache.org/%EF%BC%88%E4%B8%8B%E8%BD%BD%EF%BC%8C%E5%AE%89%E8%A3%85%EF%BC%8C%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F%EF%BC%89)

中央仓库下载：http://repo1.maven.org/maven2/

Maven是干啥的？

就是管理项目用的工具。Maven还为全世界的Java开发者提供了一个免费的中央仓库，只要定位了坐标

Maven目录结构

既然管理项目，就应该与项目结合在一起说，创建一个maven企业级项目，我们看一下目录特征：

| 路径               | 说明               |
| ------------------ | ------------------ |
| src                | 源码目录           |
| src/main           | 源码主目录         |
| src/test           | 测试源码主目录     |
| src/main/java      | java源文件目录     |
| src/main/resources | 资源目录           |
| src/main/webapp    | 前端资源目录       |
| src/test/java      | 测试java源文件目录 |
| src/test/resources | 测试资源文件目录   |
| README.md          | 项目描述           |
| pom.xml            | maven项目定义      |
| LICENSE.txt        | 版本声明           |
| CHANGELOG.md       | 更变日志           |
| support            | 附加支持工具       |
| tools              | 附加工具           |
| bin                | 有用脚本           |
| target             | 构建输出目录       |

Maven坐标解释

```
<groupId>com.baidu.checker</groupId>
    <artifactId>checker-bill-</artifactId>
    <version>0.2.1</version>
<packaging>pom</packaging>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

groupId:定义当前maven是项目隶属的实际工程，与java包命名基本相似，通常和域名相反。

artifactId:该元素定义实际项目的一个版块，通常以实际项目名称作为前缀

version:该元素定义maven当前版本

packaging：该元素定义maven打包方式pom、jar、war 

其中groupId，artifactId，version 是必须定义的，packaging是可选的，打包的默认值。

初步分析pom.xml

```
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"        
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"         
 xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven4.0.0.xsd">   
<modelVersion>4.0.0</modelVersion>    
<!--坐标定位-->
<groupId>com.baidu.check</groupId>   
<artifactId>check-bill</artifactId>   
<!--版本迭代特别快的时候使用快照版本-SNAPSHOT-->
<version>1.0-SNAPSHOT</version> 
<packaging>war</packaging> 
 <build>      
      <finalName>project-test</finalName>  <!---不必要但是推荐添加-->
</build>   
<!-- 属性配置 --> 
<properties>                                                                                  
     <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding> 
 </properties>  
  <!-- 依赖配置 -->    
   <dependencies>   
 <!-- 添加JUnit -->  
     <dependency>    
         <groupId>junit</groupId> 
         <artifactId>junit</artifactId>    
          <version>3.8.1</version>   
          <scope>test</scope> <!--依赖范围-->
           <optional> false</optional><!--是否允许继承-->
 </dependency>
    <!--版本统一控制-->
    <properties> 
         <org.springframework.version>4.3.5.RELEASE</org.springframework.version>
    </properties>
    <!--spring-begin-->
    <dependency>  
         <groupId>org.springframework</groupId> 
         <artifactId>spring-webmvc</artifactId>    
        <version>${org.springframework.version}</version>
    </dependency>
    <dependency>    
          <groupId>org.springframework</groupId>  
          <artifactId>spring-aop</artifactId>  
           <version>${org.springframework.version}</version>
    </dependency>
    <dependency>   
            <groupId>org.springframework</groupId>  
            <artifactId>spring-aspects</artifactId> 
             <version>${org.springframework.version}</version>
    </dependency>
    <dependency>   
          <groupId>org.springframework</groupId>  
          <artifactId>spring-beans</artifactId> 
          <version>${org.springframework.version}</version>
    </dependency>
    <dependency>  
              <groupId>org.springframework</groupId>
              <artifactId>spring-context</artifactId>
              <version>${org.springframework.version}</version>
    </dependency>
    <dependency>  
           <groupId>org.springframework</groupId>
           <artifactId>spring-context-support</artifactId>
           <version>${org.springframework.version}</version>
    </dependency>
    <dependency>  
         <groupId>org.springframework</groupId> 
         <artfactId>spring-core</artifactId> 
         <version>${org.springframework.version}</version> 
    <!--禁止传递依赖-->
         <exclusions>  
                <exclusion>       
                      <artifactId>commons-logging</artifactId>          
                      <groupId>commons-logging</groupId>
                </exclusion>  
         </exclusions>
    </dependency>
    <dependency> 
          <groupId>org.springframework</groupId>
          <artifactId>spring-expression</artifactId>
          <version>${org.springframework.version}</version>
    </dependency>
    <dependency>  
         <groupId>org.springframework</groupId>
         <artifactId>spring-jdbc</artifactId>  
        <version>${org.springframework.version}</version>
    </dependency>
    <dependency> 
        <groupId>org.springframework</groupId>   
        <artifactId>spring-tx</artifactId>   
        <version>${org.springframework.version}</version>
    </dependency>
    <dependency>  
          <groupId>org.springframework</groupId>
          <artifactId>spring-web</artifactId>
         <version>${org.springframework.version}</version>
    </dependency>
    <!--spring-end-->
   </dependencies>
</project>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

**scope**

​    maven认为，程序对外部的依赖会随着程序的所处阶段和应用场景而变化，所以maven中的依赖关系有作用域(scope)的限制。 

​    scope包含如下的取值：compile（编译范围）、provided（已提供范围）、runtime（运行时范围）、test（测试范围）、system（系统范围） 

**optional**

​    设置指依赖是否可选，默认为false,即子项目默认都继承:为true,则子项目必需显示的引入，与dependencyManagement里定义的依赖类似  

### maven指令

| Maven普通常用命令列表  |                                                              |
| ---------------------- | ------------------------------------------------------------ |
| 指令名称               | 指令含义                                                     |
| mvn –version           | 显示版本信息                                                 |
| mvn clean              | 清理项目生产的临时文件,一般是模块下的target目录              |
| mvn compile            | 编译源代码，一般编译模块下的src/main/java目录                |
| mvn package            | 项目打包工具,会在模块下的target目录生成jar或war等文件        |
| mvn test               | 测试命令,或执行src/test/java/下junit的测试用例.              |
| mvn install            | 将打包的jar/war文件复制到你的本地仓库中,供其他模块使用       |
| mvn deploy             | 将打包的文件发布到远程参考,提供其他人员进行下载依赖          |
| mvn site               | 生成项目相关信息的网站                                       |
| mvn eclipse:eclipse    | 将项目转化为Eclipse项目                                      |
| mvn dependency:tree    | 打印出项目的整个依赖树                                       |
| mvn archetype:generate | 创建Maven的普通java项目                                      |
| mvn tomcat:run         | 在tomcat容器中运行web应用                                    |
| mvn jetty:run          | 调用 Jetty 插件的 Run 目标在 Jetty Servlet 容器中启动 web 应用 |
|mvn dependency:purge-local-repository|清理本地依赖|

 

在pom.xml中配置skip属性

```
<build>  
 <plugins>    
   <plugin>     
       <groupId>org.apache.maven.plugins</groupId>  
        <artifactId>maven-surefire-plugin</artifactId>   
        <version>2.18.1</version>   
       <configuration>           
                <skipTests>true</skipTests>      
        </configuration>    
  </plugin> 
</plugins>
</build>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

打包发布

mvn clean package -Dmaven.test.skip=true -Pdev -U

安装构件到本地仓库

mvn clean install -Dmaven.test.skip=true -Pdev -U

发布构件到远程仓库

mvn clean deploy -Dmaven.test.skip=true -Pdev -U

 

### 聚合与继承

聚合

在使用Maven的过程中，手边可能有很多个项目，都需要打包，或者同时进行一些操作，这时候，如果一个一个手动的去操作，就会显得很麻烦。这时候，使用聚合就可以解决问题了。

 ![img](//img-blog.csdn.net/20180317211835903?watermark/2/text/Ly9ibG9nLmNzZG4ubmV0L3NtZDI1NzU2MjQ1NTU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

现在想将son-1和son-2同时进行打包，这个maven的聚合功能就可已满足需求。如果不会创建聚合项目请参考

<http://blog.csdn.net/smd2575624555/article/details/79586024>

son-1和son-2是正常项目，father是一个空项目，将son-1和son-2聚合到father项目中，通过打包father项目就可以打包son-1和son-2项目。pom.xml是通过modules这个标签实现的。

聚合项目father的pom.xml文件

```
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"         
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"         
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
http://maven.apache.org/xsd/maven-4.0.0.xsd">    
<modelVersion>4.0.0</modelVersion>    
<groupId>com.father.dome</groupId>   
<artifactId>father</artifactId>   
<packaging>pom</packaging>    
<version>1.0-SNAPSHOT</version>  
  <name>father</name>  
  <url>http://maven.apache.org</url> 
    <modules>  <!--聚合项目-->
      <module>son-one</module>   
      <module>son-two</module>   
    </modules>
</project>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

继承

继承的意思和java聚成意义相似，只不过maven继承的pom。继承的方式与添加所需要的jar差不多，通过parent标签实现的。

 ![img](//img-blog.csdn.net/20180317211900411?watermark/2/text/Ly9ibG9nLmNzZG4ubmV0L3NtZDI1NzU2MjQ1NTU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

项目继承pather项目pom文件如下：

```
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"         
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"         
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
http://maven.apache.org/xsd/maven-4.0.0.xsd">   
<modelVersion>4.0.0</modelVersion>    
<groupId>com.father.dome</groupId>   
<artifactId>dome-father</artifactId>   
<packaging>pom</packaging>    
<version>1.0-SNAPSHOT</version>  
  <name>father</name>  
  <url>http://maven.apache.org</url> 
 <dependencies>    
    <!-- 添加JUnit -->    
   <dependency>       
     <groupId>junit</groupId>     
     <artifactId>junit</artifactId>  
     <version>4.12</version>   
     <scope>test</scope> 
 </dependency>
</dependencies>
</project>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

项目继承son项目pom文件如下

```
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"         
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"         
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
http://maven.apache.org/xsd/maven-4.0.0.xsd">    
<modelVersion>4.0.0</modelVersion>    
<parent>  <!--项目继承--> 
 <groupId>com.father.dome</groupId>    
    <!--father项目一致--> 
    <artifactId>dome-father</artifactId>   
    <!--father项目一致--> 
    <version>1.0-SNAPSHOT</version>  
    <!--father项目一致--> 
 </parent>
    <groupId>com.son.dome</groupId>   
    <artifactId>dome-son</artifactId>   
    <packaging>pom</packaging>    
    <version>1.0-SNAPSHOT</version>  
    <name>son</name>  
    <url>http://maven.apache.org</url> 
</project>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

### 环境隔离

工程化项目组中开发时会有很多的项目部署环境，比如开发自测环境，测试环境，线上运行环境等等。maven实现了对不同环境进行隔离，不需要更改配置文件，避免出现问题。

三个环境隔离的pom.xml配置文件

 

```
<profile>     
 <!--测试环境 --> 
   <profile>     
     <id>uat</id
<profiles>
  <profile>    
        <!--开发环境 -->  
     <id>dev</id> <!--环境说明 -->  
     <properties>       
     <profile.folder>dev</profile.folder>   
     </properties>  
<activation>        
     <activeByDefault>false</activeByDefault><!--配置默认自动激活状态 -->  
     </activation>   
  <build>         
   <finalName>ROOT</finalName>  
   <resources>      <!--不同环境替换资源 -->  
      <resource>                     
        <directory>src/main/profiles/dev</directory>    
       </resource>       
    <resource>              
      <directory>src/main/resources</directory>      
    </resource>       
   </resources>   
      </build>  
</profile>  
     <properties>      
        <profile.folder>uat</profile.folder> 
     </properties>   
<build>       
     <finalName>ROOT</finalName>   
        <resources>   
           <resource>          
             <directory>src/main/profiles/uat</directory>                                              </resource>  
            <resource>      
              <directory>src/main/resources</directory>     
            </resource>   
       </resources>    
  </build>   
</profile>
   <!--生产环境 -->    
<profile>    
     <id>live</id>  
     <properties>        
     <profile.folder>live</profile.folder>   
     </properties> 
      <activation>        
          <activeByDefault>false</activeByDefault>  
     </activation>   
    <build>         
   <finalName>ROOT</finalName> 
          <resources>   
            <resource>          
              <directory>src/main/profiles/live</directory>    
           </resource>  
           <resource>              
             <directory>src/main/resources</directory>   
           </resource>            
        </resources>    
  </build> 
 </profile>
</profiles>
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

使用不同环境进行项目打包：

mvn clean package -Dmaven.test.skip=true -Pdev（环境）

 

在使用快照（SNAPSHOT）时，Maven 自动获取最新的快照版本。 

Maven 提供以下两种类型插件：

| 类型     | 描述                                                         |
| -------- | ------------------------------------------------------------ |
| 构建插件 | 在生成过程中执行，并在 pom.xml 中的<build/> 元素进行配置     |
| 报告插件 | 在网站生成期间执行，在 pom.xml 中的 <reporting/> 元素进行配置 |

以下是一些常见的插件列表：

| 插件     | 描述                                  |
| -------- | ------------------------------------- |
| clean    | 编译后的清理目标，删除目标目录        |
| compiler | 编译 Java 源文件                      |
| surefile | 运行JUnit单元测试，创建测试报告       |
| jar      | 从当前项目构建 JAR 文件               |
| war      | 从当前项目构建 WAR 文件               |
| javadoc  | 产生用于该项目的 Javadoc              |
| antrun   | 从构建所述的任何阶段运行一组 Ant 任务 |

```
<dependency>
         <groupId>ldapjdk</groupId>
         <artifactId>ldapjdk</artifactId>
         <scope>system</scope>
         <version>1.0</version>
         <systemPath>${basedir}\src\lib\ldapjdk.jar</systemPath>
      </dependency>
```