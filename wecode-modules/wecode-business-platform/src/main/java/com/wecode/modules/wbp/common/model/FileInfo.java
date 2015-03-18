package com.wecode.modules.wbp.common.model;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.ext.model.Model;
import com.jfinal.ext.plugin.tablebind.TableBind;
import org.apache.log4j.Logger;

import java.util.Date;

@TableBind(tableName = "file_info")
public class FileInfo extends Model<FileInfo> {

    private static final long serialVersionUID = -9130380800466108191L;

    private static final Logger logger = Logger.getLogger(FileInfo.class);

    public static FileInfo dao = new FileInfo();

    public static final String DEFAULT_TYPE = "jpg";

    public static int DAO_STATUS_NORMAL = 1;
    public static int DAO_STATUS_DELETE = 0;

    public static int insert(String name, String localPath, String url, String type, int objId, JSONObject extJson) {
        FileInfo fileInfo = new FileInfo();
        fileInfo.set("name", name);
        fileInfo.set("local_path", localPath);
        fileInfo.set("url", url);
        fileInfo.set("type", type);
        fileInfo.set("ext", extJson.toJSONString());
        fileInfo.set("obj_id",objId);
        fileInfo.set("create_time",new Date());
        fileInfo.set("status",Status.VALID.name());
        fileInfo.save();
        return fileInfo.getId();
    }

    public static int insert(String name, String localPath, String url, String type, String remark, int configId,
            JSONObject extJson) {
        FileInfo fileInfo = new FileInfo();
        fileInfo.set("name", name);
        fileInfo.set("local_path", localPath);
        fileInfo.set("url", url);
        fileInfo.set("type", type);
        fileInfo.set("remark", remark);
        fileInfo.set("ext", extJson.toJSONString());
        fileInfo.saveAndCreateDate();
        return fileInfo.getId();
    }

    public static void addTitleAndRemark(Integer id, String remark){
        FileInfo info = FileInfo.dao.findById(id);
        if (info == null) return;
        info.set("remark",remark);
        info.update();
    }
}
