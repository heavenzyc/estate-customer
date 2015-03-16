package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.DateUtils;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.model.Client;
import com.wecode.modules.wbp.common.model.Status;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by asrg on 2015/3/13.
 */
@ControllerBind(controllerKey = "/client", viewPath = "/client")
public class ClientController extends BaseController {

    public void index(){
        renderFreeMarker("client_index.ftl");
    }

    public void list(){
        String key = getPara("key");
        String process_state = getPara("process_state");
        Page<Client> page = Client.getPage(getParaToInt("page", 1),getParaToInt("rows", 10),key,process_state);
        Map root = new HashMap();
        root.put("total", page.getTotalPage());
        root.put("page", page.getPageNumber());
        root.put("records", page.getTotalRow());
        root.put("rows", page.getList());
        renderJson(JsonKit.toJson(root));
    }

    public void add(){
        renderFreeMarker("client_add.ftl");
    }

    @Before(Tx.class)
    public void save(){
        Client client = buildClient(null);
        client.save();
        redirect("/client/index");
    }

    public void update(){
        Integer id = getParaToInt();
        Client client = Client.dao.findById(id);
        setAttr("data",client);
        renderFreeMarker("client_edit.ftl");
    }

    @Before(Tx.class)
    public void modify(){
        Integer id = getParaToInt("id");
        Client client = buildClient(id);
        client.update();
        redirect("/client/index");
    }

    public Client buildClient(Integer id){
        String name = getPara("name");
        String phone = getPara("phone");
        String qq = getPara("qq");
        String park_name = getPara("park_name");
        String house_name = getPara("house_name");
        String remark = getPara("remark");
        Client client = null;
        if (id == null) {
            client = new Client();
            client.set("status", Status.VALID.name());
            client.set("process_state", Client.PROCESS_STATE.NOT.name());
            client.set("create_time",new Date());
        }else {
            client = Client.dao.findById(id);
            client.set("update_time",new Date());
        }
        client.set("name",name);
        client.set("phone",phone);
        client.set("qq",qq);
        client.set("park_name",park_name);
        client.set("house_name",house_name);
        client.set("remark",remark);
        return client;
    }

    @Before(Tx.class)
    public void delete(){
        Integer id = getParaToInt("id");
        Client client = Client.dao.findById(id);
        if (client != null) {
            client.set("status",Status.INVALID.name());
            client.update();
            renderJson(JsonResult.success());
        } else {
            renderJson(JsonResult.fail());
        }

    }

    public void importExcel(){
        File file = getFile("excel").getFile();
        String name = file.getName();
        if (name.endsWith("xls")) {
            excel2003(file);
        }
        if (name.endsWith("xlsx")){
            excel2007(file);
        }
    }

