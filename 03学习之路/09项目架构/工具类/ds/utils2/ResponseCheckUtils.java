package com.ds.face.utils;

import com.alibaba.fastjson.JSONObject;
import com.ds.face.exception.SuccessResponse;

/**
 * 请求响应结果检查类
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年7月23日
 */
public class ResponseCheckUtils {
    public static void checkError(final JSONObject json) {
        JSONObject error = null;
        try {
            error = json.getJSONObject("error");
        }
        catch (Exception e) {
            error = null;
        }
        if (null != error) {

            Object detail = error.get("detail");
            if (null != detail) {
                Object code = error.get("code");
                throw new SuccessResponse(200, code.toString(), detail.toString());
            }

        }
    }

    public static Boolean checkSearchResult(final JSONObject json) {
        JSONObject error = null;
        try {
            error = json.getJSONObject("error");
        }
        catch (Exception e) {
            error = null;
        }
        if (null != error) {
            Object code = error.get("code");
            if ("ES-FACE_SET_IS_EMPTY".equals(code)) {
                return true;
            }
            Object detail = error.get("detail");
            if (null != detail) {
                throw new SuccessResponse(200, code.toString(), detail.toString());
            }
        }
        return false;
    }
}
