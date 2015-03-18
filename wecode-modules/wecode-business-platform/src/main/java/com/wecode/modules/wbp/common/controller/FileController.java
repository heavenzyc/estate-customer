package com.wecode.modules.wbp.common.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.wecode.framework.exception.BusinessException;
import com.wecode.framework.ext.jfinal.controller.Controller;
import com.wecode.framework.util.FileUtils;
import com.wecode.framework.util.ImageUtils;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.config.Constants;
//import com.wecode.modules.wbp.common.model.FileConfig;
import com.wecode.modules.wbp.common.model.FileInfo;
import org.apache.log4j.Logger;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class FileController extends Controller {

    private static final Logger logger = Logger.getLogger(FileController.class);

    public void index() {
        logger.debug("index");
    }

    /**
     * 剪切图片原图
     */
    @Before(Tx.class)
    public void uploadCropImg() {
        logger.debug("uploadCropImg");
        // 临时目录
        String tmpfsPath = Constants.TMP_FS_PATH;
        String currentDirectory = null;
        File newFile = null;
        try {
            UploadFile file = getFile("Filedata", tmpfsPath);
            String fileName = file.getFileName();

            Integer objId = getParaToInt("code");
            int maxsize = getParaToInt("maxsize", 0);
            int width = getParaToInt("width", 0);
            int height = getParaToInt("height", 0);
            String type = getPara("type");
            logger.debug("code=" + objId);
            logger.debug("maxsize=" + maxsize);
            logger.debug("type=" + type);
            logger.debug("width=" + width);
            logger.debug("height=" + height);
            if (StringUtils.isBlank(type)) {
                type = ".jpg";
            }
            boolean isFail = FileUtils.checkFileType(fileName, type);
            if (isFail) {
                setAttr("state", "图片类型不支持！");
            } else {
                // 1048576
                int maxSize = (maxsize == 0) ? Constants.MAX_POST_SIZE : maxsize;

                if (file.getFile().length() > maxSize) {
                    setAttr("state", "超过文件上传最大文件限制！");
                } else {
                    // 上传文件
                    logger.debug("上传文件");
                    String newFilePath = PathKit.getWebRootPath() + "/upload";
                    currentDirectory = currentDirectory(newFilePath);
                    newFilePath = newFilePath + File.separator + currentDirectory;
                    logger.debug("newFilePath=" + newFilePath);
                    newFile = new File(newFilePath + File.separator + System.currentTimeMillis()
                            + FileUtils.getFileType(fileName));

                    file.getFile().renameTo(newFile);
                    String url = currentDirectory + FileUtils.URL_SEPARATOR + newFile.getName();

                    JSONObject jsonObj = getImageExt(newFile);

                    int id = FileInfo.insert(newFile.getName(), newFile.getAbsolutePath(), url,
                            FileUtils.getFileType(newFile.getName()), objId, jsonObj);

                    BufferedImage bi = ImageIO.read(newFile);

                    // 校验图片长宽
                    if (width != 0 && bi.getWidth() < width) {
                        throw new BusinessException("图片大小不符合要求：宽度不足" + width);
                    }
                    if (height != 0 && bi.getHeight() < height) {
                        throw new BusinessException("图片大小不符合要求：高度不足" + height);
                    }

                    setAttr("url",  "/upload/"+ url);
                    setAttr("path", FileUtils.URL_SEPARATOR + url);// 相对路径
                    setAttr("id", id);
                    setAttr("state", "SUCCESS");
                    setAttr("width", bi.getWidth());
                    setAttr("height", bi.getHeight());
                }
            }
            setAttr("original", fileName);
        } catch (BusinessException e) {
            logger.error(e.getMessage(), e);
            if (newFile != null) {
                FileUtils.deleteQuietly(newFile);
            }
            setAttr("state", e.getMessage());
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            if (newFile != null) {
                FileUtils.deleteQuietly(newFile);
            }
            setAttr("state", "图片上传失败，请稍后重试！");
        }
        setAttr("title", getPara("pictitle"));
        renderJson(new String[] { "original", "url", "title", "state", "id", "width", "height", "relative_url" });
    }

    /**
     * 剪切图片
     */
    @Before(Tx.class)
    public void cropImg() {
        String currentDirectory = null;

        int id = getParaToInt("avatar-id");
        int x = getParaToInt("x");
        int y = getParaToInt("y");
        int w = getParaToInt("w");
        int h = getParaToInt("h");

        int destWidth = getParaToInt("tw");
        int destHeight = getParaToInt("th");

        int jcropWidth = getParaToInt("jw");
        int jcropHeight = getParaToInt("jh");

        boolean flag = false;

        FileInfo fileInfo = FileInfo.dao.findById(id);
        if (fileInfo != null) {
            String srcImageFile = fileInfo.getStr("local_path");
//            FileConfig fileConfig = FileConfig.dao.findById(fileInfo.getInt("config_id"));
            String dirImageFilePath = "classpath:upload";

            BufferedImage bi = null;
            try {
                bi = ImageIO.read(new File(srcImageFile));
            } catch (IOException e) {
                e.printStackTrace();
            }
            int width = bi.getWidth();
            int height = bi.getHeight();

            // if (width > destWidth && height > destHeight) {
            // modified by lk 裁剪判断在ImageUtils.abscut进行 无需裁剪返回原图
            // TODO 需要优化不将业务放入controll进行

            if (width >= destWidth && height >= destHeight) {
                flag = true;
            }

            double ratio = ((double) width / jcropWidth);

            logger.debug("ratio=" + ratio);

            logger.debug("原始值 x=" + x + " y=" + y + " w=" + w + " h=" + h);

            logger.debug("计算 x=" + x * ratio + " y=" + y * ratio + " w=" + w * ratio + " h" + h * ratio);

            // 修正裁剪指数
            x = Integer.parseInt(new java.text.DecimalFormat("0").format(x * ratio));
            y = Integer.parseInt(new java.text.DecimalFormat("0").format(y * ratio));
            w = Integer.parseInt(new java.text.DecimalFormat("0").format(w * ratio));
            h = Integer.parseInt(new java.text.DecimalFormat("0").format(h * ratio));

            logger.debug("精度计算后 x=" + x + " y=" + y + " w=" + w + " h=" + h);
            logger.debug("图片属性:" + " width=" + width + " destWidth=" + destWidth + " height=" + height + " destHeight"
                    + destHeight);
            // 修正数据
            if (flag) {
                logger.debug("修正数据");
                if (w > width) {
                    w = width;
                }
                if (h > height) {
                    h = height;
                }
            }
            logger.debug("修正过后的 x=" + x + " y=" + y + " w=" + w + " h=" + h);
            if (dirImageFilePath.startsWith("classpath:")) {
                dirImageFilePath = PathKit.getWebRootPath() + dirImageFilePath.substring(10, dirImageFilePath.length());
            }

            currentDirectory = currentDirectory(dirImageFilePath);
            dirImageFilePath = dirImageFilePath + File.separator + currentDirectory;

            logger.debug("dirImageFilePath=" + dirImageFilePath);

            String newFile = dirImageFilePath + File.separator + System.currentTimeMillis() + fileInfo.getStr("type");
            File file = ImageUtils.abscut(srcImageFile, newFile, x, y, w, h, destWidth, destHeight, jcropWidth,
                    jcropHeight);

            String url = currentDirectory + FileUtils.URL_SEPARATOR + file.getName();

            JSONObject jsonObj = getImageExt(file);

            int newId = FileInfo.insert(file.getName(), file.getAbsolutePath(), url,
                    FileUtils.getFileType(file.getName()), "", fileInfo.getInt("config_id"), jsonObj);
            setAttr("id", newId);
//            setAttr("src", fileConfig.getStr("url_path") + FileUtils.URL_SEPARATOR + url);
            setAttr("path", FileUtils.URL_SEPARATOR + url);
            setAttr("status", "success");
            // } else {
            // logger.debug("不需要进行裁剪:" + " width=" + width + " destWidth=" +
            // destWidth + " height=" + height
            // + " destHeight" + destHeight);
            // setAttr("status", "faild");
            // setAttr("msg", "图片大小不符合要求!");
            // }
        } else {
            setAttr("status", "faild");
            setAttr("msg", "图片大小不符合要求!");
        }
        renderJson(new String[] { "src", "id", "status", "msg", "path" });
    }

    private String currentDirectory(String filePath) {
        return FileUtils.createDirectoryByNow(filePath);
    }

    private JSONObject getImageExt(File imgFile) {
        JSONObject jsonObj = new JSONObject();
        BufferedImage bi = null;
        try {
            bi = ImageIO.read(imgFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        jsonObj.put("width", bi.getWidth());
        jsonObj.put("height", bi.getHeight());

        return jsonObj;
    }

}
