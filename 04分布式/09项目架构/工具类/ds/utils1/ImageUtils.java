package com.rw.ssd.biz.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;

import com.rw.ssd.code.ImageAccessType;
import com.rw.ssd.img.ImageAccess;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

/******************************************************************************
 * 
 * <p>
 * Description: 图片通用工具url<-->imageDatas
 * </p>
 * Project: Project: com.rw.ssd.biz.utils.ImageUtils: ImageUtils.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
@Slf4j
public class ImageUtils {

    private ImageUtils() {
    }

    /**
     * base64集合-->url集合
     * 
     */
    public static Queue<String> imageDatasToUrl(List<String> imageDatas) {
        ImageAccess imageAccess = SpringContextHolder.getBean(ImageAccess.class);

        if (null == imageDatas) {
            return null;
        }
        Queue<String> urls = new LinkedBlockingQueue<>();
        imageDatas.forEach(imageData -> {
            String finalImageData = new String();
            finalImageData = imageData;
            // if (imageDate.length() > 50 * 1024) {
            // finalImageDate = compress(imageDate);
            // System.out.println("图片在压缩");
            // }
            byte[] imgDataByte = Base64.getDecoder().decode(finalImageData);
            String faceUrl = imageAccess.saveImage(imgDataByte, ImageAccessType.UPLOAD.getValue());
            urls.add(faceUrl);
        });
        return urls;
    }

    /**
     * base64-->url
     * 
     */
    public static String imageDataToUrl(String imageData) {
        ImageAccess imageAccess = SpringContextHolder.getBean(ImageAccess.class);

        if (null == imageData) {
            return null;
        }
        String finalImageDate = new String();
        finalImageDate = imageData;
        // if (imageData.length() > 50 * 1024) {
        // finalImageDate = compress(imageData);
        // System.out.println("图片在压缩");
        // }
        byte[] imgDataByte = Base64.getDecoder().decode(finalImageDate);
        String faceUrl = imageAccess.saveImage(imgDataByte, ImageAccessType.UPLOAD.getValue());

        return faceUrl;
    }

    /**
     * 通过base64集合得到url
     */
    public static String getUrl(List<String> imageDatas) {
        if (null == imageDatas) {
            return null;
        }
        Queue<String> urls = imageDatasToUrl(imageDatas);
        String finalUrl = StringUtils.join(urls, ",");
        return finalUrl;
    }

    /**
     * url集合-->base64集合
     * 
     */
    public static List<String> getAllImage(String faceUrl) {
        ImageAccess imageAccess = SpringContextHolder.getBean(ImageAccess.class);

        if (null == faceUrl) {
            return null;
        }
        List<String> imageDatas = new ArrayList<String>();

        List<String> urls = Arrays.asList(StringUtils.split(faceUrl, ","));
        urls.forEach(url -> {
            byte[] imgData = imageAccess.getImage(url, ImageAccessType.UPLOAD.getValue());
            String imageData = imgData != null ? Base64.getEncoder().encodeToString(imgData) : null;
            imageDatas.add(imageData);

        });
        return imageDatas;
    }

    /**
     * 获取第一张人脸图
     * 
     * @param faceUrl
     * @return
     */
    public static String getImageData(String faceUrl, int type) {
        ImageAccess imageAccess = SpringContextHolder.getBean(ImageAccess.class);

        if (null == faceUrl) {
            return null;
        }

        byte[] imgData = imageAccess.getImage(faceUrl, type);
        String imageData = imgData != null ? Base64.getEncoder().encodeToString(imgData) : null;

        return imageData;
    }

    /**
     * 获取压缩图片
     * 
     * @param faceUrl
     * @return
     * @throws IOException
     */
    // public static String getCompress(String faceUrl, int type) {
    // ImageAccess imageAccess = SpringContextHolder.getBean(ImageAccess.class);
    // CopysUtils.copy(imageAccess, imageAccess);
    // if (null == faceUrl) {
    // return null;
    // }
    // // 获取图片
    //
    // List<String> urls = Arrays.asList(StringUtils.split(faceUrl, ","));
    // byte[] imgData = imageAccess.getImage(urls.get(0), type);
    // if (null == imgData) {
    // log.error("图片读取：{}", urls.get(0));
    // return null;
    // }
    // // 压缩图片
    // ByteArrayInputStream in;
    // BufferedImage image;
    // BufferedImage bi;
    // ByteArrayOutputStream os;
    // try {
    // in = new ByteArrayInputStream(imgData);
    // os = new ByteArrayOutputStream();
    // long startimageTime = System.currentTimeMillis();
    //
    // image = ImageIO.read(in);
    // long endimageTime = System.currentTimeMillis();
    // System.out.println("测试image调用时长： " + (endimageTime - startimageTime));
    //
    // bi =
    // Thumbnails.of(image).scale(com.rw.ssd.img.ImageUtils.compScale(image)).asBufferedImage();
    // ImageIO.write(bi, "jpg", os);
    //
    // } catch (IOException e) {
    // log.error("图片压缩失败：{}", urls.get(0));
    // return Base64.getEncoder().encodeToString(imgData);
    // }
    //
    // return Base64.getEncoder().encodeToString(os.toByteArray());
    // }

    public static String compress(String imageDate) {

        // 获取图片
        byte[] imgData = Base64.getDecoder().decode(imageDate);
        // 压缩图片
        ByteArrayInputStream in = new ByteArrayInputStream(imgData);
        BufferedImage image;
        BufferedImage bi;
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            image = ImageIO.read(in);
            bi = Thumbnails.of(image).scale(com.rw.ssd.img.ImageUtils.compScale(image)).asBufferedImage();
            ImageIO.write(bi, "jpg", os);

        } catch (IOException e) {
            log.error("图片压缩失败");
        }

        return Base64.getEncoder().encodeToString(os.toByteArray());
    }

    /**
     * 删除图片
     * 
     * @param faceUrl
     */
    public static void delete(String faceUrl) {
        ImageAccess imageAccess = SpringContextHolder.getBean(ImageAccess.class);

        List<String> urls = Arrays.asList(StringUtils.split(faceUrl, ","));
        urls.forEach(url -> {

            imageAccess.deleteImage(url, ImageAccessType.UPLOAD.getValue());
        });
    }

    public static String getImageStr(String imgFile) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        InputStream in = null;
        byte[] data = null;
        // 读取图片字节数组
        try {
            in = new FileInputStream(imgFile);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return Base64.getEncoder().encodeToString(data);// 返回Base64编码过的字节数组字符串
    }

}
