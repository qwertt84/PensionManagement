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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改费用信息</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-notice">
            <div class="form-group">
                <div class="label">
                    <label>id：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="id" id="id" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>老人id：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="olderid" id="olderid" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>老人姓名：</label>
                </div>
                <div class="field">
                   <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="name" id="name" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>费用：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="cost" id="cost" class="input w50" type="number">
                    <label  class="input w50" style="width: 7%">元</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>更新时间：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="create_time" id="create_time" class="input w50" type="text" disabled="disabled">
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
    $("#btn-update").click(function () {
        let id=$("#id").val();
        let olderid=$("#olderid").val();
        let name=$("#name").val();
        let cost=$("#cost").val();
        if(id.length>0&&olderid.length>0&&name.length>0&&cost.length>0) {
            $.ajax(
                {
                    url: "/cost/update",
                    type: "POST",
                    data: {"id":id,"olderid":olderid,"name":name,"cost":cost},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            location.href='cost_table.jsp';
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
<script type="text/javascript">
    $(document).ready(function () {

        $.ajax(
            {
                url: "/cost/getcost",
                type: "POST",
                data: '',
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200)
                    {

                        $("#id").val(json.message.id);
                        $("#olderid").val(json.message.olderid);
                        $("#name").val(json.message.name);
                        $("#cost").val(json.message.cost);
                        $("#create_time").val(formatDate(json.message.create_time,'-'));
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
    function formatDate(date,cut) {
        var date = new Date(date);
        var YY = date.getFullYear() + cut;
        var MM =
            (date.getMonth() + 1 < 10
                ? "0" + (date.getMonth() + 1)
                : date.getMonth() + 1) + cut;
        var DD = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        /*      var hh =
                  (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":";
              var mm =
                  (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) +
                  ":";
              var ss = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();*/
        return YY + MM + DD /*+ " " + hh + mm + ss*/;
    }
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
</body></html>
