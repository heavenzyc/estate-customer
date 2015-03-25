package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by heaven.zyc on 2015/3/13.
 */
@TableBind(tableName = "track_info")
public class Track extends BaseModel<Track,Integer> {

    public static Track dao = new Track();

    public static List<Track> getList(Integer clientId){
        String sql = " select * from track_info where client_id=? order by create_time desc ";
        return dao.find(sql,clientId);
    }
}
