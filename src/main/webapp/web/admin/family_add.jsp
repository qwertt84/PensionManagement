<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta username="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, admin-scalable=no" />
    <meta username="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/web.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/pintuer.js"></script>
</head>
<body style="background: none";>
<div class="<%--panel admin-panel--%>">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加家属信息</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-notice">
            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <%-- <input username="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="userid" id="userid" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>密码：</label>
                </div>
                <div class="field">
                    <%-- <input username="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="password" id="password" class="input w50" type="password">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>家属姓名：</label>
                </div>
                <div class="field">
                   <%-- <input username="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="username" id="username" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field">
                    <input type="radio" checked="checked" value="男" username="sex" >男
                    <input type="radio"  value="女" username="sex">女
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>年龄：</label>
                </div>
                <div class="field">
                    <%-- <input username="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="age" id="age" class="input w50" type="number">
                    <label  class="input w50" style="width: 7%">岁</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <%-- <input username="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="addr" id="addr" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>电话：</label>
                </div>
                <div class="field">
                    <%-- <input username="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="tel" id="tel" class="input w50" type="tel">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group" >
                <button class="button bg-main icon-check-square-o" type="button" id="btn-add">添加</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $("#btn-add").click(function () {
        let userid=$("#userid").val();
        let password=$("#password").val();
        let username=$("#username").val();
        let sex=$("input[username='sex']:checked").val();
        let age=$("#age").val();
        let addr=$("#addr").val();
        let tel=$("#tel").val();
        if(userid.length>0&&password.length>0&&username.length>0&&sex.length>0&&age>0&&addr.length>0&&tel.length>5) {
            $.ajax(
                {
                    url: "/family/add",
                    type: "POST",
                    data: {"userid":userid,"password":password,"username":username,"sex":sex,"age":age,"addr":addr,"tel":tel},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            location.href='family_table.jsp';
                            alert("添加成功！");
                        }
                        else if(json.status==220)
                        {
                            alert("添加失败！");

                        }
                        else if(json.status==401)
                        {
                            alert("数据库错误！");

                        }
                    },
                    error: function (xhr) {
                        window.parent.location.href="/user/exit";
                        alert("会话已结束，请重新登录！");
                    }
                }
            );
        }else {
            alert("请将数据填写完整！");
        }

    });
</script>
</body></html>
