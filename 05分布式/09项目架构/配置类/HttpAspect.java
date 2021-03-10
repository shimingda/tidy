package com.rw.ssd.biz.config;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 
 * @ClassName: HttpAspect
 * @Description: 查看访问接口以及所带参数
 *
 * @author shimingda@deepsense.cn
 * @version 创建时间：2019年2月13日
 *
 */
@Aspect
@Component
public class HttpAspect {

    private final static Logger logger = LoggerFactory.getLogger(HttpAspect.class);
    Map<String, LinkedList<Long>> apiMap = new HashMap<>();
    LinkedList<Long> timeList = null;

    @Pointcut("execution(public * com.rw.ssd.biz.api.*.*(..))")
    public void log() {

    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint) throws Exception {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        HttpServletRequest request = attributes.getRequest();
        HttpSession session = request.getSession();
        session.invalidate();
        String sessionId = session.getId();

        StringBuffer url = request.getRequestURL();
        url.append(request.getMethod()).append(sessionId);

        // url method ip
        logger.info("请求访问url详情，url={}，method={}，ip={}", request.getRequestURL(), request.getMethod(),
                request.getRemoteAddr());
        // 类方法 参数
        logger.info("请求访问参数详情class_method={}, args={}",
                joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName(),
                joinPoint.getArgs());

    }

    @After("log()")
    public void doAfter() {

    }

    @AfterReturning(returning = "object", pointcut = "log()")
    public void doAfterReturning(Object object) {

    }

}
