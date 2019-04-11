package com.ds.face.utils;

import java.util.Base64;

import com.ds.face.exception.ControlledException;

/**
 * 特征校验
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年8月9日
 */
public class FeatureUtils {
    private static final int SIZE_1K = 1 * 1024;

    private FeatureUtils() {

    }

    public static void check(String feature) {
        byte[] imgData = Base64.getDecoder().decode(feature);
        long size = imgData.length;
        if (size < SIZE_1K) {
            throw new ControlledException(400, "INCOMPATIBLE_FEATURE", "Parameter error: incompatible feature");
        }
    }
}
