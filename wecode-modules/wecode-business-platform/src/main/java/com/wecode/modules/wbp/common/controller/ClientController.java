package com.wecode.modules.wbp.common.controller;

import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.modules.wbp.common.model.Client;

import java.util.HashMap;
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
}
