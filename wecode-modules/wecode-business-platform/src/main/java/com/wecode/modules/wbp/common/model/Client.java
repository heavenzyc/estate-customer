package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by asrg on 2015/3/13.
 */
@TableBind(tableName = "client")
public class Client extends BaseModel<Client,Integer> {

    public static Client dao = new Client();

    public static Page<Client> getPage(Integer curPage, Integer pageSize, String key, String process_state) {
        String sql = " select * ";
        String sqlExceptSelect = " from client where 1=1 and status='VALID' ";
        List<String> params = new ArrayList<String>();
        if (StringUtils.isNotBlank(key)) {
            key = "%"+key+"%";
            sqlExceptSelect += " and (name like ? or phone like ?) ";
            params.add(key);
            params.add(key);
        }
        if (StringUtils.isNotBlank(process_state) && !"ALL".equals(process_state)) {
            sqlExceptSelect += " and process_state=? ";
            params.add(process_state);
        }
        sqlExceptSelect += " order by create_time desc ";
        return dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }
}
