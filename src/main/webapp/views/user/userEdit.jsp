<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
</head>
<body>
<div class="layui-card-header">修改信息</div>
<div class="layui-card-body" pad15="">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input name="id" value="${data.id}" type="hidden" >
                <input name="username" value="${data.username}" readonly="" class="layui-input" type="text">
            </div>
            <div class="layui-form-mid layui-word-aux">不可修改</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input name="sex" value="1" title="男" type="radio" lay-filter="sexradio">
                <div class="layui-unselect layui-form-radio">
                    <i class="layui-anim layui-icon"></i>
                    <div>男</div>
                </div>
                <input name="sex" value="0" title="女" type="radio" lay-filter="sexradio">
                <div class="layui-unselect layui-form-radio layui-form-radioed">
                    <i class="layui-anim layui-icon"></i>
                    <div>女</div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-inline">
                <input name="birthday" type="text" class="layui-input" id="birthday_select" value="${data.birthday}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机</label>
            <div class="layui-input-inline">
                <input name="phone" lay-verify="required|phone" value="${data.phone}"
                       class="layui-input" type="tel">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input name="email" lay-verify="required|email" value="${data.email}"
                       class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-inline">
                <input name="address" lay-verify="required" value="${data.address}"
                       class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-card-body" pad12="6">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="demo1" lay-filter="demo1" id="test9">确认修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
                </div>
            </div>
        </div>
    </form>
</div>


<script>
    layui.use(['form', 'layedit', 'upload','laydate'], function () {
        //var $ = layui.jquery
        form = layui.form
            , layer = layui.layer
            ,laydate=layui.laydate
            ,layedit = layui.layedit;

        if ('${data.sex}' == 0) {
            $("input[name=sex][value='0']").attr("checked", true)
        }
        if ('${data.sex}' == 1) {
            $("input[name=sex][value='1']").attr("checked", true)
        }

        form.render();
        laydate.render({
            elem:'#birthday_select'
        });
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });
        form.on("radio(sexradio)", function (obj) {
            obj.elem.checked;/*
	     console.log(obj.elem.value);
	     console.log(obj.elem.title);  */
        });
        //监听提交
        form.on('submit(demo1)', function (data) {
            //提交表单发送请求
            $.ajax({
                url: "${pageContext.request.contextPath}/user/editUser",
                type: "post",
                async: false,
                data: data.field,
                dataType: "json",
                success: function (data) {
                    if (data.code == 1) {
                        layer.alert("修改成功", {icon: 1, time: 1000}, function () {
                            layer.close(layer.index);
                            window.parent.location.reload();
                        });
                        layer.close(layer.index);
                        window.parent.location.reload();
                    } else {
                        layer.alert("修改失败", {icon: 2, time: 2000});
                    }
                    form.render();
                }
            });
            return false;
        });
    });
</script>
</body>
</html>