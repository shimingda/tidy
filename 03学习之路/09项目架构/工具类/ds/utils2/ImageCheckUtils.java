package com.ds.face.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Base64;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ds.face.exception.ControlledException;

/**
 * 图片工具类
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年8月9日
 */
public class ImageCheckUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(ImageCheckUtils.class);
    private static final int MIN_PIXEL = 48;
    private static final int MAX_PIXEL = 4096;
    private static final int SIZE_2M = 2 * 1024 * 1024; // NO _ BEGIN

    /**
     * 检查是否是图片
     * 
     * @param base64ImgData
     * @param errDetails
     * @return
     */
    public static boolean check(String base64ImgData, StringBuilder errDetails) {

        // check the input image size less than 2M
        byte[] imgData = Base64.getDecoder().decode(base64ImgData);
        long size = imgData.length;
        if (size > SIZE_2M) {
            throw new ControlledException(400, "INCOMPATIBLE_IMAGE",
                    "Parameter error:image data size is bigger than 2M");
        }
        ByteArrayInputStream in = new ByteArrayInputStream(imgData);
        BufferedImage image = null;
        try {
            image = ImageIO.read(in);
        }
        catch (IOException e) {
            throw new ControlledException(400, "INCOMPATIBLE_IMAGE",
                    "Parameter error: image format is not correct or unsupported");
        }

        if (null == image) {
            throw new ControlledException(400, "INCOMPATIBLE_IMAGE", "Parameter error: incompatible image");
        }
        int imgWidth = image.getWidth();
        int imgHeight = image.getHeight();
        if (imgWidth < MIN_PIXEL || imgWidth > MAX_PIXEL || imgHeight < MIN_PIXEL || imgHeight > MAX_PIXEL) {
            logErrorMsg("Parameter error:The image width or heidht is over the limit", errDetails);
            throw new ControlledException(400, "INCOMATIBLE_IMAGE",
                    "Parameter error:The image width or heidht is over the limit");
        }
        return true;
    }

    private static void logErrorMsg(String errMsg, StringBuilder errDetails) {
        LOGGER.error(errMsg);
        if (errDetails != null) {
            errDetails.append(errMsg);
        }
    }

}
