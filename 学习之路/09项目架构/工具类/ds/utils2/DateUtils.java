package com.ds.face.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.ds.face.constant.DateConsts;
import com.ds.face.exception.ControlledException;

import lombok.extern.slf4j.Slf4j;

/**
 * 时间工具类
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年7月02日
 */
@Slf4j
public class DateUtils {

    private DateUtils() {

    }

    /**
     * 按照格式检查
     * 
     * @param dateStr
     * @param format
     */
    public static void CheckFormat(final String dateStr, final String format) {

        DateFormat formatter = new SimpleDateFormat(format);
        Boolean flag = false;
        try {
            Date date = formatter.parse(dateStr);
            System.out.println(date);
        }
        catch (Exception e) {
            log.error("时间格式转化错误");
            flag = true;
        }
        if (flag) {
            throw new ControlledException(400, "INCOMPATIBLE_DATE", "时间格式转化错误:非标准" + format + "格式");
        }
        if (format.equals(DateConsts.FORMAT_YYYY_MM_DD_HH_MM_SS)) {
            List<String> dates = Arrays.asList(StringUtils.split(dateStr, " "));
            checkDate(dates.get(0));
            checkTime(dates.get(1));
        }

    }

    /**
     * 检查yyyyMMdd
     * 
     * @param dateStr
     * 
     *            工具类检查支持判别闰年，平年月份
     */
    public static void checkDate(String dateStr) {
        String rexp = "((^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(10|12|0?[13578])([-\\/\\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(11|0?[469])([-\\/\\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(0?2)([-\\/\\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([3579][26]00)([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][0][48])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][0][48])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][2468][048])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][2468][048])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][13579][26])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][13579][26])([-\\/\\._])(0?2)([-\\/\\._])(29)$))";
        Pattern p = Pattern.compile(rexp);
        Matcher m = p.matcher(dateStr);
        boolean dateFlag = m.matches();
        if (!dateFlag) {
            log.error("时间格式转化错误");
            throw new ControlledException(400, "INCOMPATIBLE_DATE", "时间格式转化错误,非标准yyyy-MM-dd格式");

        }
        log.info("时间转化成功");
    }

    /**
     * 检查HH:mm:ss
     * 
     * @param timeStr
     */
    public static void checkTime(String timeStr) {
        String rexp = "(0?[0-9]|1\\d|2[0-3])(\\:(0?[0-9]|[1-5]\\d)){2}$";
        Pattern p = Pattern.compile(rexp);
        Matcher m = p.matcher(timeStr);
        boolean dateFlag = m.matches();
        if (!dateFlag) {
            log.error("时间格式转化错误");
            throw new ControlledException(400, "INCOMPATIBLE_DATE", "时间格式转化错误,非标准HH:mm:ss格式");

        }
        log.info("时间转化成功");
    }

    /**
     * 日期转时间戳 毫秒
     * 
     * @param s
     * @return
     */
    public static String dateToStamp(final String dateStr) {
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = simpleDateFormat.parse(dateStr);
        }
        catch (ParseException e) {

            e.printStackTrace();
        }
        long ts = date.getTime();
        res = String.valueOf(ts);
        return res;
    }

    /**
     * 日期转时间戳 秒
     * 
     * @param date_str
     * @param format
     * @return
     */
    public static String date2TimeStamp(final String dateStr, final String format) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return String.valueOf(sdf.parse(dateStr).getTime() / 1000);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 时间戳转日期 毫秒
     * 
     * @param seconds
     * @param format
     * @return
     */
    public static String timeStamp2Date(final Long seconds, String format) {
        if (seconds == null) {
            return "";
        }
        if (format == null || format.isEmpty()) {
            format = "yyyy-MM-dd HH:mm:ss";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date(seconds));
    }
}
