<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->
            <form id="edit_client_info" class="form-horizontal" houseType="form" action="/client/modify" method="post">
                <input type="hidden" name="id" value="${data.id}"/>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" id="name" class="col-xs-10 col-sm-5" name="name" value="${data.name}" maxlength="10" placeholder=""/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">电话</label>
                    <div class="col-sm-10">
                        <input type="text" id="phone" class="col-xs-10 col-sm-5" name="phone" value="${data.phone}" maxlength="30" placeholder="电话"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">小区名称</label>
                    <div class="col-sm-10">
                        <input type="text" id="park_name" class="col-xs-10 col-sm-5" name="park_name" value="${data.park_name}" maxlength="30" placeholder=""/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"><label class="color-orange">*</label>栋号</label>
                    <div class="col-sm-10">
                        <input type="text" id="building" class="col-xs-10 col-sm-5" name="building" value="${data.building}" maxlength="10" placeholder=""/><span class="form-text">&nbsp;栋</span>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"><label class="color-orange">*</label>单元</label>
                    <div class="col-sm-10">
                        <input type="text" id="unit" class="col-xs-10 col-sm-5" name="unit" value="${data.unit}" maxlength="10" placeholder=""/><span class="form-text">&nbsp;单元</span>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"><label class="color-orange">*</label>楼层</label>
                    <div class="col-sm-10">
                        <input type="text" id="floor" class="col-xs-10 col-sm-5" name="floor" value="${data.floor}" maxlength="10" placeholder=""/><span class="form-text">&nbsp;层</span>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"><label class="color-orange">*</label>房号</label>
                    <div class="col-sm-10">
                        <input type="text" id="num" class="col-xs-10 col-sm-5" name="num" value="${data.num}" maxlength="10" placeholder="例如：801"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"><label class="color-orange">*</label>面积</label>
                    <div class="col-sm-10">
                        <input type="text" id="area" class="col-xs-10 col-sm-5" name="area" value="${data.area}" maxlength="10" placeholder="例如：120.4"/><span class="form-text">&nbsp;平米</span>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">备注</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="500字以内">${data.remark}</textarea>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok bigger-110"></i>
                            保存
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <a href="javascript:history.go(-1);" class="btn" type="reset">
                            <i class="icon-undo bigger-110"></i>
                            取消
                        </a>
                    </div>
                </div>
            </form>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">

    $(function(){
        // 验证插件
        $("#edit_client_info").validity(function(){
            $("#name").require("请输入姓名");
            $("#phone").require("请输入电话号码");
            $("#park_name").require("请输入小区名称");
            $("#house_name").require("请输入房号");
        });
    })

</script>

</@we.html>