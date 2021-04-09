package com.rw.ssd.biz.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/******************************************************************************
 * 
 * <p>
 * Description:Spring 的 ApplicationContext 的持有者,可以用静态方法的方式获取 spring 容器中的 bean
 * </p>
 * Project: com.rw.ssd.biz.utils.SpringContextHolder: SpringContextHolder.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
@ComponentScan
@Configuration
public class SpringContextHolder implements ApplicationContextAware {
    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }

    public static ApplicationContext getApplicationContext() {
        return context;
    }

    @SuppressWarnings("unchecked")
    public static <T> T getBean(String beanName) {
        return (T) context.getBean(beanName);
    }

    public static <T> T getBean(Class<T> requiredType) {
        return context.getBean(requiredType);
    }

}
