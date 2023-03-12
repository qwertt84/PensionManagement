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
<%--<div class="&lt;%&ndash;panel admin-panel&ndash;%&gt;">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改床位信息</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-notice">
            <div class="form-group">
                <div class="label">
                    <label>id：</label>
                </div>
                <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="id" id="id" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>老人id：</label>
                </div>
                <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="olderid" id="olderid" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>老人姓名：</label>
                </div>
                <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="name" id="name" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>栋：</label>
                </div>
                <div class="field">
                    <input name="ridgepole" id="ridgepole" class="input w50" type="text">
                    <label  class="input w50" style="width: 7%">栋</label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>楼：</label>
                </div>
                <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="floor" id="floor" class="input w50" type="number">
                    <label  class="input w50" style="width: 7%">楼</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>号：</label>
                </div>
                <div class="field">
                    <input name="building" id="building" class="input w50" type="number">
                    <label  class="input w50" style="width: 7%">号</label>
                </div>
                &lt;%&ndash;           <div class="field">
                               &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                               <input name="blood_type" id="blood_type" class="input w50" type="text">

                               <div class="tips"></div>
                           </div>&ndash;%&gt;
            </div>
            <div class="form-group">
                <div class="label">
                    <label>床位号：</label>
                </div>
                <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="berth" id="berth" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>更新时间：</label>
                </div>
                <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="create_time" id="create_time" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group" >
                <button class="button bg-main icon-check-square-o" type="button" id="btn-update">修改</button>
            </div>
        </form>
    </div>
</div>--%>
<div <%--class="panel admin-panel"--%>>
    <div class="body-content">
        <form method="post" class="form-x" action="#">
            <div class="form-group">
                <div class="label">
                    <label>帐号：</label>
                </div>
                <div class="field">
                    <select name="userid" id="userid" class="input w50" disabled="disabled">
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>原始密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="mpass" name="mpass" size="50"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="newpass" id="newpass" size="50"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="renewpass" id="renewpass" size="50"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="button" id="btm"> 修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        $.ajax(
            {
                url: "/user/getuserid",
                type: "POST",
                data: '',
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200)
                    {
                        $('#userid').append("<option value=" +json.message+
                            ">" +json.message+
                            "</option>");
                    }
                },
                error: function (xhr) {
                    alert("产生未知错误" + xhr.status);
                }
            }
        );
    })
    $("#btm").click(function () {
        let mpass=$("#mpass").val();
        let newpass=$("#newpass").val();
        let renewpass=$("#renewpass").val();
        if(mpass.length>0&&newpass.length>0&&renewpass.length>0&&newpass==renewpass)
        {
            $.ajax(
                {
                    url: "/user/update",
                    type: "POST",
                    data: {"mpass":mpass,"newpass":newpass,"renewpass":renewpass},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            alert("修改成功")
                            $.ajax(
                                {
                                    url: "/user/exit",
                                    type: "POST",
                                    data: '',
                                    dataType: "JSON",
                                    success: function () {
                                    }, error: function (xhr) {
                                        parent.location.href="../../login.jsp"
                                    }

                                });

                        }else if(json.status===222)
                        {
                            alert('原密码错误');
                        }
                        else if(json.status==220)
                        {
                            alert("修改失败！");

                        }
                        else if(json.status==401)
                        {
                            alert("数据库发生错误！");

                        }
                    },
                    error: function (xhr) {
                        alert("产生未知错误" + xhr.status);
                    }
                }
            );
        }else
        {
          alert("请将信息填写完整！");
         }

    });
</script>
</body></html>
