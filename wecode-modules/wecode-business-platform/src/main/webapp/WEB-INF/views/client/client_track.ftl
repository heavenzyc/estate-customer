<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="space-6"></div>
            <form class="form-horizontal" action="">
                <input type="hidden" id="id" name="id" value="${data.id}">
                <h3 class="header smaller lighter blue">
                    客户信息
                </h3>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 姓名： </label>
                            <div class="col-sm-6">
                                <span class="form-text">${data.name}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 电话： </label>
                            <div class="col-sm-6">
                                <span class="form-text">${data.phone}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 小区名称： </label>
                            <div class="col-sm-6">
                                <span class="form-text">${data.park_name}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 房号： </label>
                            <div class="col-sm-6">
                                <span class="form-text">${data.house_name}</span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 状态： </label>
                            <div class="col-sm-6">
                                <#if data.process_state=='NOT'>
                                    <span class="form-text label label-sm label-primary arrowed arrowed-right">未联系</span>
                                </#if>
                                <#if data.process_state=='DONE'>
                                    <span class="form-text label label-sm label-success arrowed arrowed-right">已联系</span>
                                </#if>
                                <#if data.process_state=='SOLD'>
                                    <span class="label label-sm label-danger arrowed arrowed-right">已出售</span>
                                </#if>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 面积： </label>
                            <div class="col-sm-6">
                                <span class="form-text">${data.area} 平米</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label class="col-sm-6 control-label no-padding-right"> 备注： </label>
                            <div class="col-sm-6">
                                <span class="form-text">${data.remark}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"> 图片： </label>

                    <div class="col-sm-10">
                        <div class="row-fluid">
                            <ul class="ace-thumbnails clearfix Js_thumbs">
                                <#list pics as pic>
                                    <li>
                                        <a href="/upload/${pic.url}" data-rel="colorbox" class="cboxElement">
                                            <img alt="150x150" src="/upload/${pic.url}">
                                            <input type="hidden" name="picurl" value=""/>
                                            <input type="hidden" name="picid" value="${pic.id}"/>
                                        </a>
                                        <div class="tools tools-top">
                                            <a href="javascript:void(0)" onclick="deleteInfo(${pic.id})">
                                                <i class="icon-remove red" title="删除"></i>
                                            </a>
                                        </div>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-6 control-label no-padding-right"></label>
                        <div class="col-sm-6">
                            <button class="btn btn-primary Js_upload_pics" data-config-code="${data.id}" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">上传图片</button>
                        </div>
                    </div>
                </div>
            </div>
            <form class="form-horizontal" action="">
                <h3 class="header smaller lighter blue">处理信息</h3>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"> </label>
                    <div class="col-sm-5">
                        <div class="input-group">
                            <span class="input-group-btn">
                                <select style="height: 34px" id="process_state" name="process_state">
                                    <option value="NOT" <#if data.process_state=='NOT'>selected</#if>>未联系</option>
                                    <option value="DONE" <#if data.process_state=='DONE'>selected</#if>>已联系</option>
                                    <option value="SOLD" <#if data.process_state=='SOLD'>selected</#if>>已出售</option>
                                </select>&nbsp;&nbsp;
                            </span>
                            <input type="text" id="remark" class="form-control search-query" placeholder="请填写跟进信息">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-purple btn-sm Js_track">
                                    跟进
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"> 跟进信息： </label>
                    <div class="col-xs-12 col-sm-5">
                        <table class="table table-bordered table-striped">
                            <tbody class="hb-content" id="track_info">
                            <#list tracks as item>
                            <tr>
                                <td><span class="form-text">${item.remark}</span></td>
                                <td><span class="form-text">${(item.create_time)?string("yyyy-MM-dd HH:mm")}</span></td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
            <div class="clearfix form-actions">
                <div class="col-md-offset-2 col-md-9">
                    <button class="btn btn-info Js_complete" type="button" onclick="history.back()">
                        <i class="icon-undo bigger-110"></i>
                        返回
                    </button>
                </div>
            </div>

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div>

