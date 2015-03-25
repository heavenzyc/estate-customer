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

    public static enum PROCESS_STATE {
        NOT("未联系"), DONE("已联系"), SOLD("已出售");
        public String value;

        PROCESS_STATE(String value) {
            this.value = value;
        }

        public String getValue() {
            return this.value;
        }

        public static PROCESS_STATE indexOf(int i) {
            PROCESS_STATE[] statusList = PROCESS_STATE.values();
            if (i < 0 || i >= statusList.length) {
                return statusList[0];
            }
            return statusList[i];
        }
    }

    public PROCESS_STATE getProcessState() {
        String i = getStr("process_state");
        return PROCESS_STATE.valueOf(i);
    }

    public static Page<Client> getPage(Integer curPage, Integer pageSize, String key, String process_state,
                                       String park_name,String building,String unit,String floor,String num) {
        String sql = " select * ";
        String sqlExceptSelect = " from client where 1=1 and status='VALID' ";
        List<String> params = new ArrayList<String>();
        if (StringUtils.isNotBlank(key)) {
            key = "%"+key+"%";
            sqlExceptSelect += " and (name like ? or phone like ? or park_name like ? ) ";
            params.add(key);
            params.add(key);
            params.add(key);
        }
        if (StringUtils.isNotBlank(process_state) && !"ALL".equals(process_state)) {
            sqlExceptSelect += " and process_state=? ";
            params.add(process_state);
        }
        if (StringUtils.isNotBlank(park_name)) {
            sqlExceptSelect += " and park_name=? ";
            params.add(park_name);
        }
        if (StringUtils.isNotBlank(building)) {
            sqlExceptSelect += " and building=? ";
            params.add(building);
        }
        if (StringUtils.isNotBlank(unit)) {
            sqlExceptSelect += " and unit=? ";
            params.add(unit);
        }
        if (StringUtils.isNotBlank(floor)) {
            sqlExceptSelect += " and floor=? ";
            params.add(floor);
        }
        if (StringUtils.isNotBlank(num)) {
            sqlExceptSelect += " and num=? ";
            params.add(num);
        }
        sqlExceptSelect += " order by create_time desc ";
        return dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }

    public static List<Client> getList(){
        String sql = " select * from client where status='VALID' ";
        return dao.find(sql);
    }

    public static List<FileInfo> getPics(Integer id){
        String sql = "select * from file_info where obj_id=? and status='VALID'";
        return FileInfo.dao.find(sql,id);
    }
}
