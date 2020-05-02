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
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">ID</label>
                        <div class="layui-input-inline">
                            <input name="id" lay-verify="required" readonly="" readonly="" autocomplete="off"
                                   class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input name="username" lay-verify="required" readonly="" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-inline">
                            <input name="sex" lay-verify="required" readonly="" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-inline">
                          <img src="" alt="">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input name="email" lay-verify="email" readonly="" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">生日 </label>
                        <div class="layui-input-inline">
                            <input name="birthday" lay-verify="required" readonly="" autocomplete="off"
                                   class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">电话 </label>
                        <div class="layui-input-inline">
                            <input name="phone" lay-verify="required|number" readonly="" autocomplete="off"
                                   class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">地址 </label>
                        <div class="layui-input-inline">
                            <input name="address" lay-verify="required" readonly="" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">注册时间 </label>
                        <div class="layui-input-inline">
                            <input name="createTime" lay-verify="required" readonly="" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">余额 </label>
                        <div class="layui-input-inline">
                            <input name="money" lay-verify="required" readonly="" autocomplete="off" class="layui-input"
                                   type="text">
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layedit'], function () {
        var $ = layui.jquery
            , form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit;
        form.render();
    });
</script>
</body>
</html>