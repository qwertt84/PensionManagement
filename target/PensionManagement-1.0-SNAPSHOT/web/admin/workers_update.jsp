<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, admin-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/web.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/pintuer.js"></script>
</head>
<body style="background: none";>
<div class="<%--panel admin-panel--%>">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加护工信息</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-notice">
            <div class="form-group">
                <div class="label">
                    <label>护工id：</label>
                </div>
                <div class="field">
                    <input name="id" id="id" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <input name="userid" id="userid" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>密码：</label>
                </div>
                <div class="field">
                    <input name="password" id="password" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>护工姓名：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="username" id="username" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field">
                    <input type="radio" checked="checked" value="男" name="sex" >男
                    <input type="radio"  value="女" name="sex">女
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>年龄：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
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
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="addr" id="addr" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>电话：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="tel" id="tel" class="input w50" type="tel">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group" >
                <button class="button bg-main icon-check-square-o" type="button" id="btn-update">修改</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/workers/getworkers",
                type: "POST",
                data: '',
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200) {
                        $("#id").val(json.message.id);
                        $("#userid").val(json.message.userid);
                        $("#password").val(json.message.password);
                        $("#username").val(json.message.username);
                        $("input[value=" + json.message.sex +
                            "]").attr('checked', 'true');
                        $("#age").val(json.message.age);
                        $("#addr").val(json.message.addr);
                        $("#tel").val(json.message.tel);
                    }
                    else if(json.status==220)
                    {
                        alert("获取失败！");

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
    })
</script>
<%--<script type="text/javascript">
    $("#btn-update").click(function () {
        let type=$("#type").val();
        let data=$("#data").val();
        if(type.length>0&&data.length>0) {
            $.ajax(
                {
                    url: "/notice/update",
                    type: "POST",
                    data: {"type":type,"data":data},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            location.href='salary_table.jsp';
                            alert("修改成功！");
                        }
                        else if(json.status==220)
                        {
                            alert("修改失败！");

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
</script>--%>
<script>
    $("#btn-update").click(function () {
        let id=$("#id").val();
        let userid=$("#userid").val();
        let password=$("#password").val();
        let username=$("#username").val();
        let sex=$("input[name='sex']:checked").val();
        let age=$("#age").val();
        let addr=$("#addr").val();
        let tel=$("#tel").val();
        if(id.length>0&&username.length>0&&password.length>0&&userid.length>0&&sex.length>0&&age>0&&addr.length>0&&tel.length>5) {
            $.ajax(
                {
                    url: "/workers/update",
                    type: "POST",
                    data: {"id":id,"userid":userid,"password":password,"username":username,"sex":sex,"age":age,"addr":addr,"tel":tel},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            location.href='workers_table.jsp';
                            alert("修改成功！");
                        }
                        else if(json.status==220)
                        {
                            alert("修改失败！");

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
</body>
</html>
