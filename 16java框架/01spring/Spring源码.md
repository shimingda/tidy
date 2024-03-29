# Spring源码

## 核心内容

### IOC

- 获取一个bean
- 反射

	- 反射性能问题再出现10w个有效对象才会出现性能问题

### AOP

- org.springframework.beans.factory.config.BeanPostProcessor#postProcessAfterInitialization
- org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator#postProcessAfterInitialization
- org.springframework.aop.framework.AopProxy

	- org.springframework.aop.framework.CglibAopProxy

		- MethodInterceptor 

			- package org.springframework.cglib.proxy;

import java.lang.reflect.Method;

public interface MethodInterceptor extends Callback {
    Object intercept(Object var1, Method var2, Object[] var3, MethodProxy var4) throws Throwable;
}

		- Enhancer 
		- FastClass
	
	- org.springframework.aop.framework.JdkDynamicAopProxy
	
		- jdk动态代理，继承InvocationHandler 类实现invoke接口，使用Proxy类的newProxyInstance方法 生成代理子类，返回类型为新的子类向上转型，这时调用接口调用的是子类接口，达到前后切面效果

- aop是ioc的扩展功能 ，实现的原理分为反射，多台

## 核心组件

### BeanDefinition

- BeanDefinition读取器BeanDefinitionReader原理

### BeanPostProcessor

### BeanFactory

- 访问 Spring bean 容器的根接口，这个是访问bean的入口

### BeanFactoryPostProcessor

- @FunctionalInterface
public interface BeanFactoryPostProcessor {
    void postProcessBeanFactory(ConfigurableListableBeanFactory var1) throws BeansException;
}


	- ConfigurableListableBeanFactory 
	
		-  BeanDefinition getBeanDefinition(String var1) throws NoSuchBeanDefinitionException;

- org.springframework.beans.factory.support.BeanDefinitionRegistryPostProcessor

### org.springframework.context.annotation.ConfigurationClassParser#doProcessConfigurationClass

- 注入的核心方法

### aware接口

- aware接口可让bean容器进行属性赋值 

### ApplicationContext

- org.springframework.context.support.AbstractApplicationContext

	- org.springframework.context.support.AbstractApplicationContext#refresh

		- 核心内容
		- org.springframework.beans.factory.support.DefaultListableBeanFactory#preInstantiateSingletons()创建对象

			- org.springframework.beans.factory.support.AbstractBeanFactory#getBean(java.lang.String)
			- org.springframework.beans.factory.support.AbstractBeanFactory#doGetBean
			- org.springframework.beans.factory.support.AbstractBeanFactory#createBean

				- org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#createBean(java.lang.String, org.springframework.beans.factory.support.RootBeanDefinition, java.lang.Object[])

			- org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#doCreateBean
			- org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#createBeanInstance
			- org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#instantiateBean

				- org.springframework.beans.factory.support.SimpleInstantiationStrategy#instantiate(org.springframework.beans.factory.support.RootBeanDefinition, java.lang.String, org.springframework.beans.factory.BeanFactory)
				- org.springframework.beans.BeanUtils#instantiateClass(java.lang.reflect.Constructor<T>, java.lang.Object...)
				- java.lang.reflect.Constructor#newInstance

			- org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#populateBean

				- org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#applyPropertyValues

### org.springframework.beans.factory.config.PlaceholderConfigurerSupport

- 占位符替换类

### FactoryBean

- public interface FactoryBean<T> {

	String OBJECT_TYPE_ATTRIBUTE = "factoryBeanObjectType";

    //获取bean对象
	@Nullable
	T getObject() throws Exception;

	@Nullable
	Class<?> getObjectType();

	default boolean isSingleton() {
		return true;
	}
}

## 概念

### 实例化和初始化

- 实例化

	- 开辟空间 

- 初始化

	- 对于属性进行复制
	- 执行init方法

- 成品：完成实例化，完成初始化
半成品：完成实例化，未完成初始化
- 调用流程  getBean()->doGetBean()->createBean()->doCreateBean()->createBeanInteance()->populateBean()
- 默认单例，scope可改变
- 注入

	- 构造器

		- 无法解决

	- set注入 

### 循环依赖

- 创建过程中不包括aop，二级缓存可以 解决循环依赖
包含需要三级缓存才能解决aop
- 三级缓存做了什么

	- 代理对象覆盖原始对象
	- 什么时候创建代理对象

		- 三级缓存是lomdod表达式，使用表达式是为了每次获取对象判断是否是代理对象，如果需要代理对象返回代理对象，如果没有代理对象，返回原始对象

## 关键点

### 如何解决循环依赖

- 三级缓存

	- DefaultSingletonBeanRegistry

		- 	/** Cache of singleton objects: bean name to bean instance. */一级缓存
	private final Map<String, Object> singletonObjects = new ConcurrentHashMap<>(256);

	/** Cache of singleton factories: bean name to ObjectFactory. */三级缓存
	private final Map<String, ObjectFactory<?>> singletonFactories = new HashMap<>(16);

	/** Cache of early singleton objects: bean name to bean instance. */二级缓存
	private final Map<String, Object> earlySingletonObjects = new ConcurrentHashMap<>(16);

			- singletonObjects 
	
				- 存储实例化对象
	
			- earlySingletonObjects 
	
				- 存储初始化对象
	
			- singletonFactories 
	
				- 存labmod表达式
				- addSingletonFactory(beanName, () -> getEarlyBeanReference(beanName, mbd, bean));

- 提前暴露对象

### BeanFactory和FactoryBean区别

- 相同点

	- 用于创建对象

- 不同点

	- 1.BeanFactory创建对象标准流程，工厂流水线
2.FactoryBean按照特性穿件对象，私人定制

## spring源码问题

### spring程序是如何启动的

### spring是如何加载配置文件到应用程序的

### 核心接口BeanDefinitionReader

### 核心接口BeanFactory

### spring 的refresh方法

- 核心是13个方法

### BeanPostProcessor接口作用

## PostProcessor（增强器）

*XMind: ZEN - Trial Version*