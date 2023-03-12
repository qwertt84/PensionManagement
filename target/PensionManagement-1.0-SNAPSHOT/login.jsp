<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, admin-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>养老院信息管理系统</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/web.css">
    <script src="js/jquery.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:60px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>

            <form id="form-login">
                <div class="panel loginbox" style=" background: rgba(255,255,255,0.65)">
                    <div class="text-center margin-big padding-big-top"><h1>养老院信息管理系统</h1></div>
                    <div class="panel-body" style="padding: 20px 50px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="userid" id="userid" placeholder="登录账号"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="password" id="password" placeholder="登录密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field" align="center">
                                <input type="radio" checked="checked" value="1" name="userType">家属
                                <input type="radio"  value="2" name="userType">职工
                                <input type="radio"  value="3" name="userType">管理员
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field" align="center">
                                <input type="text" style="width: 120px; height: 32px" name="checkCode" id="checkCode_Text" placeholder="验证码"/>
                                <img id="checkCode" onclick="this.src='/user/checkCode?d='+Math.random()" src="/user/checkCode">
                            </div>
                        </div>
                        <div><input id="btn-login" type="button" class="button button-block bg-main text-big input-big" value="登录"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#btn-login").click(function () {
        let userid=$("#userid").val();
        let password=$("#password").val();
        let checkCode_Text=$("#checkCode_Text").val();
        if(userid.length>0&&password.length>0&&checkCode_Text.length>0) {
            $.ajax(
                {
                    url: "/user/login",
                    type: "POST",
                    data: $("#form-login").serialize(),
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            var userType = $("input[name='userType']:checked").val();
                            switch (userType)
                            {
                                case "1":
                                    location.href="web/family/index.jsp";
                                    break;
                                case "2":
                                    location.href="web/workers/index.jsp";
                                    break;
                                case "3":
                                    location.href="web/admin/index.jsp";
                                    break;
                            }
                        }
                        else {
                            alert(json.message);
                            $("#checkCode").attr('src','/user/checkCode?d='+Math.random());
                        }

                    },
                    error: function (xhr) {
                        alert("登录时产生未知错误" + xhr.status);
                    }
                }
            );
        }
        else
        {
            alert("请将信息填完整！");
        }

    });
</script>
</body>
</html>