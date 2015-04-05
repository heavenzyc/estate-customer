package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.model.Client;
import com.wecode.modules.wbp.common.model.FileInfo;
import com.wecode.modules.wbp.common.model.Status;
import com.wecode.modules.wbp.common.model.Track;
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
        String park_name = getPara("park_name");
        String building = getPara("building");
        String unit = getPara("unit");
        String floor = getPara("floor");
        String num = getPara("num");
        String process_state = getPara("process_state");
        Page<Client> page = Client.getPage(getParaToInt("page", 1),getParaToInt("rows", 10),key,
                process_state,park_name,building,unit,floor,num);
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
        String park_name = getPara("park_name");
        String house_name = getPara("house_name");
        String remark = getPara("remark");
        String building = getPara("building");
        String unit = getPara("unit");
        String floor = getPara("floor");
        String num = getPara("num");
        String area = getPara("area");
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
        client.set("park_name",park_name);
        client.set("house_name",building+"栋"+unit+"单元"+num);
        client.set("remark",remark);
        client.set("building",building);
        client.set("unit",unit);
        client.set("floor",floor);
        client.set("num",num);
        client.set("area",area);
        return client;
    }

    @Before(Tx.class)
    public void process(){
        Integer id = getParaToInt("id");
        String process_state = getPara("process_state");
        String process_remark = getPara("process_remark");
        Client client = Client.dao.findById(id);
        if (client != null) {
            client.set("process_state",process_state);
            client.set("process_remark",process_remark);
            client.update();
            renderJson(JsonResult.success());
        } else {
            renderJson(JsonResult.fail());
        }
    }

    public void info(){
        Integer id = getParaToInt();
        Client client = Client.dao.findById(id);
        List<Track> tracks = Track.getList(id);
        List<FileInfo> pics = Client.getPics(id);
        setAttr("pics",pics);
        setAttr("data",client);
        setAttr("tracks",tracks);
        renderFreeMarker("client_track.ftl");
    }

    @Before(Tx.class)
    public void track(){
        Integer id = getParaToInt("id");
        String process_state = getPara("process_state");
        String remark = getPara("remark");
        Client client = Client.dao.findById(id);
        if (client != null) {
            client.set("process_state",process_state);
            client.update();
            Track track = new Track();
            track.set("client_id",id);
            track.set("remark",remark);
            track.set("create_time",new Date());
            track.save();
            Map root = new HashMap();
            root.put("data", track);
            root.put("success",true);
            renderJson(JsonKit.toJson(root));
        } else {
            JsonResult json = JsonResult.fail();
            renderJson(json);
        }
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

    @Before(Tx.class)
    public void deletePic(){
        Integer picId = getParaToInt("picId");
        FileInfo file = FileInfo.dao.findById(picId);
        if (file != null) {
            file.set("status",Status.INVALID.name());
            file.update();
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
                //楼盘
                HSSFCell park_name = xssfRow.getCell(1);
                if (park_name != null) {
                    client.set("park_name",getValue(park_name));
                }
                //栋号
                HSSFCell building = xssfRow.getCell(2);
                if (building != null) {
                    String buildingStr = getValue(building);
                    if (StringUtils.isNotBlank(buildingStr)) {
                        if (buildingStr.contains(".0")) {
                            buildingStr = buildingStr.replace(".0","");
                            client.set("building",buildingStr);
                        }else {
                            client.set("building",buildingStr);
                        }
                    }
                }
                //单元
                HSSFCell unit = xssfRow.getCell(3);
                if (unit != null) {
                    String unitStr = getValue(unit);
                    if (StringUtils.isNotBlank(unitStr)) {
                        if (unitStr.contains(".0")) {
                            unitStr = unitStr.replace(".0","");
                            client.set("unit",unitStr);
                        }else {
                            client.set("unit",unitStr);
                        }
                    }
                }
                //楼层
                HSSFCell floor = xssfRow.getCell(4);
                if (floor != null) {
                    String floorStr = getValue(floor);
                    if (StringUtils.isNotBlank(floorStr)) {
                        if (floorStr.contains(".0")) {
                            floorStr = floorStr.replace(".0","");
                            client.set("floor",floorStr);
                        }else {
                            client.set("floor",floorStr);
                        }
                    }
                }
                //房号
                HSSFCell num = xssfRow.getCell(5);
                if (num != null) {
                    String numStr = getValue(num);
                    if (StringUtils.isNotBlank(numStr)) {
                        if (numStr.contains(".0")) {
                            numStr = numStr.replace(".0","");
                            client.set("num",numStr);
                        }else {
                            client.set("num",numStr);
                        }
                    }
                }
                //面积
                HSSFCell area = xssfRow.getCell(6);
                if (area != null) {
                    client.set("area",getValue(area));
                }
                //电话
                HSSFCell phone = xssfRow.getCell(7);
                if (phone != null) {
                    String phoneStr = getValue(phone);
                    if (StringUtils.isNotBlank(phoneStr) && phoneStr.length() > 11 && phoneStr.contains(".")) {
                        phoneStr = phoneStr.substring(0,phoneStr.length()-3).replace(".","");
                        client.set("phone",phoneStr);
                    }else {
                        client.set("phone",phoneStr);
                    }
                }
                //备注
                HSSFCell remark = xssfRow.getCell(8);
                if (remark != null) {
                    client.set("remark",getValue(remark));
                }
                //保存
                StringBuffer house_name = new StringBuffer();
                if (StringUtils.isNotBlank(client.getStr("building"))
                        && StringUtils.isNotBlank(client.getStr("unit"))
                        && StringUtils.isNotBlank(client.getStr("num"))){
                    house_name.append(client.getStr("building"))
                            .append("栋").append(client.getStr("unit"))
                            .append("单元").append(client.getStr("num"));
                }
                client.set("house_name",house_name.toString());
                client.set("process_state", "NOT");
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
                //楼盘
                XSSFCell park_name = xssfRow.getCell(1);
                if (park_name != null) {
                    client.set("park_name",getValue(park_name));
                }
                //栋号
                XSSFCell building = xssfRow.getCell(2);
                if (building != null) {
                    String buildingStr = getValue(building);
                    if (StringUtils.isNotBlank(buildingStr)) {
                        if (buildingStr.contains(".0")) {
                            buildingStr = buildingStr.replace(".0","");
                            client.set("building",buildingStr);
                        }else {
                            client.set("building",buildingStr);
                        }
                    }
                }
                //单元
                XSSFCell unit = xssfRow.getCell(3);
                if (unit != null) {
                    String unitStr = getValue(unit);
                    if (StringUtils.isNotBlank(unitStr)) {
                        if (unitStr.contains(".0")) {
                            unitStr = unitStr.replace(".0","");
                            client.set("unit",unitStr);
                        }else {
                            client.set("unit",unitStr);
                        }
                    }
                }
                //楼层
                XSSFCell floor = xssfRow.getCell(4);
                if (floor != null) {
                    String floorStr = getValue(floor);
                    if (StringUtils.isNotBlank(floorStr)) {
                        if (floorStr.contains(".0")) {
                            floorStr = floorStr.replace(".0","");
                            client.set("floor",floorStr);
                        }else {
                            client.set("floor",floorStr);
                        }
                    }
                }
                //房号
                XSSFCell num = xssfRow.getCell(5);
                if (num != null) {
                    String numStr = getValue(num);
                    if (StringUtils.isNotBlank(numStr)) {
                        if (numStr.contains(".0")) {
                            numStr = numStr.replace(".0","");
                            client.set("num",numStr);
                        }else {
                            client.set("num",numStr);
                        }
                    }
                }
                //面积
                XSSFCell area = xssfRow.getCell(6);
                if (area != null) {
                    client.set("area",getValue(area));
                }
                //电话
                XSSFCell phone = xssfRow.getCell(7);
                if (phone != null) {
                    String phoneStr = getValue(phone);
                    if (StringUtils.isNotBlank(phoneStr) && phoneStr.length() > 11 && phoneStr.contains(".")) {
                        phoneStr = phoneStr.substring(0,phoneStr.length()-3).replace(".","");
                        client.set("phone",phoneStr);
                    }else {
                        client.set("phone",phoneStr);
                    }
                }
                //备注
                XSSFCell remark = xssfRow.getCell(8);
                if (remark != null) {
                    client.set("remark",getValue(remark));
                }
                //保存
                StringBuffer house_name = new StringBuffer();
                if (StringUtils.isNotBlank(client.getStr("building"))
                        && StringUtils.isNotBlank(client.getStr("unit"))
                        && StringUtils.isNotBlank(client.getStr("num"))){
                    house_name.append(client.getStr("building"))
                            .append("栋").append(client.getStr("unit"))
                            .append("单元").append(client.getStr("num"));
                }
                client.set("house_name",house_name.toString());
                client.set("process_state", "NOT");
                client.set("status", Status.VALID.name());
                client.set("create_time", new Date());
                if (StringUtils.isNotBlank(client.getStr("name")) && StringUtils.isNotBlank(client.getStr("phone"))){
                    client.save();
                }
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
