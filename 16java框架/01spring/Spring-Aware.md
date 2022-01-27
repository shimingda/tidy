# Aware

bean实现了Aware系列接口可以访问Spring容器，其中涉及到bean的创建过程，其中包括BeanNameAware,BeanFactoryAware,ApplicationContextAware都有参与bean的创建。具体详情内容请查看【框架源码--spring bean]。

这些Aware系列接口增强了Spring bean的功能，但是也会造成对Spring框架的绑定，增大了与Spring框架的耦合度。

### 源码

```java
public interface Aware {

}
```

### 继承Aware

![image-20211209185234237](C:\Users\somin\AppData\Roaming\Typora\typora-user-images\image-20211209185234237.png)//