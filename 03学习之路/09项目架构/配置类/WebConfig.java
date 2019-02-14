package com.rw.ssd.biz.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

/**
 * @ClassName: WebConfig
 * @Description: 项目静态资源配置，本地资源映射
 *
 * @author shimingda@deepsense.cn
 * @version 创建时间：2019年1月23日
 *
 */
@Slf4j
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Value("${alert.sound.path}")
    private String soundPath;

    /**
     * 添加静态资源文件，外部可以直接访问地址
     * 
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("alert.sound.path===>{}", soundPath);
        // sound
        registry.addResourceHandler("/alert/sound/**").addResourceLocations("file:" + soundPath).setCachePeriod(0);

    }

}
