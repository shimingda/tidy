# 启动原理run


##  springboot启动代码

```java
@SpringBootApplication
public class AppApplication {	
	public static void main( String[] args ){
   		SpringApplication.run(AppApplication.class, args);
	}
}
```

## 进入SpringApplication类的run（）方法


```java
//SpringApplication类的run方法
public static ConfigurableApplicationContext run(Class<?> primarySource, String... args) {
   return run(new Class[]{primarySource}, args);
}
//调用重写的方法
public static ConfigurableApplicationContext run(Class<?>[] primarySources, String[] args) {
    //由此可知启动类做了两个事情，一个是创建springapplication对象，再一个是执行run方法
    return (new SpringApplication(primarySources)).run(args);
}
```

由以上代码可知启动类做了两个事情：一个是创建springapplication对象，再一个是执行run方法



### 创建SpringApplication对象

#### new SpringApplication(primarySources)


```java
public SpringApplication(Class<?>... primarySources) {
this((ResourceLoader)null, primarySources);
}

public SpringApplication(ResourceLoader resourceLoader, Class<?>... primarySources) {
    this.sources = new LinkedHashSet();
    this.bannerMode = Mode.CONSOLE;
    this.logStartupInfo = true;
    this.addCommandLineProperties = true;
    this.addConversionService = true;
    this.headless = true;
    this.registerShutdownHook = true;
    this.additionalProfiles = new HashSet();
    this.isCustomEnvironment = false;
    this.lazyInitialization = false;
    this.resourceLoader = resourceLoader;
    Assert.notNull(primarySources, "PrimarySources must not be null");
    this.primarySources = new LinkedHashSet(Arrays.asList(primarySources));
    this.webApplicationType = WebApplicationType.deduceFromClasspath();
    this.setInitializers(this.getSpringFactoriesInstances(ApplicationContextInitializer.class));
    this.setListeners(this.getSpringFactoriesInstances(ApplicationListener.class));
    this.mainApplicationClass = this.deduceMainApplicationClass();
}
```
##### WebApplicationType.deduceFromClasspath();

- 加载应用类型

	- NONE

		- 该应用程序不应作为Web应用程序运行，也不应启动嵌入式Web服务器

	- SERVLET

		- 默认springboot启动上下文类型就是servlet

	- REACTIVE

		- 该应用程序应作为反应式Web应用程序运行，并应启动嵌入式反应式Web服务器 

##### this.getSpringFactoriesInstances(ApplicationContextInitializer.class)

- 初始化spring  factory

	- ＭETA-INF/spring.factories

##### this.getSpringFactoriesInstances(ApplicationListener.class)

- 初始化监听器

	- ＭETA-INF/spring.factories

##### this.deduceMainApplicationClass()

- 通过遍历 StackTrace 来查找到启动类

### run()方法

#### run（）方法源码

```
public ConfigurableApplicationContext run(String... args) { 
    StopWatch stopWatch = new StopWatch();
    stopWatch.start();
    ConfigurableApplicationContext context = null;
    Collection<SpringBootExceptionReporter> exceptionReporters = new ArrayList();
    this.configureHeadlessProperty();
    SpringApplicationRunListeners listeners = this.getRunListeners(args);
    listeners.starting();

    Collection exceptionReporters;
    try {
        ApplicationArguments applicationArguments = new DefaultApplicationArguments(args);
        ConfigurableEnvironment environment = this.prepareEnvironment(listeners, applicationArguments);
        this.configureIgnoreBeanInfo(environment);
        Banner printedBanner = this.printBanner(environment);
        context = this.createApplicationContext();
        exceptionReporters = this.getSpringFactoriesInstances(SpringBootExceptionReporter.class, new Class[]{ConfigurableApplicationContext.class}, context);
        this.prepareContext(context, environment, listeners, applicationArguments, printedBanner);
        this.refreshContext(context);
        this.afterRefresh(context, applicationArguments);
        stopWatch.stop();
        if (this.logStartupInfo) {
            (new StartupInfoLogger(this.mainApplicationClass)).logStarted(this.getApplicationLog(), stopWatch);
        }

        listeners.started(context);
        this.callRunners(context, applicationArguments);
    } catch (Throwable var10) {
        this.handleRunFailure(context, var10, exceptionReporters, listeners);
        throw new IllegalStateException(var10);
    }

    try {
        listeners.running(context);
        return context;
    } catch (Throwable var9) {
        this.handleRunFailure(context, var9, exceptionReporters, (SpringApplicationRunListeners)null);
        throw new IllegalStateException(var9);
    }
}
```

