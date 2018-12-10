package com.rw.ssd.biz.utils;

import org.apache.commons.lang3.StringUtils;

import com.rw.ssd.biz.exception.BizError;
import com.rw.ssd.biz.exception.BizException;

/******************************************************************************
 * 
 * <p>
 * Description: 校验工具类，仅适用于uface项目，非通用工具
 * </p>
 * Project: com.rw.ssd.biz.utils.DateUtils: DateUtils.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
public class ValidateUtils {

    private ValidateUtils() {
    }

    public static void notBlank(final String chars) {
        if (chars == null || StringUtils.isBlank(chars)) {

            throw new BizException(BizError.BASICS_PARAM_EXCEPTION_CODE);
        }
    }

    public static void notNull(final Object object) {
        if (object == null) {

            throw new BizException(BizError.BASICS_PARAM_EXCEPTION_CODE);
        }
    }
}
