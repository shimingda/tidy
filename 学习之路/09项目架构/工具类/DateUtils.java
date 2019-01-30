package com.rw.ssd.biz.utils;

import java.util.Date;

/******************************************************************************
 * 
 * <p>
 * Description:时间类型工具类
 * </p>
 * Project: com.rw.ssd.biz.utils.DateUtils: DateUtils.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
public class DateUtils {
    private DateUtils() {
    }

    public static Long dateToStamp(Date date) {
        if (null == date) {
            return null;
        }
        Long stamp = date.getTime();
        return stamp;

    }

    public static Date stampToDate(Long stampToDate) {
        if (null == stampToDate || stampToDate < 1000) {
            return null;
        }
        Date date = new Date(stampToDate);

        return date;
    }
}
