package com.ds.face.utils;

import com.ds.face.exception.ControlledException;

/**
 * 数字校验
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年8月9日
 */
public class NumberUtil {

    private NumberUtil() {

    }

    /**
     * 正整数
     * 
     * @param num
     */
    public static void isPositiveInteger(Integer num) {
        if (num < 1) {
            throw new ControlledException(400, "ERROR_BAD_PARAM", num + " is not a  positive integer");
        }
    }
}
