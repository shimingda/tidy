package com.ds.face.utils;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.ds.face.exception.ControlledException;

/**
 * 图片工具类
 * 
 * @author shimingda@deepsense.cn
 * @date 2018年7月02日
 */
public class ImageUtils {

    private ImageUtils() {

    }

    /**
     * 图片检验
     * 
     * @param image
     */
    public static void check(String image) {
        StringBuilder errDetails = new StringBuilder();
        boolean normal = ImageCheckUtils.check(image, errDetails);
        if (!normal) {
            throw new ControlledException(400, "INCOMPATIBLE_IMAGE", "Parameter error: incompatible image");
        }
    }

    /**
     * 切割图片
     * 
     * @param srcFile
     * @param dstFile
     * @param x
     * @param y
     * @param widthRange
     * @param heightRange
     */
    public static String cut(String BaseB4, int x, int y, int widthRange, int heightRange) {
        try {
            byte[] by = Base64.getDecoder().decode(BaseB4);
            InputStream is = new ByteArrayInputStream(by);
            ImageInputStream iis = ImageIO.createImageInputStream(is);
            Iterator<ImageReader> iterator = ImageIO.getImageReaders(iis);
            ImageReader reader = (ImageReader) iterator.next();
            reader.setInput(iis, true);
            ImageReadParam param = reader.getDefaultReadParam();
            Rectangle rectangle = new Rectangle(x, y, widthRange, heightRange);
            param.setSourceRegion(rectangle);
            BufferedImage image = reader.read(0, param);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", out);
            byte[] b = out.toByteArray();
            String CutBase64 = Base64.getEncoder().encodeToString(b);
            return CutBase64;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
