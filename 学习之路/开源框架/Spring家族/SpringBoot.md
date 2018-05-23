#SpringBoot

> 英文官网：https://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/
>
> 中文官网翻译https://www.breakyizhan.com/springboot/3413.html

​	以历代Spring Framework的进步为基础，Spring Boot实现了自动配置，这让Spring能够智能探 测正在构建何种应用程序，自动配置必要的组件以满足应用程序的需要。

##介绍	

​	Spring Boot提供了一种新的编程范式，能在最小的阻力下开发Spring应用程序。有了它， 你可以更加敏捷地开发Spring应用程序，专注于应用程序的功能，不用在Spring的配置上多花功 夫，甚至完全不用配置。

1. 自动配置：针对很多Spring应用程序常见的应用功能，Spring Boot能自动提供相关配置。 q
2. 起步依赖：告诉Spring Boot需要什么功能，它就能引入需要的库。 q
3. 命令行界面：这是Spring Boot的可选特性，借此你只需写代码就能完成完整的应用程序， 无需传统项目构建。 q 
4. Actuator：让你能够深入运行中的Spring Boot应用程序，一探究竟。

##dome

​	简单是实现一个springboot的小例子，项目启动输出hello spring boot。首先创建一个maven项目，在pom文件内引入一下内容。

###pom.xml

```
  <!-- 使用spring-boot-starter-parent作为当前项目的parent可以享受到spring boot应用相关的一系列依赖(dependency)， 插件(plugins)等装备 -->(dependency)， 插件(plugins)等装备
  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>1.2.5.RELEASE</version>
  </parent>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
    <！--添加spring-boot-starter-web这个依赖，则纯粹是我们希望构建一个独立运行的web应用而已
    (注意， 没有version元素定义，因为spring-boot-starter-parent
    已经提供了相应dependencyManagement)。-->
    <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
  </dependencies>
```

###HelloSpringApplication.java

```
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动项
 * 
 * @author Simon
 *
 */
@SpringBootApplication
public class HelloSpringApplication
{
    public static void main(String[] args) throws Exception
    {
        SpringApplication.run(HelloSpringApplication.class, args);
    }
}

```

###HelloController.java

```
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * controller
 * 
 * @author Simon
 *
 */
@Controller
public class HelloController
{
    @RequestMapping("/test")
    @ResponseBody
    String test()
    {
        return "hello Spring boot";
    }

}
```

执行HelloSpringApplication.java内的mian()方法，在浏览器上输入http://localhost:8080/test 可以看一输出效果“hello Spring boot ”。

spring-boot模块

 ```
           <module>spring-boot-starter</module>
           <module>spring-boot-starter-amqp</module>
           <module>spring-boot-starter-aop</module>
           <module>spring-boot-starter-batch</module>
           <module>spring-boot-starter-cloud-connectors</module>
           <module>spring-boot-starter-data-elasticsearch</module>
           <module>spring-boot-starter-data-gemfire</module>
           <module>spring-boot-starter-data-jpa</module>
           <module>spring-boot-starter-data-mongodb</module>
           <module>spring-boot-starter-data-rest</module>
           <module>spring-boot-starter-data-solr</module>
           <module>spring-boot-starter-freemarker</module>
           <module>spring-boot-starter-groovy-templates</module>
           <module>spring-boot-starter-hateoas</module>
           <module>spring-boot-starter-hornetq</module>
           <module>spring-boot-starter-integration</module>
           <module>spring-boot-starter-jdbc</module>
           <module>spring-boot-starter-jersey</module>
           <module>spring-boot-starter-jetty</module>
           <module>spring-boot-starter-jta-atomikos</module>
           <module>spring-boot-starter-jta-bitronix</module>
           <module>spring-boot-starter-logging</module>
           <module>spring-boot-starter-log4j</module>
           <module>spring-boot-starter-log4j2</module>
           <module>spring-boot-starter-mail</module>
           <module>spring-boot-starter-mobile</module>
           <module>spring-boot-starter-mustache</module>
           <module>spring-boot-starter-actuator</module>
           <module>spring-boot-starter-parent</module>
           <module>spring-boot-starter-redis</module>
           <module>spring-boot-starter-security</module>
           <module>spring-boot-starter-social-facebook</module>
           <module>spring-boot-starter-social-twitter</module>
           <module>spring-boot-starter-social-linkedin</module>
           <module>spring-boot-starter-remote-shell</module>
           <module>spring-boot-starter-test</module>
           <module>spring-boot-starter-thymeleaf</module>
           <module>spring-boot-starter-tomcat</module>
           <module>spring-boot-starter-undertow</module>
           <module>spring-boot-starter-velocity</module>
           <module>spring-boot-starter-web</module>
           <module>spring-boot-starter-websocket</module>
           <module>spring-boot-starter-ws</module>
 ```
