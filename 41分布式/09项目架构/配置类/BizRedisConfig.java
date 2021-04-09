package com.rw.ssd.biz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.rw.ssd.biz.utils.cache.BizRedisTemplate;

/**
 * 
 * @ClassName: BizRedisConfig
 * @Description: redis配置
 *
 * @author shimingda@deepsense.cn
 * @version 创建时间：2019年2月12日
 *
 */
@Configuration
public class BizRedisConfig {

    @Bean
    public StringRedisTemplate stringRedisTemplate(RedisConnectionFactory redisConnectionFactory) {
        StringRedisTemplate redisTemplate = new StringRedisTemplate();
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        return redisTemplate;
    }

    @Bean
    public BizRedisTemplate redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        BizRedisTemplate redisTemplate = new BizRedisTemplate();
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        return redisTemplate;
    }
}
