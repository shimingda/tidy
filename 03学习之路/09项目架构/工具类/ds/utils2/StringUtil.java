package com.ds.face.utils;

/**
 * String 工具类
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年7月23日
 */

public class StringUtil {

    private StringUtil() {

    }

    /**
     * 不为空
     * 
     * @param name
     * @param value
     */
    public static void notEmpty(final String name, final String value) {

        if (null == value || "".equals(value.trim())) {
            throw new NullPointerException("Parameter error:" + name + "  is not null");
        }
    }

    /**
     * 可转化为int类型
     * 
     * @param num
     */
    public static void isInteger(String num) {
        try {
            Integer.valueOf(num);
        }
        catch (Exception e) {
            throw new IllegalArgumentException(num + " is not an integer");
        }
    }
}
