#SpringBoot

> 英文官网：https://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/
>
> 中文官网翻译https://www.breakyizhan.com/springboot/3413.html

​	以历代Spring Framework的进步为基础，Spring Boot实现了自动配置，这让Spring能够智能探 测正在构建何种应用程序，自动配置必要的组件以满足应用程序的需要。

##介绍	

​	Spring Boot提供了一种新的编程范式，能在最小的阻力下开发Spring应用程序。有了它， 你可以更加敏捷地开发Spring应用程序，专注于应用程序的功能，不用在Spring的配置上多花功夫，甚至完全不用配置。

1. 自动配置：针对很多Spring应用程序常见的应用功能，Spring Boot能自动提供相关配置。 
2. 起步依赖：告诉Spring Boot需要什么功能，它就能引入需要的库。 
3. 命令行界面：这是Spring Boot的可选特性，借此你只需写代码就能完成完整的应用程序， 无需传统项目构建。 
4. Actuator：让你能够深入运行中的Spring Boot应用程序，一探究竟。

##dome

​	简单是实现一个springboot的小例子，项目启动输出hello spring boot。首先创建一个maven项目，在pom文件内引入一下内容。

###pom.xml

```
  <!-- 使用spring-boot-starter-parent作为当前项目的parent可以享受到spring boot应用相关的一系列依赖(dependency)， 插件(plugins)等装备 -->(dependency)， 插件(plugins)等装备
  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.0.2.RELEASE</version>
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

##注解

- @RequestMapping 注解提供路由信息。它告诉Spring任何来自"/"路径的HTTP请求都应该被映射到 home 方
- @RestController 注解告诉Spring以字符串的形式渲染结果，并直接返回给调用者。
- @EnableAutoConfiguration 这个注解告诉Spring Boot根据添加的jar依赖猜测你想如何配置Spring。由于 spring-boot-starter-web 添加了Tomcat和Spring MVC，所以auto-configuration将假定你正在开发一个web应用并相应地对Spring进行设置。
- @SpringBootApplication 注解等价于以默认属性使用 @Configuration ， @EnableAutoConfiguration 和 @ComponentScan 。
- @ComponentScan批注，以扫描项目中添加的组件。
- @PathVariable批注用于定义自定义或动态请求URI。 请求URI中的Path变量定义为花括号{}，如下所示 -
- @ControllerAdvice是一个注解，用于全局处理异常。
- @ExceptionHandler是一个注释，用于处理特定异常并将自定义响应发送到客户端
- @ResponseStatus(HttpStatus.BAD_REQUEST)
- @Service是服务组件(Service Components)注释的类文件。 这些类文件用于在不同的层中编写业务逻辑，与@RestController类文件分开

##项目运行

​	@SpringBootApplication开启了Spring的组件扫描和Spring Boot的自动配置功能。实际上，@SpringBootApplication将三个有用的注解组合在了一起。Spring的@Configuration：标明该类使用Spring基于Java的配置。虽然本书不会写太多配置，但我们会更倾向于使用基于Java而不是XML的配置。
	Spring的@ComponentScan：启用组件扫描，这样你写的Web控制器类和其他组件才能被自动发现并注册为Spring应用程序上下文里的Bean。本章稍后会写一个简单的Spring MVC控制器，使用@Controller进行注解，这样组件扫描才能找到它。
	Spring Boot 的 @EnableAutoConfiguration ：这个不起眼的小注解也可以称为@Abracadabra，就是这一行配置开启了Spring Boot自动配置的魔力，让你不用再写成篇的配置了。

```
import org.springframework.boot.SpringApplication; 
import org.springframework.boot.autoconfigure.SpringBootApplication; 
@SpringBootApplication
public class ReadingListApplication { 
 public static void main(String[] args) { 
 SpringApplication.run(ReadingListApplication.class, args);
 } 
}
```

 运行指令：mvn spring-boot:run

###创建可执行jar

```
需要将 spring-boot-maven-plugin 添加到我们的pom.xml中。在dependencies节点下插入以下内容：
<build>
	<plugins>
		<plugin>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-maven-plugin</artifactId>
		</plugin>
	</plugins>
