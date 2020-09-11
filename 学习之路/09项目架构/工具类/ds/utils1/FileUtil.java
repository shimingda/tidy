package com.rw.ssd.biz.utils;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件工具类 <Operation> <User> <DateTime> <Remark> Create yue kang 2017/7/26 9:25
 */
public class FileUtil {

    private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

    /** 文件存储时的路径 ***/
    private static final String FILE_PATH_PATTERN = "000";

    /** 文件格式。excel,2003 ***/
    public static final String FILE_TYPE_EXCEL_2003 = "xls";

    /** 文件格式。excel,2007 ***/
    public static final String FILE_TYPE_EXCEL_2007 = "xlsx";

    /**
     * ，2007以后为XLSM
     *
     */

    /**
     * 将文件写入到磁盘上 生成的文件的名称为32位uuid
     *
     * @param filePath
     *            文件路径
     * @param file
     *            文件
     * @return 文件名称
     * @throws Exception
     */
    public static String writeFileToDisk(String filePath, MultipartFile file) throws Exception {

        String fileName = generateFileName(file);
        writeFileToDisk(filePath, fileName, file);
        return fileName;
    }

    /**
     * 将文件写入到磁盘上
     *
     * @param filePath
     *            文件路径
     * @param fileName
     *            文件名称，需要带文件后缀
     * @param file
     *            文件
     * @throws Exception
     */
    public static void writeFileToDisk(String filePath, String fileName, MultipartFile file) throws Exception {

        writeFileToDisk(filePath, fileName, file.getBytes());
    }

    /**
     * 将文件写入到磁盘上
     * 
     * @param filePath
     * @param fileName
     * @param data
     * @throws Exception
     */
    public static void writeFileToDisk(String filePath, String fileName, byte[] data) throws Exception {

        try {

            FileUtils.writeByteArrayToFile(new File(filePath + "/" + fileName), data);
        } catch (Exception e) {

            e.printStackTrace();
            logger.error("====>sysError:", e);
            // throw new FileWriteException();
        }
    }

    /**
     * 获取文件后缀
     *
     * @param file
     *            文件
     * @return
     * @throws Exception
     */
    public static String getFileSuffixName(MultipartFile file) throws Exception {

        String uploadFileName = getFileName(file);
        return uploadFileName.substring(uploadFileName.indexOf("."));
    }

    /**
     * 获取文件名称
     *
     * @param file
     * @return
     * @throws Exception
     */
    public static String getFileName(MultipartFile file) throws Exception {

        return file.getOriginalFilename();
    }

    /**
     * 创建上传文件名称，包含后缀，文件名为32位UUID
     *
     * @param file
     *            文件
     * @return 生成的文件名称，UUID, 32位数
     * @throws Exception
     */
    public static String generateFileName(MultipartFile file) throws Exception {

        return UUID.randomUUID().toString().replaceAll("-", "") + getFileSuffixName(file);
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public static String generateFileName(String fileSuffixName) throws Exception {

        return UUID.randomUUID().toString().replaceAll("-", "") + fileSuffixName;
    }

    /**
     * 删除文件、文件夹
     *
     * @param filePath
     *            文件路径
     * @throws Exception
     */
    public static void deleteFileFromDisk(String filePath) throws Exception {

        try {

            File file = new File(filePath);

            if (file.isDirectory()) {

                // 删除文件夹

                FileUtils.deleteDirectory(file);
            } else if (file.isFile()) {

                // 删除文件
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("====>sysError:", e);
            // throw new FileDeleteException();
        }
    }

    /**
     * file 转字节数组
     * 
     * @param filePath
     * @return
     */
    public static byte[] file2Byte(String filePath) {
        byte[] buffer = null;
        try {
            File file = new File(filePath);
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("====>sysError:", e);
        }
        return buffer;
    }

    /**
     * 字节数组转file
     * 
     * @param buf
     * @param filePath
     * @param fileName
     */
    public static void byte2File(byte[] buf, String filePath, String fileName) {
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        File file = null;
        try {
            File dir = new File(filePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            file = new File(filePath + File.separator + fileName);
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(buf);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("====>sysError:", e);
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("====>sysError:", e);
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("====>sysError:", e);
                }
            }
        }
    }

    /**
     * 创建图片存储路径
     * 
     * @return
     */
    public static String createFilePathStr() {

        DecimalFormat df = new DecimalFormat(FILE_PATH_PATTERN);

        return "/" + df.format(Math.round(Math.random() * 999)) + "/";
    }

    /**
     * 复制图片
     * 
     * @param fromFilePath
     * @param targetFilePath
     * @throws Exception
     */
    public static void copy(String fromFilePath, String targetFilePath) throws Exception {

        try {

            FileUtils.writeByteArrayToFile(new File(targetFilePath), file2Byte(fromFilePath));
        } catch (Exception e) {

            e.printStackTrace();
            logger.error("====>sysError:", e);
            // throw new FileWriteException();
        }
    }

    /**
     * 判断文件类型是否符合要求
     * 
     * @param file
     * @param fileType
     * @return
     * @throws Exception
     */
    public static boolean documentFormatCheck(MultipartFile file, String fileType) {
        return documentFormatCheck(file.getOriginalFilename(), fileType);
    }

    /**
     * 判断文件类型是否符合要求
     * 
     * @param fileName
     * @param fileType
     * @return
     * @throws Exception
     */
    public static boolean documentFormatCheck(String fileName, String fileType) {
        return fileName.toLowerCase().endsWith("." + fileType);
    }

    public static ArrayList<File> getFiles(String path) {
        // 目标集合fileList
        ArrayList<File> fileList = new ArrayList<File>();
        File file = new File(path);
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (File fileIndex : files) {
                // 如果这个文件是目录，则进行递归搜索
                if (fileIndex.isDirectory()) {
                    ArrayList<File> subordinateFiles = getFiles(fileIndex.getPath());
                    fileList.addAll(subordinateFiles);
                } else {
                    // 如果文件是普通文件，则将文件句柄放入集合中
                    fileList.add(fileIndex);
                }
            }
        }
        return fileList;
    }

}
