package com.jfinal.ext.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Db;

public class Model<M extends com.jfinal.plugin.activerecord.Model<M>> extends com.jfinal.plugin.activerecord.Model<M> {

    private static Logger logger = Logger.getLogger(Model.class);

    /***
     * 用来当 缓存名字 也用来 生成 简单sql
     */

    public String tableName;

    /***
     * 反射获取 注解获得 tablename
     */
    public Model() {
        TableBind table = this.getClass().getAnnotation(TableBind.class);

        if (table != null)
            tableName = table.tableName();

    }

    public boolean update(String key, Object value, Object id) {

        return Db.update("update " + tableName + " set " + key + "=? where id =?", value, id) > 0;
    }

    public M findByName(String name) {
        return findFirst("select * from " + tableName + " where name =? ", name);
    }

    public boolean checkNameExist(String name) {

        return findFirst("select * from " + tableName + " where name ='" + name + "'") != null;

    }

    /***
     * if empty remove the attr
     * 
     * @param attr
     */
    public Model<M> emptyRemove(String attr) {
        if (get(attr) == null)
            remove(attr);

        return this;
    }

    public Model<M> emptyZreo(String attr) {
        if (get(attr) == null)
            set(attr, 0);
        return this;
    }

    /***
     * 删除自己的同时 删除 所有 子节点 属性名 必需为pid
     * 
     * @param para
     * @return
     */
    public boolean deleteByIdAndPid(Integer id) {
        boolean result = deleteById(id);

//        List<Model> list = (List<Model>) list("where pid=?", id);
        List<M> list = list("where pid=?", id);
        
        for(int i = 0; i < list.size(); i++) {
        	Model m = (Model) list.get(i);
//        for (Model m : list) {
            deleteByIdAndPid(m.getId());

            Db.update("delete from " + tableName + " where pid=? ", id);
        }

        return result;
    }

    /***
     * ids 必需为 连续的 1，2，3 这样子
     * 
     * @param ids
     */
    public boolean batchDelete(String ids) {
        if (StringUtils.isNotBlank(ids))
            return false;
        return Db.update("delete from " + tableName + " where id in (" + ids + ")") > 0;

    }

    public void saveOrUpdate(Model<M> model) {
        if (model.getId() != null)
            model.update();
        else
            model.save();
    }

    public boolean pidIsChild(Integer id, Integer pid) {
        boolean result = false;
        if (pid != null) {
//            List<Model> list = (List<Model>) list(" where  pid =?  ", id);
            List list = (List) list(" where  pid =?  ", id);

            if (list.size() == 0)
                result = false;

            for(int i = 0; i < list.size(); i++) {
            	Model r = (Model) list.get(i);
//            }
//            for (Model r : list) {
                if (pid.equals(r.getId())) {
                    result = true;
                    return result;
                } else {

                    if (pidIsChild(r.getId(), pid)) {
                        result = true;
                        logger.debug("result =" + result);
                        return result;
                    }
                }

            }
        }

        return result;

    }

    /***
     * 返回全部的数据 比较方便 但不灵活
     * 
     * @return
     */
    public List<M> list() {

        return find(" select *from " + tableName);
    }

    public List<M> listOrderBySeq() {

        return list(" order by seq");
    }

    public List<M> listOrderBySeq(String where, Object... params) {

        return list(where + " order by seq", params);
    }

    /***
     * 返回全部的数据 比较方便 但不灵活
     * 
     * @return
     */
    public List<M> list(String where) {

        return find(" select *from " + tableName + " " + where);
    }

    /***
     * 
     * @return
     */
    public List<M> list(String where, Object... params) {

        return find(" select *from " + tableName + " " + where, params);
    }

    /***
     * 返回全部的数据 比较方便 但不灵活
     * 
     * @return
     */
    public List<M> list(int limit) {

        return find(" select *from " + tableName + " limit " + limit);
    }

    /***
     * 返回全部的数据 比较方便 但不灵活
     * 
     * @return
     */
    public List<M> list(int page, int size) {

        if (page < 1)
            page = 0;
        return find(" select *from " + tableName + " limit " + (page - 1) * size + "," + size);
    }

    // public Page<M> loadModelPage(Page<M> page)

    // {

    // List<M> modelList = page.getList();

    // for (int i = 0; i < modelList.size(); i++)

    // {

    // com.jfinal.plugin.activerecord.Model model = modelList.get(i);

    // M topic = loadModel(model.getInt("id"));

    // modelList.set(i, topic);

    // }

    // return page;

    // }

    public List<M> findByCache(String sql) {

        return super.findByCache(tableName, sql, sql);
    }

    public List<M> findByCache(String sql, Object... params) {
        return super.findByCache(tableName, sql, sql, params);
    }

    public boolean saveAndDate() {
        return this.setDate("create_time").save();
    }

    public boolean saveAndCreateDate() {
        return this.setDate("create_time").save();
    }

    public boolean updateAndModifyDate() {
        return this.setDate("modify_time").update();
    }

    public Map<String, Object> getAttrs() {
        return super.getAttrs();
    }

    public M setDate(String date) {
        return this.set(date, new Timestamp(System.currentTimeMillis()));

    }

    /***
     * 把 model 转化为 list 找到其中的单个属性
     * 
     * @param sql
     * @param attr
     * @return
     */
    public List<String> getAttr(String sql, String attr) {

        List<String> list = new ArrayList<String>();

        for (M t : find(sql)) {

            list.add(t.getStr(attr));
        }
        return list;

    }

    /***
     * 把 model 转化为 list 找到其中的单个属性
     * 
     * @param sql
     * @param attr
     * @return
     */
    public List<String> getAttr(String sql, String attr, String... param) {
        List<String> list = new ArrayList<String>();
        for (M t : find(sql, param)) {
            list.add(t.getStr(attr));
        }
        return list;
    }

    public long getCount(String sql) {
        sql = StringUtils.split(sql.toLowerCase(), "from")[1];
        if (sql.contains("order by"))
            sql = StringUtils.split(sql, "order by")[0];
        return findFirst(" select count(*) as c from" + sql).getLong("c");
    }

    public Long getCount(String sql, String countName, Object... params) {
        return findFirst(sql, params).getLong(countName);
    }

    /***
     * 取值
     * 
     * @return
     */
    public Long getCount() {
        return getLong("count");
    }

    public Integer getId() {
        return getInt("id");
    }

    public Integer getPid() {
        return getInt("pid");
    }

    /***
     * return getStr("name");
     * 
     * @return
     */
    public String getName() {
        return getStr("name");
    }

    /***
     * return getStr("pwd");
     * 
     * @return
     */
    public String getPwd() {
        return getStr("pwd");
    }

    /***
     * return getStr("remark");
     * 
     * @return
     */
    public String getRemark() {

        return getStr("remark");
    }

    // /***
    // * return getStr("date");
    // *
    // * @return
    // */
    // public String getDate() {
    //
    // return getStr("date");
    // }

    public String getCreateTime() {

        return getStr("create_time");

    }

    public String getModifyTime() {

        return getStr("modify_time");
    }

    public Integer getStatus() {
        return getInt("status");
    }

    public static String sql(String key) {
        return SqlKit.sql(key);
    }

}