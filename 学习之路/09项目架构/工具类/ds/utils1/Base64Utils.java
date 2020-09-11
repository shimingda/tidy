package com.rw.ssd.biz.utils;

import java.util.Base64;

import lombok.extern.slf4j.Slf4j;

/******************************************************************************
 * 
 * <p>
 * Description:Base64字符转化工具类 Base64<=>byte[]
 * </p>
 * Project: com.rw.ssd.biz.utils.Base64Utils: Base64Utils.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
@Slf4j
public class Base64Utils {

    private Base64Utils() {
    }

    public static byte[] decode(String base64) {
        byte[] data = null;
        try {

            data = Base64.getDecoder().decode(base64);
        } catch (Exception e) {

            log.error("Base64->byte[] error");
            return data;
        }

        return data;
    }

}
