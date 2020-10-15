package com.ds.face.utils;

import java.net.URI;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;

import com.alibaba.fastjson.JSONObject;
import com.ds.face.exception.HttpConnectionException;

import lombok.extern.slf4j.Slf4j;

/**
 * HTTP 请求工具类
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年7月23日
 */
@Slf4j
public class HttpConnectionUtils {

    private HttpConnectionUtils() {

    }

    /**
     * post 请求封装
     * 
     * @param value
     * @param URL
     * @return
     */
    public static JSONObject post(final Object value, String URL) {

        if (!StringUtils.isNotBlank(URL)) {
            return null;
        }
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(Inclusion.NON_EMPTY);
        String requestJson = null;
        try {

            requestJson = objectMapper.writeValueAsString(value);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        log.info("requestJson:{}", requestJson);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<String> entity = new HttpEntity<String>(requestJson, headers);
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setConnectTimeout(180000);// 设置超时
        requestFactory.setReadTimeout(180000);
        RestTemplate restTemplate = new RestTemplate(requestFactory);
        log.info("URL:{}", URL);
        ResponseEntity<String> response = restTemplate.exchange(URL, HttpMethod.POST, entity, String.class);

        Integer code = response.getStatusCode().value();
        if (200 != code) {
            throw new HttpConnectionException("访问上游系统失败");
        }
        JSONObject body = new JSONObject().parseObject(response.getBody());
        log.info("body:{}", body);
        return body;
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
            throw new HttpConnectionException("访问上游系统失败");
        }
        JSONObject body = new JSONObject().parseObject(response.getBody());
        log.info("body:{}", body);
        return body;
    }

    /**
     * delete请求封装
     * 
     * @param URL
     * @param map
     * @return
     */
    public static JSONObject delete(final String URL, Map<String, Object> map) {
        if (!StringUtils.isNotBlank(URL)) {
            return null;
        }
        log.info("URL:{}", URL);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<String> entity = new HttpEntity<String>(null, headers);
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setConnectTimeout(180000);// 设置超时
        requestFactory.setReadTimeout(180000);
        RestTemplate restTemplate = new RestTemplate(requestFactory);
        ResponseEntity<String> response = restTemplate.exchange(URL, HttpMethod.DELETE, entity, String.class, map);
        Integer code = response.getStatusCode().value();
        if (200 != code) {
            throw new HttpConnectionException("访问上游系统失败");
        }
        JSONObject body = new JSONObject().parseObject(response.getBody());
        log.info("body:{}", body);
        return body;
    }
}
