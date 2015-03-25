<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>
<div class="page-content">
        <div class="col-xs-12">
            <#--<button class="btn btn-primary Js_upload_pics" data-config-code="${id}" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">上传图片</button>-->
            <div class="hr"></div>

            <!-- PAGE CONTENT BEGINS -->
            <div class="row-fluid">
                <ul class="ace-thumbnails clearfix Js_thumbs">
                    <#list data as pic>
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
            <div class="clearfix"></div>
            <div class="clearfix form-actions">
                <div class=" col-md-9">
                    <a href="javascript:history.back()" class="btn" type="reset">
                        <i class="icon-undo bigger-110"></i>
                        返回
                    </a>
                </div>
            </div>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->

</div><!-- /.page-content -->


<script type="text/javascript">

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
                '			<a href="javascript:" class="Js_edit_pic">',
                '				<i class="icon-pencil" title="编辑"></i>',
                '			</a>',
                '			<a href="javascript:" class="Js_del_pic">',
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

        //修改图片描述
        $(document).on("click",".Js_edit_pic",function(){
            var $this = $(this);
            var _val = $this.parents("li").find('.inner').text();
            var _sort = $this.parents("li").find('.sorts').val();
            _val == "请填写图片描述" ? _val = "" : _val;
            var _html = [
                '<div class="widget-box no-border">',
                '	<div class="widget-header no-border">',
                '		<h4>修改图片描述</h4>',
                '	</div>',
                '	<div class="widget-body no-border">',
                '		<div class="widget-main no-padding">',
                '			<form class="album_form">',
                '				<fieldset>',
                '					<div class="form-group">',
                '						<label>相片描述：</label>',
                '						<textarea class="form-control Js_pic_des" id="" maxlength="20" style="height:100px" placeholder="20个字以内">'+_val+'</textarea>',
                '					</div>',
                '					<div class="form-group">',
                '						<label>排序序号：</label>',
                '						<input type="text" class="form-control Js_sort" placeholder="默认为1，排在第一位"  id="" maxlength="2" value="'+_sort+'">',
                '					</div>',
                '				</fieldset>',
                '				<div class="form-actions center">',
                '					<button type="button" class="btn btn-sm btn-success Js_edit_pic_save" >',
                '						<b>确定</b>',
                '						<i class="icon-arrow-right icon-on-right bigger-110"></i>',
                '					</button>',
                '				</div>',
                '			</form>',
                '		</div>',
                '	</div>',
                '</div>'].join("");

            $.fancybox({
                width : 400,
                height : 'auto',
                autoSize : false,
                padding : 0,
                scrolling : 'no',
                content: _html,
                afterShow : function(){
                    $(".Js_edit_pic_save").on("click", function(){
                        editpic($this,$(this))
                    });
                }
            })
        });

        $(document).on("click",".Js_del_pic",function(){
            $(this).parents("li").remove()
        })
    });

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

</@we.html>