</build>
执行命令
mvn  package
mvn  install
java –jar <JARFILE>
java –jar --server.port=9000
```
## 测试项目运行

```
import org.junit.Test; 
import org.junit.runner.RunWith; 
import org.springframework.boot.test.SpringApplicationConfiguration; 
import org.springframework.test.context.junit4.SpringJUnit
import readinglist.ReadingListApplication; 
@RunWith(SpringJUnit4ClassRunner.class) 
@SpringApplicationConfiguration( classes = ReadingListApplication.class)
@WebAppConfiguration 
public class ReadingListApplicationTests { 
 	@Test 
 public void contextLoads() {
 	} 
} 
```

###Mock测试

```
@RunWith(SpringJUnit4ClassRunner.class) 
@SpringApplicationConfiguration( classes = ReadingListApplication.class) 
@WebAppConfiguration
public class MockMvcWebTests { 
@Autowired 
private WebApplicationContext webContext;
private MockMvc mockMvc; 

@Before 
public void setupMockMvc() { 
 mockMvc = MockMvcBuilders
 	.webAppContextSetup(webContext) 
	.build(); 
 } 
@Test 
public void homePage() throws Exception { 
 	mockMvc.perform(get("/readingList")) 
 	.andExpect(status().isOk()) 
 	.andExpect(view().name("readingList")) 
 	.andExpect(model().attributeExists("books")) 
 	.andExpect(model().attribute("books", is(empty()))); 
	} 
}
```





## Maven配置

​	Maven用户可以继承 spring-boot-starter-parent 项目来获取合适的默认设置。该父项目提供以下特性：
默认编译级别为Java 1.8

- 源码编码为UTF-8
- 一个依赖管理节点，允许你省略普通依赖的 标签，继承自 spring-boot-dependencies POM。
- 合适的资源过滤
- 合适的插件配置（exec插件，surefire，Git commit ID，shade）
- 针对 application.properties 和 application.yml 的资源过滤

```

 <properties>
      <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
      <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
      <java.version>1.8</java.version>
   </properties>
```

## 配置应用程序属性

###application.properties

```
server.port=8000
server.port=0//随机端口
#随机内容
my.secret=${random.value}
my.number=${random.int}
my.bignumber=${random.long}
my.number.less.than.ten=${random.int(10)}
my.number.in.range=${random.int[1024,65536]}
#日志
logging.pattern.level=info
logging.file=/spring-log.xml#配置日志路径
#配置HTTPS
#文件中提供服务器端口:443，密钥存储文件路径，密钥存储密码，密钥存储类型和密钥别名。如下给出的代码 -
server.port: 443
server.ssl.key-store: keystore.p12
server.ssl.key-store-password: springboot
server.ssl.keyStoreType: PKCS12
server.ssl.keyAlias: tomcat
#mysql
spring.datasource.url=jdbc:mysql://localhost:3306/db_table?useUnicode=true&characterEncoding=utf8
spring.datasource.username=root
spring.datasource.password=123456
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
#Oracle
spring.datasource.primary.url=jdbc:oracle:thin:@127.0.0.1:1521:db_table
spring.datasource.primary.username=root
spring.datasource.primary.password=root
spring.datasource.primary.driver-class-name=oracle.jdbc.OracleDriver
```

## 实体类

​	@Entity注解表明它是一个JPA实体，id属性加了@Id和@GeneratedValue注解，说明这个字段是实体的唯一标识，并且这个字段的值是自动生成的。

## 配置类

- @Configuration 类作为主要源

- @ComponentScan 注解自动收集所有的Spring组件，包括 @Configuration 类。

- @Import 注解可以用来导入其他配置类

###导入XML配置

@Configuration 类开始，使用附加的 @ImportResource 注解加载XML配置文件。

###自动配置

@EnableAutoConfiguration 或 @SpringBootApplication 注解添加到一个 @Configuration 类上来选择自动配置。

```
@Configuration 
@ConditionalOnClass({ DataSource.class, EmbeddedDatabaseType.class }) 
@EnableConfigurationProperties(DataSourceProperties.class) 
@Import({ Registrar.class, DataSourcePoolMetadataProvidersConfiguration.class }) 
public class DataSourceAutoConfiguration { 
protected static class JdbcTemplateConfiguration { 
 
@Autowired(required = false) 
private DataSource dataSource; 

@Bean 
 @ConditionalOnMissingBean(JdbcOperations.class) 
 public JdbcTemplate jdbcTemplate() { 
 	return new JdbcTemplate(this.dataSource); 
 	}
 } 
```



###禁用特定的自动配置

```
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.autoconfigure.jdbc.*;
import org.springframework.context.annotation.*;

@Configuration
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class MyConfiguration {
}

```

## 拦截器

在Spring Boot中使用拦截器，可在以下情况下执行操作 -

- 在将请求发送到控制器之前
- 在将响应发送给客户端之前

要使用拦截器，需要创建支持它的@Component类，它应该实现HandlerInterceptor接口。

以下是在拦截器上工作时应该了解的三种方法 

- preHandle()方法 - 用于在将请求发送到控制器之前执行操作。此方法应返回true，以将响应返回给客户端。
- postHandle()方法 - 用于在将响应发送到客户端之前执行操作。
- afterCompletion()方法 - 用于在完成请求和响应后执行操作。

```
import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;import org.springframework.web.servlet.HandlerInterceptor;import org.springframework.web.servlet.ModelAndView;
@Component
public class ProductServiceInterceptor implements HandlerInterceptor {
   @Override
   public boolean preHandle
      (HttpServletRequest request, HttpServletResponse response, Object handler) 
      throws Exception {

      System.out.println("Pre Handle method is Calling");
      return true;
   }
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, 
      Object handler, ModelAndView modelAndView) throws Exception {

      System.out.println("Post Handle method is Calling");
   }
   @Override
   public void afterCompletion
      (HttpServletRequest request, HttpServletResponse response, Object 
      handler, Exception exception) throws Exception {

      System.out.println("Request and Response is completed");
  	 }
   }
