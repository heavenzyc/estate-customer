<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="page-header">
        <button class="btn btn-primary JS_improt">导入数据</button>
        <a class="btn btn-danger" href="/client/exportExcel">导出数据</a>
        <a class="btn btn-success" href="/client/add">添加数据</a>
    </div>

    <div class="row">
        <div class="col-xs-12" >
            <div class="space-6"></div>
            <div class="clearfix">
                <div class="pull-left text-left clearfix" style="margin-left:20px;">
                    <label class="pull-left" style="margin-top:5px">状态：</label>
                    <div class="pull-left" style="margin-right:30px;">
                    <select class="" id="process_state" name="process_state" onchange="searchSub()">
                        <option value="ALL">全部</option>
                        <option value="NOT">未联系</option>
                        <option value="DONE">已联系</option>
                        <option value="SOLD">已出售</option>
                    </select>
                    </div>

                    <label class="pull-left" style="margin-top:5px">关键字：</label>
                    <div class="pull-left" style="margin-right:10px;">
                        <input id="key" name="key" type="text" class="width-100" placeholder="姓名/电话">
                    </div>
                    <div class="pull-left" style="margin-right:10px;">
                        <input id="park_name" name="park_name" type="text" class="width-100" placeholder="小区名称">
                    </div>
                    <div class="pull-left" style="margin-right:10px; width: 80px">
                        <input id="building" name="building" type="text" class="width-100" placeholder="楼栋">
                    </div>
                    <div class="pull-left" style="margin-right:10px; width: 80px">
                        <input id="unit" name="unit" type="text" class="width-100" placeholder="单元">
                    </div>
                    <div class="pull-left" style="margin-right:10px; width: 80px">
                        <input id="floor" name="floor" type="text" class="width-100" placeholder="楼层">
                    </div>
                    <div class="pull-left" style="margin-right:10px; width: 80px">
                        <input id="num" name="num" type="text" class="width-100" placeholder="房号">
                    </div>

                    <span class="pull-left" style="margin:3px 0 0 10px;">
                        <button id="find_btn" type="button" class="btn btn-purple btn-sm" style="position: relative; padding:2px 8px; top:-2px">
                            查询
                            <i class="icon-search icon-on-right bigger-110" placeholder=""></i>
                        </button>
                    </span>
                </div>

            </div>
            <div class="space-6"></div>
            <div class="table-responsive">
                <table id="grid-table"></table>
                <div id="grid-pager"></div>
                <script type="text/javascript">
                    var $path_base = "/";
                    //this will be used in gritter alerts containing images
                </script>
            </div>
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->
</@we.html>

