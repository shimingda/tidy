package com.rw.ssd.biz.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipOutputStream;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 压缩文件工具类 <Operation> <User> <DateTime> <Remark> Create yue kang 2018-11-15
 * 10:57
 *
 * @author yue kang
 */
public class ZipUtil {

    private static final Logger logger = LoggerFactory.getLogger(ZipUtil.class);

    /**
     * 压缩文件
     * 
     * @param path
     *            要压缩的文件路径，例如：F:\\11
     * @param target
     *            输出的文件路径，例如：F:\\11.zip
     */
    public static void compression(String path, String target) {
        ZipOutputStream outPutStream = null;
        try {
            File inputFile = new File(path);
            outPutStream = new ZipOutputStream(new FileOutputStream(target));

            // 压缩
            zip(outPutStream, inputFile, inputFile.getName());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("zip压缩异常，", e);
        } finally {
            try {
                if (outPutStream != null) {
                    outPutStream.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("zip压缩工具类关闭异常，", e);
            }
        }
    }

    /**
     * 循环压缩文件
     * 
     * @param outPutStream
     * @param file
     *            输出文件
     * @param base
     * @throws Exception
     */
    private static void zip(ZipOutputStream outPutStream, File file, String base) throws Exception {
        if (file.isDirectory()) {
            // 获取文件夹下的文件列表
            File[] fileArray = file.listFiles();
            if (fileArray.length == 0) {
                // 创建zip压缩进入点base
                outPutStream.putNextEntry(new ZipEntry(base + "/"));
            }
            for (int i = 0; i < fileArray.length; i++) {
                // 递归遍历子文件夹
                zip(outPutStream, fileArray[i], base + "/" + fileArray[i].getName());
            }
        } else {
            // 创建zip压缩进入点base
            outPutStream.putNextEntry(new ZipEntry(base));
            FileInputStream inputStream = new FileInputStream(file);
            BufferedInputStream bufferedInput = new BufferedInputStream(inputStream);
            try {
                int length;
                while ((length = bufferedInput.read()) != -1) {
                    // 将字节流写入当前zip目录
                    outPutStream.write(length);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                bufferedInput.close();
                inputStream.close();
            }
        }
    }

    /**
     * 解压文件
     * 
     * @param source
     *            压缩文件路径
     * @param target
     *            解压到目录
     */
    public static void decompression(String source, String target) {

        try {
            unZipFiles(new File(source), target);
        } catch (Exception e) {
            logger.error("===》解压文件异常，" + source, e);
        }
    }

    /**
     * 解压文件
     * 
     * @param zipFile
     * @param descDir
     * @throws IOException
     */
    private static void unZipFiles(File zipFile, String descDir) throws IOException {
        File pathFile = new File(descDir);
        if (!pathFile.exists()) {
            pathFile.mkdirs();
        }
        ZipFile zip = new ZipFile(zipFile);
        for (Enumeration<?> entries = zip.getEntries(); entries.hasMoreElements();) {
            ZipEntry entry = (ZipEntry) entries.nextElement();
            // 解决linux乱码
            entry.setUnixMode(644);
            String zipEntryName = entry.getName();
            InputStream in = zip.getInputStream(entry);
            String outPath = (descDir + "/" + zipEntryName).replaceAll("\\*", "/");
            // 判断路径是否存在,不存在则创建文件路径
            File file = new File(outPath.substring(0, outPath.lastIndexOf('/')));
            if (!file.exists()) {
                file.mkdirs();
            }
            // 判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
            if (new File(outPath).isDirectory()) {
                in.close();
                continue;
            }
            // 输出文件路径信息
            logger.info("====>解压路径名称：" + outPath);
            OutputStream out = new FileOutputStream(outPath);
            byte[] buf1 = new byte[1024];
            int len;
            while ((len = in.read(buf1)) > 0) {
                out.write(buf1, 0, len);
            }
            in.close();
            out.close();
        }
        zip.close();
        logger.info("====>解压完毕" + zipFile.getName());
    }
}