```

```

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Component;import org.springframework.web.servlet.config.annotation.InterceptorRegistry;import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@Component
public class ProductServiceInterceptorAppConfig extends WebMvcConfigurerAdapter {
   @Autowired
   ProductServiceInterceptor productServiceInterceptor;

   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(productServiceInterceptor);
   	}
   }
```

##过滤器

过滤器是用于拦截应用程序的HTTP请求和响应的对象。通过使用过滤器，可以在两个实例上执行两个操作 

- 在将请求发送到控制器之前
- 在向客户发送响应之前。

以下代码显示了带有@Component注解的Servlet过滤器实现类的示例代码。

```
@Component
public class SimpleFilter implements Filter {
   @Override
   public void destroy() {}
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain) 
      throws IOException, ServletException {}
   @Override
   public void init(FilterConfig filterconfig) throws ServletException {}
   }
```

## 调度/定时器

@EnableScheduling放在启动文件上

```
@SpringBootApplication
@EnableScheduling
public class DemoApplication {
   public static void main(String[] args) {
      SpringApplication.run(DemoApplication.class, args);
    }
  }
```



```
import java.text.SimpleDateFormat;import java.util.Date;import org.springframework.scheduling.annotation.Scheduled;import org.springframework.stereotype.Component;
@Component
public class Scheduler {
//注解用于在特定时间段内触发调度程序。每天上午9:00开始到每天上午9:59结束执行任务
   @Scheduled(cron = "0 * 9 * * ?")
//每一秒
@Scheduled(fixedRate = 1000)
//应用程序启动完成3秒后每秒执行一次任务的示例如下所示 
@Scheduled(fixedDelay = 1000, initialDelay = 3000)
   public void cronJobSch() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
      Date now = new Date();
      String strDate = sdf.format(now);
      System.out.println("Java cron job expression:: " + strDate);
   }}
```

## 全局异常处理

`@ExceptionHandler`是一个注释，用于处理特定异常并将自定义响应发送到客户端。使用以下代码创建`@ControllerAdvice`类来全局处理异常  



## 邮箱

###依赖

```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-mail</artifactId>
</dependency>
```

###工具方法

```
private void sendmail() throws AddressException, MessagingException, IOException {
   Properties props = new Properties();
   props.put("mail.smtp.auth", "true");
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.smtp.host", "smtp.gmail.com");
   props.put("mail.smtp.port", "587");

   Session session = Session.getInstance(props, new javax.mail.Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
         return new PasswordAuthentication("yiibai@gmail.com", "<your password>");
      }
   });
   Message msg = new MimeMessage(session);
   msg.setFrom(new InternetAddress("yiibai@gmail.com", false));
   msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("yiibai@gmail.com"));
   msg.setSubject("Spring Boot Yiibai email");
   msg.setContent("Spring Boot Yiibai email", "text/html");
   msg.setSentDate(new Date());
   MimeBodyPart messageBodyPart = new MimeBodyPart();
   messageBodyPart.setContent("Spring Boot Yiibai email", "text/html");

   Multipart multipart = new MimeMultipart();
   multipart.addBodyPart(messageBodyPart);
   MimeBodyPart attachPart = new MimeBodyPart();
   attachPart.attachFile("/var/tmp/image19.png");
   multipart.addBodyPart(attachPart);
   msg.setContent(multipart);
   Transport.send(msg);  
   }
```
> 

##常见模块

###SpringBoot Test

> 两个模块：spring-boot-test包含核心组件，spring-boot-test-autoconfigure为测试提供自动配置。 

###SpringBoot Web

> web应用都可以使用spring-boot-starter-web模块进行快速搭建和运行。 

###SpringBoot WebSocket

> Spring Boot为内嵌的Tomcat(8和7)，Jetty 9和Undertow提供WebSockets自动配置。 
>
> 需要添加`spring-boot-starter-websocket`模块 

###SpringBoot  JTA

> 以springboot形式实现JTA一共有三种方式，Atomikos ，Bitronix ，Narayana 。
>
> 其中Atomikos 是收费产品
>
> Narayana ，目前只有JBoss支持
>
> Bitronix使用spring-boot-starter-jta-bitronixstarter为项目添加合适的Birtronix依赖
>
> https://github.com/bitronix/btm/wiki/Transaction-manager-configuration

###Spring Security OAuth

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













