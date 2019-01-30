package com.rw.ssd.biz.utils;

import java.net.URI;

import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.rw.ssd.biz.exception.BizException;

import lombok.extern.slf4j.Slf4j;

/**
 * HTTP 请求工具类
 * 
 * @author shimingda@deepsense.cn
 */
@Slf4j
public class HttpConnectionUtils {

    private HttpConnectionUtils() {

    }

    /**
     * get请求封装
     * 
     * @param uriComponents
     * @return
     */
    public static JSONObject get(final UriComponents uriComponents) {
        if (null == uriComponents) {
            return null;
        }
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setReadTimeout(5000);
        requestFactory.setConnectTimeout(5000);
        RestTemplate restTemplate = new RestTemplate(requestFactory);
        URI uri = uriComponents.toUri();
        log.info(uri.toString());
        ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);
        Integer code = response.getStatusCode().value();
        if (200 != code) {
            throw new BizException("访问上游系统失败");
        }
        return JSON.parseObject(response.getBody());

    }

}
