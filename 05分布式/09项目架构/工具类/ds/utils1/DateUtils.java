package com.rw.ssd.biz.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.rw.ssd.commons.constant.BizServiceConstants;

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

    /**
     * 时间转为时间戳
     * 
     * @param date
     * @return
     */
    public static Long dateToStamp(Date date) {
        if (null == date) {
            return null;
        }

        return date.getTime();

    }

    /**
     * 时间戳转化为时间
     * 
     * @param stampToDate
     * @return
     */
    public static Date stampToDate(Long stampToDate) {
        if (null == stampToDate || stampToDate < 1000) {
            return null;
        }

        return new Date(stampToDate);
    }

    /**
     * 获取当天0点0时0秒
     * 
     * @return
     */
    public static Date getStartTimeOfDay() {
        Calendar cal = Calendar.getInstance();
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        return cal.getTime();
    }

    /**
     * 获取昨天的0点0时0秒
     */
    public static Date getStartTimeOfYesterday() {
        Calendar cal = Calendar.getInstance();
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        cal.add(Calendar.DATE, -1);
        return cal.getTime();
    }

    /**
     * 获取昨天的23点59时59秒
     */
    public static Date getEndTimeOfYesterday() {
        Calendar cal = Calendar.getInstance();
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
        cal.add(Calendar.DATE, -1);
        return cal.getTime();
    }

    /**
     * 获取本周周一
     * 
     * @return
     */
    public static Date getMondayOfThisWeek() {

        Calendar calendar = Calendar.getInstance();
        int day_of_week = calendar.get(Calendar.DAY_OF_WEEK) - 1;

        if (day_of_week == 0)
            day_of_week = 7;
        calendar.add(Calendar.DATE, -day_of_week + 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }

    /**
     * 获取本月第一天
     * 
     * @return
     */
    public static Date getStartDayOfMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 0);
        calendar.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }

    /**
     * 日期-->字符
     * 
     * @param date
     * @param format
     * @return
     */
    public static String format(Date date, String format) {
        if (null == date) {
            return null;
        }
        if (StringUtils.isBlank(format)) {
            format = BizServiceConstants.DateFormat.YYYY_MM_DD_HH_MM_SS;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    public static Date getStartMonthOfYear() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DAY_OF_MONTH, 0);// 设置为1号,当前日期既为本月第一天
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }

    public static Date getAYearAgo() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -11);
        calendar.set(Calendar.DAY_OF_MONTH, 0);// 设置为1号,当前日期既为本月第一天
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }

}
