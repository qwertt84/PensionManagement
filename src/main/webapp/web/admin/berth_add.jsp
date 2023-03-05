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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加床位信息</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-notice">
            <div class="form-group">
                <div class="label">
                    <label>老人id：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="olderid" id="olderid" class="input w50" type="text">
                    <button class="button bg-main icon-check-square-o" type="button" id="btn-select">查询</button>
                    <div class="tips"></div>
                </div>
                <%--                <div class="field">
                                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;

                                    <div class="tips"></div>
                                </div>--%>

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
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
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
                <%--           <div class="field">
                               &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                               <input name="blood_type" id="blood_type" class="input w50" type="text">

                               <div class="tips"></div>
                           </div>--%>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>床位号：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="berth" id="berth" class="input w50" type="text">
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
    $("#btn-select").click(function () {
        let olderid=$("#olderid").val();
        if(olderid>0)
        {
            $.ajax(
                {
                    url: "/older/getolderid",
                    type: "POST",
                    data: {"id":olderid},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            if(json.message==null)
                            {
                                alert("查无此老人！");
                                $("#name").val("");
                            }
                            else {
                                $("#name").val(json.message.name);
                            }

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
    $("#btn-add").click(function () {
        let olderid=$("#olderid").val();
        let name=$("#name").val();
        let ridgepole=$("#ridgepole").val();
        let floor=$("#floor").val();
        let building=$("#building").val();
        let berth=$("#berth").val();
        if(olderid.length>0&&name.length>0&&ridgepole.length>0&&floor.length>0&&building.length>0&&berth.length>0) {
            $.ajax(
                {
                    url: "/berth/add",
                    type: "POST",
                    data: {"olderid":olderid,"name":name,"ridgepole":ridgepole,"floor":floor,"building":building,"berth":berth},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            location.href='berth_table.jsp';
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
