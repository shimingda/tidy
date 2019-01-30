package com.rw.ssd.biz.utils;

import java.util.Collection;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.rw.ssd.biz.exception.ParameterException;
import com.rw.ssd.commons.exception.UfaceError;

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

    /**
     * 字符不为空
     * 
     * @param chars
     */
    public static void notBlank(final String chars) {
        if (chars == null || StringUtils.isBlank(chars)) {

            throw new ParameterException(UfaceError.BASICS_PARAM_EXCEPTION_CODE);
        }
    }

    /**
     * 对象不为空
     * 
     * @param object
     */
    public static void notNull(final Object object) {
        if (object == null) {

            throw new ParameterException(UfaceError.BASICS_PARAM_EXCEPTION_CODE);
        }
    }

    /**
     * 集合不为空
     * 
     * @param collection
     */
    public static void notEtpty(final Collection<?> collection) {
        Boolean isNull = CollectionUtils.isEmpty(collection);
        if (isNull) {
            throw new ParameterException(UfaceError.BASICS_PARAM_EXCEPTION_CODE);
        }
    }

}
