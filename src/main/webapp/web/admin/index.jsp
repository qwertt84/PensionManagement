<%@ taglib prefix="background-color" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, admin-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>主界面</title>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/web.css">
    <script src="../../js/jquery.js"></script>
</head>
<body style="background: url(../../images/img.jpg) no-repeat;background-size: 100%;">
<div class="header bg-main" >
    <div class="logo margin-big-left fadein-top">
        <h1 id="username" style="color: #000000"></h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="" target="_parent"><span class="icon-home"></span> 首页</a> &nbsp;&nbsp;
        <a class="button button-little bg-red" href="/user/exit"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title" ><strong ><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-admin"></span>基本设置</h2>
    <ul style="display:block;">
        <li><a href="notice_table.jsp" target="right"><span class="icon-caret-right"></span>系统公告管理</a></li>
        <li><a href="older_table.jsp" target="right"><span class="icon-caret-right"></span>老人信息管理</a></li>
        <li><a href="older_status_table.jsp" target="right"><span class="icon-caret-right"></span>老人状态信息管理</a></li>
        <li><a href="malfunction_table.jsp" target="right"><span class="icon-caret-right"></span>事故记录管理</a></li>
        <li><a href="berth_table.jsp" target="right"><span class="icon-caret-right"></span>床位分配管理</a></li>
        <li><a href="cost_table.jsp" target="right"><span class="icon-caret-right"></span>入住费用管理</a></li>
        <li><a href="complain_table.jsp" target="right"><span class="icon-caret-right"></span>投诉管理</a></li>
        <li><a href="workers_table.jsp" target="right"><span class="icon-caret-right"></span>护工信息管理</a></li>
        <li><a href="leave_table.jsp" target="right"><span class="icon-caret-right"></span>护工请假信息管理</a></li>
        <li><a href="salary_table.jsp" target="right"><span class="icon-caret-right"></span>护工薪资管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>用户设置</h2>
    <ul>
        <li><a href="passwd.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/user/getusername",
                type: "POST",
                data: $("#form-login").serialize(),
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200)
                    {
                        $('#username').text(json.message);
                    }
                },
                error: function (xhr) {
                    window.parent.location.href="/user/exit";
                    alert("会话已结束，请重新登录！");
                }
            }
        );
    })
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>

<div class="admin">
    <iframe scrolling="auto" <%--rameborder="0"--%> src="notice_table.jsp" name="right" width="100%" height="100%" ></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>