</div><!-- /.page-content -->
</@we.html>
<script>
    var colorbox_params = {
        reposition:true,
        scalePhotos:true,
        scrolling:false,
        previous:'<i class="icon-arrow-left"></i>',
        next:'<i class="icon-arrow-right"></i>',
        close:'&times;',
        current:'{current} of {total}',
        maxWidth:'100%',
        maxHeight:'100%',
        onOpen:function(){
            document.body.style.overflow = 'hidden';
        },
        onClosed:function(){
            document.body.style.overflow = 'auto';
        },
        onComplete:function(){
            $.colorbox.resize();
        }
    };

    //图片上传及显示
    jQuery(function($) {
        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");

        //调用上传图片
        uploadPic("Js_upload_pics",function(data){
            var url = $("#upload-thumborg").attr("src");
            var id = $("#upload-thumborg").attr("data-id");

            var _h = [
                '	<li>',
                        '		<a href="'+url+'" data-rel="colorbox" class="cboxElement">',
                        '			<img alt="150x150" src="'+url+'">',
                        '			<input type="hidden" name="picurl" value="'+url+'"/>',
                        '			<input type="hidden" name="picid" value="'+id+'"/>',
                '			<div class="text">',
                '				<div class="inner">请填写图片描述</div>',
                '				<input class="picdes" type="hidden" name="picdes" value="" />',
                '			</div>',
                '			<div class="text">',
                '				<div>排序序号</div>',
                '				<input class="sorts" type="hidden" name="sorts" value="1" />',
                '			</div>',
                '		</a>',
                '		<div class="tools tools-top">',
      /*          '			<a href="javascript:" class="Js_edit_pic">',
                '				<i class="icon-pencil" title="编辑"></i>',
                '			</a>',*/
                '			<a href="javascript:" class="" onclick="deleteInfo('+id+')">',
                '				<i class="icon-remove red" title="删除"></i>',
                '			</a>',
                '		</div>',
                '	</li>'].join("");
            $(".Js_thumbs").append(_h);
            $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        }).init();



        var editpic = function(obj,$this){
            var _text = WG.fn.htmlspecialchars($this.parents(".widget-body").find(".Js_pic_des").val());
            var _sort = WG.fn.htmlspecialchars($this.parents(".widget-body").find(".Js_sort").val());
            obj.parents("li").find(".inner").text(_text);
            obj.parents("li").find(".picdes").val(_text);
            obj.parents("li").find(".sorts").val(_sort);
            $.fancybox.close()
        };
        $(document).on("click",".Js_del_pic",function(){
            $(this).parents("li").remove()
        })
    });

    //跟进操作
    $(function(){
        $(".Js_track").on("click",function(){
            var $this = $(this);
            var process_state = $("#process_state").val();
            var remark = $("#remark").val();
            var id = $("#id").val();
            $.validity.start();
            $("#remark").require("请输备注");
            var result = $.validity.end().valid;
            if(result == false) return;
            $.ajax({
                url:'/client/track',
                type:'post',
                data:{id:id,process_state:process_state,remark:remark},
                success:function(json) {
                    if(json.success) {
                        /*var data = json.data;
                        var _html = [
                            '<tr>',
                            '<td><span class="form-text">'+data.remark+'</span></td>',
                            '<td><span class="form-text">'+data.create_time+'</span></td>',
                            '</tr>'
                        ].join("");
                        $("#track_info").prepend(_html);*/
                        window.location.reload();
                    }else {
                        showToast("网络连接错误，请稍后重试");
                    }
                }
            });
        });
    });

    function showToast(text,title,time){
        $.gritter.add({
            title : title || '信息提示',
            time : time || 1000,
            text : text,
            class_name : 'gritter-info gritter-center'
        });
    }

    function deleteInfo(picId) {
        bootbox.confirm("确定删除该图片吗?", function(result) {
            if(result) {
                $.ajax({
                    url:"/client/deletePic",
                    async: false,
                    type:'post',
                    data:{picId:picId},
                    success:function(json) {
                        if(json.success) {
                            window.location.reload();
                        }else{
                            showToast("网络连接失败，请稍后重试！");
                        }
                    }
                });
            }
        });
    }
</script>