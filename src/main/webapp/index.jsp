<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/global/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/icon.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/global/js.js"></script>
    <script type="text/javascript">
        /* 顶层窗口 如果 与当前窗口不一致，将顶层窗口重新加载  配合过滤器完成页面跳转*/
        if (top != self) {
            parent.location.reload();
        }


        // 通过easyUI的form控件和ajax进行登录
        function form_submit() {
            //alert(0);
            // 通过form控件，以ajax的方式提交表单
            $("#login").form("submit", {
                // 当submit的返回值为false时，阻止表单提交
                url: "/ddm/admin/login",
                // 通过validate方法，获取所有验证框的验证结果，但所有验证头通过时，返回true，否则返回false，
                /*onSubmit:function(){
                    var isOk = $(this).form("validate");
                    alert(isOk);
                    return isOk;
                },*/
                // 回调函数，后台响应结果data是json串
                success:function(data){

                    console.log(data);
                    data = JSON.parse(data);
                    //alert(data);
                    //alert(data.isLogin);
                    if(data.isLogin){
                        location = "${pageContext.request.contextPath}/main/main.jsp";
                    }else{
                        $.messager.show({
                            title:'提示信息',
                            msg:'登录失败',
                            timeout: 3000,
                            showType:'slide'
                        });

                    }
                }
            });
        }
        // 通过easyUI的form控件和ajax提交表单，进行登录======END
        $(function () {
            var login = $("#login123").val();
            //alert(login);
            if (login == 1) {
                $.messager.show({
                    title: '提示信息',
                    msg: '登录失败!',
                    timeout: 3000,
                    showType: 'slide'
                });
            }
        });
    </script>
</head>
<body>
<div><input type="hidden" value="${param.login}" id="login123"/></div>
<div id="top"></div>

<%--<form id="login" name="login" method="post" action="${pageContext.request.contextPath}/admin/login">--%>
<form id="login" name="login" method="post">
    <div id="center">
        <div id="center_left"></div>
        <div id="center_middle">
            <div class="user">
                <label>用户名：
                    <input type="text" name="email" id="user" value="xiaohei@qq.com"/>
                </label>
            </div>
            <div class="user">
                <label>密　码：
                    <input type="text" name="password" id="pwd" value="123456"/>
                </label>
            </div>
            <div class="chknumber">
                <label>验证码：
                    <input name="kaptcha" type="text" id="chknumber" maxlength="4" class="chknumber_input"/>
                </label><img width="50" height="30" src="${pageContext.request.contextPath}/getKaptcha" id="imgVcode"
                             onclick="document.getElementById('imgVcode').src='${pageContext.request.contextPath}/getKaptcha?time='+(new Date()).getTime();"/>
            </div>
        </div>
        <div id="center_middle_right"></div>
        <div id="center_submit">
            <div class="button"><img src="admin/imgs/global/dl.gif" width="57" height="20" onclick="form_submit()">
            </div>
            <div class="button"><img src="admin/imgs/global/cz.gif" width="57" height="20" onclick="form_reset()"></div>
        </div>
        <div id="center_right"></div>
    </div>
</form>

<div id="footer"></div>
<script type="text/javascript">

</script>
</body>
</html>