<script>

    $(function () {
        $("#find_btn").click(function(){
            searchSub();
        });
    });

    function searchSub(){
        var key = $("#key").val();
        var park_name = $("#park_name").val();
        var building = $("#building").val();
        var unit = $("#unit").val();
        var floor = $("#floor").val();
        var num = $("#num").val();
        var process_state = $("#process_state").val();
        $("#grid-table").jqGrid('setGridParam',{
            url:"/client/list",
            postData:{
                key:key,
                process_state:process_state,
                park_name:park_name,
                building:building,
                unit:unit,
                floor:floor,
                num:num
            }
        }).trigger("reloadGrid");
    }

    jQuery(function($){
        var pager_selector = "#grid-pager";
        var table = $("#grid-table");
        table.jqGrid({
            url : "/client/list",
            datatype : "json",
            mtype : 'get',
            height : 380,
//            caption:'客户信息',
            rownumbers: true,
            scrollOffset:1,
            colModel :
                    [
                        {name : 'id',index : 'id',hidden : true,width :0,sorttype : "int",editable : false, fixed:false},
                        {name : 'name',label:'姓名',index :'name',sorttype : "int",editable : false, fixed:false,formatter:function(value, options, rData){
                            return '<a href="/client/info/'+rData.id+'">'+value+'</a>'
                        }},
                        {name : 'phone',label:'电话',index :'phone',sorttype : "int",editable : false, fixed:false},
                        {name : 'park_name',index : 'park_name',label:'小区名称',editable : false, fixed:false},
                        {name : 'building',index : 'building',label:'栋号',editable : false, fixed:false},
                        {name : 'unit',index : 'unit',label:'单元',editable : false, fixed:false},
                        {name : 'floor',index : 'floor',label:'楼层',editable : false, fixed:false},
                        {name : 'num',index :'num',label:'房号',editable : false, fixed:false},
                        {name : 'house_name',index :'house_name',label:'地址',editable : false, fixed:false},
                        {name : 'area',index :'area',label:'面积(㎡)',editable : false, fixed:false},
                        {name : 'process_state',index :'process_state',label:'处理状态',editable : false, fixed:false,formatter:function(value){
                            if (value == 'NOT'){
                              return '<span class="label label-sm label-primary arrowed arrowed-right">未联系</span>';
                            }
                            if (value == 'DONE') {
                                return '<span class="label label-sm label-success arrowed arrowed-right">已联系</span>';
                            }
                            if (value == 'SOLD') {
                                return '<span class="label label-sm label-danger arrowed arrowed-right">已出售</span>';
                            }
                        }},
                        {name : 'id',index : 'id',label:'操作',fixed : true, width:150,sortable : false,resize : false,formatter : function(value, options, rData){
                            var html = '';
                            html += '<a class="btn no-border btn-minier btn-danger Js_process" href="/client/info/'+value+'">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;';
                            html += '<a class="btn no-border btn-minier btn-primary" href="/client/update/'+value+'">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
                            html += '<button class="btn no-border btn-minier btn-warning" onclick="deleteInfo('+value+')" >删除</button>';

                            return html;
                        }}
                    ],
            viewrecords : true,
            rowNum : 10,
            rowList : [10, 20, 30],
            pager : pager_selector,
            altRows : true,
            autowidth:true,
            multiselect : false,
            multiboxonly : false,
            loadComplete : function(data) {
                var table = this;
                setTimeout(function() {
                    //styleCheckbox(table);
                    updateActionIcons(table);
                    updatePagerIcons(table);
                    enableTooltips(table);
                }, 0);
            }
        });

    });

    function updateActionIcons(table) {

        var replacement = {
            'ui-icon-pencil' : 'icon-pencil blue',
            'ui-icon-trash' : 'icon-trash red',
            'ui-icon-disk' : 'icon-ok green',
            'ui-icon-cancel' : 'icon-remove red'
        };
        $(table).find('.ui-pg-div span.ui-icon').each(function() {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
            if ( $class in replacement)
                icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    //replace icons with FontAwesome icons like above
    function updatePagerIcons(table) {
        var replacement = {
            'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
            'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
            'ui-icon-seek-next' : 'icon-angle-right bigger-140',
            'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
        };
        $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function() {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

            if ( $class in replacement)
                icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({
            container : 'body'
        });
        $(table).find('.ui-pg-div').tooltip({
            container : 'body'
        });
    }



    $(".JS_improt").on("click",function(){
        var $this = $(this);
        var _html = [
            '<div class="widget-box no-border">',
            '	<div class="widget-header no-border">',
            '		<h4>导入数据</h4>',
            '	</div>',
            '	<div class="widget-body no-border">',
            '		<div class="widget-main no-padding">',
            '			<div class="material-list-wrap" style="height:auto">',
            '				<form id="inputExcel" enctype="multipart/form-data">',
            '					<div class="space-10"></div>',
            '					<div class="form-group clearfix">',
            '						<div class="col-sm-12">',
                    '                     <input type="file" name="excel" id="id-input-file-2" />',
            '						</div>',
            '					</div>',
            '				</form>',
            '			</div>',
            '			<div class="form-actions center no-margin">',
            '				<button type="button" class="btn btn-sm btn-success Js_confirm">',
            '					<b>确定</b>',
            '				</button>',
            '				<button class="btn btn-sm btn-grey Js_fancybox_close">',
            '					取消',
            '				</button>',
            '			</div>',
            '		</div>',
            '	</div>',
            '</div>'].join("");

        $.fancybox({
            type : "html",
            width : '600',
            autoHeight : true,
            autoSize : false,
            padding : 0,
            scrolling : 'auto',
            content: _html,
            afterShow : function(){
                $('#id-input-file-2').ace_file_input({
                    no_file:'选择文件 ...',
                    btn_choose:'选 择',
                    btn_change:'选 择',
                    droppable:false,
                    onchange:null,
                    thumbnail:false, //| true | large
                    whitelist:'xsl|xlsx'
                    //blacklist:'exe|php'
                    //onchange:''
                    //
                });
                $(".Js_confirm").on("click", function(){
                    //showSelectWordpic($this)
                    $.ajaxFileUpload({
                        url:'/client/importExcel',
                        type:'post',
                        fileElementId:'id-input-file-2',
                        dataType:'text',
                        secureuri:false,
                        success:function(json) {
                            if(json.indexOf('true')!=-1){
                                showToast("导入成功！");
                                $.fancybox.close();
                                $("#grid-table").trigger("reloadGrid");
                            }else{
                                showToast("导入失败！");
                            }
                        }
                    });
                });
            },
            afterClose: function(){
                $(".Js_confirm").off("click");
            }
        })
    });

    /*$(document).on("click",".Js_fancybox_close",function(){
        $.fancybox.close()
    })*/

    function show_process(id,state,process_remark){
        var html = '<select class="width-60" id="process_state" name="process_state">';
        if(state == 'NOT') {
            html += '<option value="NOT" selected>未联系</option>';
        }else {
            html += '<option value="NOT">未联系</option>';
        }
        if(state == 'DONE') {
            html += '<option value="DONE" selected>已联系</option>';
        }else{
            html += '<option value="DONE">已联系</option>';
        }
        if(state == 'SOLD') {
            html += '<option value="SOLD" selected>已出售</option>';
        }else {
            html += '<option value="SOLD">已出售</option>';
        }
        html += '</select>';
        var _html = [
            '<div class="widget-box no-border">',
            '	<div class="widget-header no-border">',
            '		<h4>信息处理</h4>',
            '	</div>',
            '	<div class="widget-body no-border">',
            '		<div class="widget-main no-padding">',
            '			<div class="material-list-wrap" style="height:auto">',
            '				<form id="process_form">',
            '                   <input type="hidden" name="id" value="'+id+'" id="booking_id">',
            '					<div class="space-10"></div>',
            '					<div class="form-group clearfix">',
            '						<label class="col-sm-3 control-label no-padding-right text-right" for="form-field-1"> 处理：</label>',
            '						<div class="col-sm-9">',
                                         html,
            '						</div>',
            '					</div>',
            '					<div class="form-group clearfix">',
            '						<label class="col-sm-3 control-label no-padding-right text-right" for="form-field-1"> 备注：</label>',
            '						<div class="col-sm-9">',
            '							<textarea name="process_remark" rows="5" cols="40">'+process_remark+'</textarea>',
            '						</div>',
            '					</div>',
            '				</form>',
            '			</div>',
            '			<div class="form-actions center no-margin">',
            '				<button type="button" class="btn btn-sm btn-success Js_confirm">',
            '					<b>确定</b>',
            '				</button>',
            '				<button class="btn btn-sm btn-grey Js_fancybox_close">',
            '					取消',
            '				</button>',
            '			</div>',
            '		</div>',
            '	</div>',
            '</div>'].join("");

        $.fancybox({
            type : "html",
            width : '600',
            autoHeight : true,
            autoSize : false,
            padding : 0,
            scrolling : 'auto',
            content: _html,
            afterShow : function(){
                $(".Js_confirm").on("click", function(){
                    var data = $("#process_form").serialize();
                    $.ajax({
                        url:'/client/process',
                        type:'post',
                        data:data,
                        success:function(json){
                            if(json.success){
                                showToast("处理成功！");
                                $("#grid-table").trigger("reloadGrid");
                            }else{
                                showToast("处理失败！");
                            }
                            $.fancybox.close();
                        }
                    });
                });
            },
            afterClose: function(){
                $(".Js_confirm").off("click");
            }
        })
    }

    $(document).on("click",".Js_fancybox_close",function(){
        $.fancybox.close()
    });

    function showToast(text,title,time){
        $.gritter.add({
            title : title || '信息提示',
            time : time || 1000,
            text : text,
            class_name : 'gritter-info gritter-center'
        });
    }

    function deleteInfo(id) {
        bootbox.confirm("确定删除该数据吗?", function(result) {
            if(result) {
                $.ajax({
                    url:"/client/delete",
                    async: false,
                    type:'GET',
                    data:{id:id},
                    success:function(json) {
                        if(json.success) {
                            $("#grid-table").trigger("reloadGrid");
                            showToast("删除成功！");
                        }else{
                            showToast("网络连接失败，请稍后重试！");
                        }
                    }
                });
            }
        });
    }

</script>