    private void excel2003(File file){
        try {
            InputStream in = new FileInputStream(file);
            HSSFWorkbook xssfSheets = new HSSFWorkbook(in);
            // 循环工作表Sheet
            HSSFSheet xssfSheet = xssfSheets.getSheetAt(0);
            if (xssfSheet == null) return;
            // 循环行Row
            for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                Client client = new Client();
                HSSFRow xssfRow = xssfSheet.getRow(rowNum);
                if (xssfRow == null) {
                    continue;
                }
                //姓名
                HSSFCell name = xssfRow.getCell(0);
                if (name != null) {
                    client.set("name",getValue(name));
                }
                //电话
                HSSFCell phone = xssfRow.getCell(1);
                if (phone != null) {
                    String phoneStr = getValue(phone);
                    if (StringUtils.isNotBlank(phoneStr) && phoneStr.length() > 11) {
                        phoneStr = phoneStr.substring(0,phoneStr.length()-3).replace(".","");
                        client.set("phone",phoneStr);
                    }
                }
                //QQ号
                HSSFCell qq = xssfRow.getCell(2);
                if (qq != null) {
                    String qqStr = getValue(qq);
                    if (StringUtils.isNotBlank(qqStr)) {
                        qqStr = qqStr.substring(0,qqStr.length()-3).replace(".","");
                        client.set("qq",qqStr);
                    }
                }
                //小区名称
                HSSFCell park_name = xssfRow.getCell(3);
                if (qq != null) {
                    client.set("park_name",getValue(park_name));
                }
                //房号
                HSSFCell house_name = xssfRow.getCell(4);
                if (qq != null) {
                    client.set("house_name",getValue(house_name));
                }
                //处理状态
                HSSFCell process_state = xssfRow.getCell(5);
                if (process_state != null) {
                    String processState = getValue(process_state);
                    if ("未联系".equals(processState) || "NOT".equals(processState)) {
                        client.set("process_state", Client.PROCESS_STATE.NOT.name());
                    }
                    if ("已联系".equals(processState) || "DONE".equals(processState)) {
                        client.set("process_state", Client.PROCESS_STATE.DONE.name());
                    }
                    if ("已出售".equals(processState) || "SOLD".equals(processState) || "已售出".equals(processState)) {
                        client.set("process_state", Client.PROCESS_STATE.SOLD.name());
                    }
                }
                //房号
                HSSFCell remark = xssfRow.getCell(6);
                if (remark != null) {
                    client.set("remark",getValue(remark));
                }
                //保存
                client.set("status", Status.VALID.name());
                client.set("create_time", new Date());
                client.save();
            }
            JsonResult json = JsonResult.success();
            json.msg("导入成功!");
            renderJson(json.toJson());
        } catch (Exception e) {
            e.printStackTrace();
            JsonResult json = JsonResult.fail();
            json.msg("导入失败!");
            renderJson(json.toJson());
        }
    }

    private void excel2007(File file){
        try {
            InputStream in = new FileInputStream(file);
            XSSFWorkbook xssfSheets = new XSSFWorkbook(in);
            // 循环工作表Sheet
            XSSFSheet xssfSheet = xssfSheets.getSheetAt(0);
            if (xssfSheet == null) return;
            // 循环行Row
            for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                Client client = new Client();
                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                if (xssfRow == null) {
                    continue;
                }
                //姓名
                XSSFCell name = xssfRow.getCell(0);
                if (name != null) {
                    client.set("name",getValue(name));
                }
                //电话
                XSSFCell phone = xssfRow.getCell(1);
                if (phone != null) {
                    String phoneStr = getValue(phone);
                    if (StringUtils.isNotBlank(phoneStr) && phoneStr.length() > 11) {
                        phoneStr = phoneStr.substring(0,phoneStr.length()-3).replace(".","");
                        client.set("phone",phoneStr);
                    }
                }
                //QQ号
                XSSFCell qq = xssfRow.getCell(2);
                if (qq != null) {
                    String qqStr = getValue(qq);
                    if (StringUtils.isNotBlank(qqStr)) {
                        qqStr = qqStr.substring(0,qqStr.length()-3).replace(".","");
                        client.set("qq",qqStr);
                    }
                }

                //小区名称
                XSSFCell park_name = xssfRow.getCell(3);
                if (qq != null) {
                    client.set("park_name",getValue(park_name));
                }
                //房号
                XSSFCell house_name = xssfRow.getCell(4);
                if (qq != null) {
                    client.set("house_name",getValue(house_name));
                }
                //处理状态
                XSSFCell process_state = xssfRow.getCell(5);
                if (process_state != null) {
                    String processState = getValue(process_state);
                    if ("未联系".equals(processState) || "NOT".equals(processState)) {
                        client.set("process_state", Client.PROCESS_STATE.NOT.name());
                    }
                    if ("已联系".equals(processState) || "DONE".equals(processState)) {
                        client.set("process_state", Client.PROCESS_STATE.DONE.name());
                    }
                    if ("已出售".equals(processState) || "SOLD".equals(processState) || "已售出".equals(processState)) {
                        client.set("process_state", Client.PROCESS_STATE.SOLD.name());
                    }
                }
                //备注
                XSSFCell remark = xssfRow.getCell(6);
                if (remark != null) {
                    client.set("remark",getValue(remark));
                }
                //保存
                client.set("status", Status.VALID.name());
                client.set("create_time", new Date());
                client.save();
            }
            JsonResult json = JsonResult.success();
            json.msg("导入成功!");
            renderJson(json.toJson());
        } catch (Exception e) {
            e.printStackTrace();
            JsonResult json = JsonResult.fail();
            json.msg("导入失败!");
            renderJson(json.toJson());
        }
    }

    private String getValue(XSSFCell xssfCell) {
        if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
            // 返回布尔类型的值
            return String.valueOf(xssfCell.getBooleanCellValue());
        }
        else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
            // 返回数值类型的值
            return String.valueOf(xssfCell.getNumericCellValue());
        }
        else {
            // 返回字符串类型的值
            return String.valueOf(xssfCell.getStringCellValue());
        }
    }

    private String getValue(HSSFCell xssfCell) {
        if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
            // 返回布尔类型的值
            return String.valueOf(xssfCell.getBooleanCellValue());
        }
        else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
            // 返回数值类型的值
            return String.valueOf(xssfCell.getNumericCellValue());
        }
        else {
            // 返回字符串类型的值
            return String.valueOf(xssfCell.getStringCellValue());
        }
    }

    public void exportExcel() {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("潜在客户管理");
        sheet.setColumnWidth(0, 5000); //名称
        sheet.setColumnWidth(1, 5000); //电话
        sheet.setColumnWidth(2, 5000); //qq
        sheet.setColumnWidth(3, 5000); //小区名称
        sheet.setColumnWidth(4, 5000); //房号
        sheet.setColumnWidth(5, 5000); //状态
        sheet.setColumnWidth(6, 10000); //备注
        XSSFRow row = sheet.createRow(0);
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("电话");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("QQ号码");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("小区名称");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("房号");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("处理状态");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("备注");
        cell.setCellStyle(style);

        List<Client> infos = Client.getList();
        for (int i = 0; i < infos.size(); i++) {
            Client info = infos.get(i);
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(info.getStr("name"));
            row.createCell(1).setCellValue(info.getStr("phone"));
            row.createCell(2).setCellValue(info.getStr("qq"));
            row.createCell(3).setCellValue(info.getStr("park_name"));
            row.createCell(4).setCellValue(info.getStr("house_name"));
            String processState = info.getStr("process_state");
            if (StringUtils.isNotBlank(processState)) {
                row.createCell(5).setCellValue(Client.PROCESS_STATE.valueOf(info.getStr("process_state")).getValue());
            }
            row.createCell(6).setCellValue(info.getStr("remark"));
        }
        try {
            getResponse().reset();
            getResponse().setContentType("application/vnd.ms-excel");
            String fileName = "潜在客户-" + new SimpleDateFormat("MMddHHmmSSS").format(new Date()) + ".xls";
            getResponse().setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes(), "iso-8859-1"));
            OutputStream outStream = getResponse().getOutputStream();
            wb.write(outStream);
            outStream.close();
            renderNull();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
