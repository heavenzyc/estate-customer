<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->
            <form id="add_input_info" class="form-horizontal" houseType="form" action="/client/save" method="post">
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">项目工程名</label>

                    <div class="col-sm-10">
                        <input type="text" id="project_name" class="col-xs-10 col-sm-5" name="project_name" maxlength="50"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">备注</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="500字以内"></textarea>
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
        $(".chosen-select").chosen();

        // 验证插件
        $("#add_input_info").validity(function(){
            $("#count").require("请输入价格").match("number");
        });
        getSender();
        getUnit();
    })

    function getSender(){
        var id = $("#provideMerchant").val();
        $.ajax({
            url:'/input/getSendPersons',
            type:'get',
            data:{merchantId:id},
            success:function(json){
                var data = json.data;
                $("#senderDiv").empty();
                var html = '<select class="width-40 chosen-select" data-placeholder="请选择..." name="send_person_id">'
                for(var i=0; i<data.length; i++) {
                    html += "<option value="+data[i].id+">"+data[i].name+"</option>";
                }
                html += "</select>"
                $("#senderDiv").append(html);
                $(".chosen-select").chosen();
            }
        });
    }

    function getUnit(){
        var id = $("#material").val();
        $.ajax({
            url:'/input/getUnit',
            type:'get',
            data:{material:id},
            success:function(json){
                $("#unit").html("").html(json);
            }
        });
    }

</script>

</@we.html>