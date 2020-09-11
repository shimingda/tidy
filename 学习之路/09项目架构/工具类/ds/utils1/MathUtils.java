package com.rw.ssd.biz.utils;

import java.util.Collection;

import org.apache.commons.collections.CollectionUtils;

/**
 * @ClassName: MathUtils
 * @Description: 数学运算工具
 *
 * @author shimingda@deepsense.cn
 * @version 创建时间：2019年1月28日
 *
 */
public class MathUtils {
    /**
     * 加法
     * 
     * @param total
     * @return
     */
    public static long sum(Collection<Long> total) {

        if (CollectionUtils.isEmpty(total)) {
            return 0;
        }
        long sum = 0;
        for (Long single : total) {
            sum += single;
        }
        return sum;
    }
}