#### run()方法主要内容详解

- StopWatch stopWatch = new StopWatch();
stopWatch.start();
- 开启计时器
	
- this.configureHeadlessProperty();

	- 设置加载外设环境

-  SpringApplicationRunListeners listeners = this.getRunListeners(args);
 listeners.starting();

	- 获取监听器

- ApplicationArguments applicationArguments = new DefaultApplicationArguments(args);

	- 初始化环境
	- java -jar test.jar  --server.port=8888

		- 执行jar 参数server.port=8888
		- --server.port=8888

	- 初始化外部参数

- this.prepareEnvironment(listeners, applicationArguments)

	- 加载准备环境

		- 把外部环境加到系统运行环境中

- this.configureIgnoreBeanInfo(environment)

	- 配置忽略BeanInfo

- Banner printedBanner = this.printBanner(environment);

	- 创建输出内容
	- 类型

		- OFF
		- CONSOLE
		- LOG

- context = this.createApplicationContext();

	- SERVLET

		- org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext

	- REACTIVE

		- org.springframework.boot.web.reactive.context.AnnotationConfigReactiveWebServerApplicationContext

	- default

		- org.springframework.context.annotation.AnnotationConfigApplicationContext

- this.getSpringFactoriesInstances(SpringBootExceptionReporter.class, new Class[]{ConfigurableApplicationContext.class}, context);

	- ＭETA-INF/spring.factories

- this.prepareContext(context, environment, listeners, applicationArguments, printedBanner);
- this.refreshContext(context);

	- this.prepareRefresh();

		- 初始化一些配置属性，验证配置文件

	- ConfigurableListableBeanFactory beanFactory = this.obtainFreshBeanFactory();

		- 获取beanFactory

	- this.prepareBeanFactory(beanFactory);

		- 将context中的一些属性设置到beanFactory中

	- this.postProcessBeanFactory(beanFactory);

		- 注册Scope相关的类

	- this.invokeBeanFactoryPostProcessors(beanFactory);

		- 解析配置文件、生成所有的beanDefinitions

	- this.registerBeanPostProcessors(beanFactory);

		- 分类、排序、注册（注入）所有的BeanPostProcessors，用于处理 bean 的初始化流程

	-  this.initMessageSource();

		- 多语言转化

	-  this.initApplicationEventMulticaster();

		- 注册 applicationEventMulticaster

	-  this.onRefresh();

		- 主要创建并初始化容器

	- this.registerListeners();

		- 事件注册监听者

	- this.finishBeanFactoryInitialization(beanFactory);

		- 主要是初始化非懒加载单例

	- this.finishRefresh();

		- 主要是开启Web容器

- this.afterRefresh(context, applicationArguments);
-  (new StartupInfoLogger(this.mainApplicationClass)).logStarted(this.getApplicationLog(), stopWatch);

	- 开启日志

- this.callRunners(context, applicationArguments);

	- 执行启动后加载

-  listeners.running(context);



### 介绍getSpringFactoriesInstances()方法

这个方法全文出现三次

- 1.首先尝试从内存缓存中获取，如获取到就立即返回，没有则继续下面内容；
- 2.从类加载路径（的jar文件）中获取全部的spring.factories文件路径；
- 3.循环遍历读取这些文件中的键值对(K->List[V])；
- 4.将读取内容放入内存缓存，下次再调用这个方法时会优先从缓存中获取；
- 5.返回读取到的全部键值对集合（Map[K,List[V]]结构）。

