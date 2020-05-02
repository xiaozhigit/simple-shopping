<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>广告列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
  <%--  <script src="${pageContext.request.contextPath}/static/js/tool.js"></script>--%>
</head>
<body>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>

    layui.use(['laydate', 'laypage', 'layer', 'table', 'element', 'slider'], function(){
        var $ = layui.jquery
            ,laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块
            ,tableObj = table.render({});
        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 420
            ,url: '${pageContext.request.contextPath}/ad/getAdsData' //数据接口
            ,limit:5
           ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                ,limits:[5,10,15,20,25,30]
                ,first: false //不显示首页
                ,last: false //不显示尾页
            }
            ,title: '广告列表'
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
                ,{field: 'title', title: '主题', width:80}
                ,{field: 'content', title: '内容', width:80}
                ,{field: 'img', title: '图片', width:100, templet: '<div><img src="{{d.img}}" class="layui-icon"></div>'}
                ,{field: 'url', title: '链接', width: 150}
                ,{fixed: 'right',title: '操作', width: 165, align:'center', toolbar: '#barDemo'}
            ]]

        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event //获得 lay-event 对应的值
                ,editList=[];
            $.each(data,function(name,value) {
                editList.push(value);
            });
           if(layEvent === 'del'){
                layer.confirm('真的删除此行么', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/ad/delete",
                        dataType:'json',
                        // async: false,
                        data: "id="+data.id,
                        dataType: "json",
                        success: function (data) {
                            debugger
                            var message = data.msg;
                            if(data.msg === '1'){
                                obj.del();
                                layer.close(index);
                                layer.alert("删除成功",{icon: 1,time:2000});
                                tableObj.reload({
                                    url:'${pageContext.request.contextPath}/ad/getAdsData'
                                });
                            } else {
                                layer.alert("删除失败", {
                                    icon: 2,title:'提示'
                                });
                                return;
                            }
                        },
                        error: function (e) {
                            console.log(e)
                        }

                    });
                });
            } else if(layEvent === 'edit'){
                //脚本编辑弹出层
                var name = encodeURIComponent(data.toolName);
                // console.log(data.toolName);
                layer.open({
                    type: 2,
                    title: '编辑信息',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['70%', '70%'],
                    content: '${pageContext.request.contextPath}/ad/page/adEdit',
                    success: function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        var inputList = body.find("input");
                        for (var i = 0; i < inputList.length; i++ ) {
                            $(inputList[i]).val(editList[i]);
                        }
                    }
                });

            }
        });
        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data //获取选中的数据
                ,editList=[];
            for(var i=0;i<data.length;i++){
                $.each(data[i],function(name,value) {
                    editList.push(value);
                }); }

            console.info(checkStatus);
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    //脚本编辑弹出层
                    var name = encodeURIComponent(data.toolName);
                    // console.log(data.toolName);
                    layer.open({
                        type: 2,
                        title: '添加广告信息',
                        // title:data.to,
                        shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['70%', '70%'],
                        content:"${pageContext.request.contextPath}/ad/page/addAd",
                        success: function(layero, index){
                            var body = layer.getChildFrame('body', index);
                            var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();

                        }

                    });
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        //脚本编辑弹出层
                        var name = encodeURIComponent(data.toolName);
                         console.log(data);
                        console.log(data[0].id);
                        layer.open({
                            type: 2,
                            title: '修改信息',
                            shadeClose: true,
                            shade: 0.8,
                            maxmin: true,
                            area: ['70%', '70%'],
                            content: '${pageContext.request.contextPath}/ad/edit?id='+data[0].id,
                            success: function(layero, index){
                                debugger;
                                var body = layer.getChildFrame('body', index);
                                var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                                var inputList = body.find("input");

                                for (var i = 0; i < inputList.length; i++ ) {
                                    $(inputList[i]).val(editList[i]);
                                }
                            }
                        });
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除行么', function(index){

                            //向服务端发送删除指令
                            $.ajax({
                                type: "post",
                                url: "${pageContext.request.contextPath}/ad/delete",
                                dataType:'json',
                                // async: false,
                                data: "id="+editList[0],
                                dataType: "json",
                                success: function (data) {
                                    debugger
                                    var message = data.msg;
                                    if(data.msg === '1'){
                                        //obj.del();
                                        layer.close(index);
                                        layer.alert("删除成功",{icon: 1,time:2000});
                                        tableObj.reload({
                                            url:'${pageContext.request.contextPath}/ad/getAdsData'
                                        });
                                    } else {
                                        layer.alert("删除失败", {
                                            icon: 2,title:'提示'
                                        });
                                        return;
                                    }
                                },
                                error: function () {
                                }

                            });
                        });
                    }
                    break;
            };
        });
    });
</script>
</body>
</html>