简单了解几个：

##spring-boot-starter-web

> 默认SpringBoot会给Web应用配备Tomcat作为嵌入式web容器， 如果你不想用默认的tomcat，而想用jetty，那么可以再声明一个对spring-boot-starter-jetty的dependency，之后SpringBoot中使用的EnableAutoConfiguration会施展黑魔法，帮你搞定替换满足你的愿望。 

##spring-boot-starter-logging

>告诉SpringBoot， “给哥使用slf4j和logback！” 

##SpringBoot使用

###数据库连接 

> 连接数据库经过配置文件application.properties进行连接

####mysql

```
spring.datasource.url=jdbc:mysql://localhost:3306/db_table?useUnicode=true&characterEncoding=utf8
spring.datasource.username=root
spring.datasource.password=123456
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
```

####Oracle

```
spring.datasource.primary.url=jdbc:oracle:thin:@127.0.0.1:1521:db_table
spring.datasource.primary.username=root
spring.datasource.primary.password=root
spring.datasource.primary.driver-class-name=oracle.jdbc.OracleDriver
```

###注解

####@SpringBootApplication

> Spring Boot 应用的标识,启动项目入口

####@MapperScan("com.dome.dao")

>  mapper 接口类扫描包配置

####@Controller和@RestController有什么区别？

> @RestController注解相当于@ResponseBody ＋ @Controller合在一起的作用 

####@Autowired与@Resource有什么区别？

>@Autowired默认按类型装配（这个注解是属业spring的），默认情况下必须要求依赖对象必须存在，如果要允许null值，可以设置它的required属性为false 
>
>@Resource 是JDK1.6支持的注解**，**默认按照名称进行装配

####@RequestMapping

> 返回接口映射地址

####@Param("test") 

> 约定参数名称

####@Service

> 注入服务接口

####@Component和@Value("${test}")

> 配置文件内属性单个注入

####@Component和@ConfigurationProperties(prefix = "test")

> 将配置文件问属性整体注入

##SpringBoot Test

> 两个模块：spring-boot-test包含核心组件，spring-boot-test-autoconfigure为测试提供自动配置。 

### 排除测试配置

> Spring Boot提供了@TestComponent和@TestConfiguration注解，可用在src/test/java目录下的类，以暗示它们不应该被扫描。 

###@RunWith(SpringRunner.class)和@Test

> 运行测试类注解

##SpringBoot Web

> web应用都可以使用spring-boot-starter-web模块进行快速搭建和运行。 

##SpringBoot WebSocket

> Spring Boot为内嵌的Tomcat(8和7)，Jetty 9和Undertow提供WebSockets自动配置。 
>
> 需要添加`spring-boot-starter-websocket`模块 

##SpringBoot  JTA

> 以springboot形式实现JTA一共有三种方式，Atomikos ，Bitronix ，Narayana 。
>
> 其中Atomikos 是收费产品
>
> Narayana ，目前只有JBoss支持
>
> Bitronix使用spring-boot-starter-jta-bitronixstarter为项目添加合适的Birtronix依赖

###Bitronix 文档官网

> https://github.com/bitronix/btm/wiki/Transaction-manager-configuration

##Spring Security OAuth 

> 权限验证框架,基于springboot进行实现的

### 官网

> https://oauth.net/code/

###需要pom.xml引入资源

```
<dependencies>
    <!-- for OAuth 2.0 -->
    <dependency>
        <groupId>org.springframework.security.oauth</groupId>
        <artifactId>spring-security-oauth2</artifactId>
        <version>2.3.4.BUILD-SNAPSHOT</version>
    </dependency>
    <!-- for OAuth 1.0a -->
    <dependency>
        <groupId>org.springframework.security.oauth</groupId>
        <artifactId>spring-security-oauth</artifactId>
        <version>2.3.4.BUILD-SNAPSHOT</version>
    </dependency>
</dependencies><repositories>
    <repository>
        <id>spring-snapshots</id>
        <name>Spring Snapshots</name>
        <url>https://repo.spring.io/libs-snapshot</url>
        <snapshots>
            <enabled>true</enabled>
        </snapshots>
    </repository>
</repositories>
```

###github样例服务

> https://github.com/mitreid-connect/OpenID-Connect-Java-Spring-Server.git

###github Api查看

>https://github.com/OAuth-Apis/apis.git

### tokens引入

>https://github.com/zalando/tokens.git

###基于微服务

>https://github.com/networknt/light-oauth2.git













