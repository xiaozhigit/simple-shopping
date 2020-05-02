<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layui/css/layui.css"
          media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header"></div>
        <div class="layui-card-body" pad15="">
            <form class="layui-form" action="">
                <input name="id" readonly="" autocomplete="off" class="layui-input" type="hidden" value=0>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名称</label>
                        <div class="layui-input-inline">
                            <input name="username" lay-verify="required" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-inline">
                            <input name="sex" lay-verify="required" autocomplete="off" value="1"  title="男" class="layui-input" type="radio">
                            <input name="sex" lay-verify="required" autocomplete="off" value="0" title="女"  class="layui-input" type="radio">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-inline uploadHeadImage">
                            <div class="layui-upload-drag" id="image">
                                <i class="layui-icon"></i>
                                <p>点击上传图片，或将图片拖拽到此处</p>
                            </div>
                        </div>
                        <div class="layui-input-inline">
                            <div class="layui-upload-list">
                                <img class="layui-upload-img headImage" src="http://t.cn/RCzsdCq" id="demo1">
                                <input name="avatar"  type="hidden" id="image_input">
                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input name="email" lay-verify="required|email" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-inline">
                            <input name="phone" lay-verify="required" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">地址</label>
                        <div class="layui-input-inline">
                            <input name="address" lay-verify="required" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="addAd">添加</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layedit','upload'], function () {
        var $ = layui.jquery
            , form = layui.form
            , layer = layui.layer
            ,upload = layui.upload
            , layedit = layui.layedit;
        var index = parent.layer.getFrameIndex(window.name);
        form.render();
        //图片上传
        var uploadInst = upload.render({
            elem: '#image'
            , url: '/upload/image'
            , size: 500
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..
                  console.log(res.data.src);
             //   window.parent.uploadHeadImage.valueOf(res.data.src);
                $('#image_input').val(res.data.src);
                $('#demoText').html('<span style="color: #8f8f8f;">上传成功!</span>');
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        //监听提交
        form.on('submit(addAd)', function (data) {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/addUser",
                type: "post",
                //async: false,
                data: data.field,
                dataType: "json",
                success: function (data) {
                    if (data.msg != '0') {
                        layer.alert("添加成功", {icon: 1, time: 1000}, function () {
                            layer.close(layer.index);
                            window.parent.location.reload();
                        });
                        layer.close(layer.index);
                        window.parent.location.reload();
                    } else {
                        layer.alert("添加失败", {icon: 2, time: 2000});
                    }
                },
                error: function (e) {
                    console.log(e)
                }
            });
            return false;
        });
    });
</script>
</body>
</html>