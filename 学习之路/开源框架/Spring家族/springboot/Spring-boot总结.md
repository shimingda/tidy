#Spring-boot总结

##注解

- @RequestMapping 注解提供路由信息。它告诉Spring任何来自"/"路径的HTTP请求都应该被映射到 home 方
- @RestController 注解告诉Spring以字符串的形式渲染结果，并直接返回给调用者。
- @GetMapping 等同于 @RequestMapping(method = RequestMethod.GET)
-  @PostMapping 等同于 @RequestMapping(method = RequestMethod.POST) 
- @PutMapping 等同于 @RequestMapping(method = RequestMethod.PUT) 
- @DeleteMapping 等同于 @RequestMapping(method = RequestMethod.DELETE)
-  @PatchMapping 等同于 @RequestMapping(method = RequestMethod.PATCH) 
- @PathVariable用来接收参数,如/path/001,可接收001作为参数
- @RequestAttribute用于访问由过滤器或拦截器创建的、预先存在的请求属性，效果等同与request.getAttrbute().
- @Component 最普通的组件，可以被注入到spring容器进行管理
- @Repository 作用于持久层
- @Service 作用于业务逻辑层
- @RequestParam 用来接收URL中的参数,如/param?id=001,可接收001作为参数
- @EnableAutoConfiguration 这个注解告诉Spring Boot根据添加的jar依赖猜测你想如何配置Spring。由于 spring-boot-starter-web 添加了Tomcat和Spring MVC，所以auto-configuration将假定你正在开发一个web应用并相应地对Spring进行设置。
- @SpringBootApplication 注解等价于以默认属性使用 @Configuration ， @EnableAutoConfiguration 和 @ComponentScan 。
- @ComponentScan批注，以扫描项目中添加的组件。
- @ControllerAdvice是一个注解，用于全局处理异常。
- @ExceptionHandler是一个注释，用于处理特定异常并将自定义响应发送到客户端
- @ResponseStatus(HttpStatus.BAD_REQUEST)
- @Service是服务组件(Service Components)注释的类文件。 这些类文件用于在不同的层中编写业务逻辑，与@RestController类文件分开

##项目运行加载

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



## 创建可执行jar

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
//随机内容
my.secret=${random.value}
my.number=${random.int}
my.bignumber=${random.long}
my.number.less.than.ten=${random.int(10)}
my.number.in.range=${random.int[1024,65536]}
//配置HTTPS
//文件中提供服务器端口:443，密钥存储文件路径，密钥存储密码，密钥存储类型和密钥别名。如下给出的代码 -
server.port: 443
server.ssl.key-store: keystore.p12
server.ssl.key-store-password: springboot
server.ssl.keyStoreType: PKCS12
server.ssl.keyAlias: tomcat
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

##三大组件

###拦截器

在Spring Boot中使用拦截器，可在以下情况下执行操作 -

- 在将请求发送到控制器之前
- 在将响应发送给客户端之前

要使用拦截器，需要创建支持它的@Component类，它应该实现HandlerInterceptor接口。

以下是在拦截器上工作时应该了解的三种方法 

- preHandle()方法 - 用于在将请求发送到控制器之前执行操作。此方法应返回true，以将响应返回给客户端。
- postHandle()方法 - 用于在将响应发送到客户端之前执行操作。
- afterCompletion()方法 - 用于在完成请求和响应后执行操作。

```
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 *自定义拦截器
 */
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
/**
 *注册拦截器
 */
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

###过滤器

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
      throws IOException, ServletException {
           log.info("doFilter 请求处理");
        //对request、response进行一些预处理
        // 比如设置请求编码
        // request.setCharacterEncoding("UTF-8");
        // response.setCharacterEncoding("UTF-8");
        //TODO 进行业务逻辑
         
        //链路 直接传给下一个过滤器
        chain.doFilter(request, response);
      }
   @Override
   public void init(FilterConfig filterconfig) throws ServletException {}
   }
```

###监听器

Listener是servlet规范中定义的一种特殊类。用于监听servletContext、HttpSession和servletRequest等域对象的创建和销毁事件。监听域对象的属性发生修改的事件。用于在事件发生前、发生后做一些必要的处理。一般是获取在线人数等业务需求。

```
@WebListener
@Slf4j
public class Customlister implements ServletRequestListener{
 
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        log.info("监听器：销毁");
    }
 
    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        log.info("监听器：初始化");
    }
 
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























