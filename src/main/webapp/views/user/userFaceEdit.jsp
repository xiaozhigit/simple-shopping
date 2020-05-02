<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/static/layui/css/layui.css"
      media="all">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
</head>
<body>
<div class="layui-card-header">修改信息</div>
<div class="layui-card-body" pad15="">
    <div class="layui-form-item">
        <div class="layui-upload">
            <label class="layui-form-label">头像</label>
            <div class="layui-input-inline">
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1" style="width:150px; height:130px;">
                    <p id="demoText"></p>
                </div>
                <input name="id"  id="id" type="hidden" value="${sessionScope.user.id}">
                <input name="avatar"  id="avatar" type="hidden">
            </div>
            <div class="layui-form-min layui-word-aux">点击图片选择上传</div>
        </div>
    </div>
    <div class="layui-card-header"></div>
    <div class="layui-card-body" pad12="6">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="demo1" lay-filter="demo1" id="test9">确认修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layedit', 'upload'], function () {
        form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , upload = layui.upload;
        form.render();
        //选完文件后不自动上传
        upload.render({
            elem: '#demo1'
            , url: '${pageContext.request.contextPath}/upload/image'
            , auto: false
            //,multiple: true
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , bindAction: '#test9'
            , done: function (res) {
                //如果上传失败
                if (res.code != 0) {
                    return layer.msg('上传失败');
                } else{
                 $("#avatar").val(res.data.src);
                 //更新数据库用户头像信息
                    updateUserAvatar();
                    //上传成功
                    return //layer.msg('上传成功');
                }
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });

    function updateUserAvatar() {
        var submitData={};
        submitData.id=$("#id").val();
        submitData.avatar=$("#avatar").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/editUser",
                type: "post",
                async: false,
                data: submitData,
                dataType: "json",
                success: function (data) {
                    if (data.msg != 0) {
                        layer.alert("修改成功", {icon: 1, time: 2000}, function () {
                            layer.close(layer.index);
                            window.parent.location.reload();
                        });
                        layer.close(layer.index);
                        window.parent.location.reload();
                    } else {
                        layer.alert("修改失败", {icon: 2, time: 2000});
                    }
                }
            });
    }
</script>
</body>
</html>