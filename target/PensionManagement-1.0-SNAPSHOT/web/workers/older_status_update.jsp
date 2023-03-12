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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改老人状态</strong></div>
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
            <%--                <th>身高</th>
                <th>体重</th>
                <th>血型</th>
                <th>过敏</th>
                <th>心率</th>
                <th>血压</th>
                <th>血糖</th>
                <th>吸烟</th>
                <th>更新时间</th>--%>
            <div class="form-group">
                <div class="label">
                    <label>身高：</label>
                </div>
                <div class="field">
                    <input name="height" id="height" class="input w50" type="number">
                    <label  class="input w50" style="width: 7%">cm</label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>体重：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="weight" id="weight" class="input w50" type="number">
                        <label  class="input w50" style="width: 7%">kg</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>血型：</label>
                </div>
                <div class="field">
                    <input type="radio" value="O型" name="blood_type" >O型
                    <input type="radio" value="A型" name="blood_type" >A型
                    <input type="radio" value="B型" name="blood_type" >B型
                    <input type="radio" value="AB型" name="blood_type" >AB型
                    <input type="radio" value="其他型" name="blood_type" >其他型
                </div>
     <%--           <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="blood_type" id="blood_type" class="input w50" type="text">

                    <div class="tips"></div>
                </div>--%>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>过敏：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="allergy" id="allergy" class="input w50" type="text">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>心率：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="heart_rate" id="heart_rate" class="input w50" type="number">
                    <label  class="input w50" style="width: 17%">(60～100)次/分</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>血压：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="blood_pressure" id="blood_pressure" class="input w50" type="number">
                        <label  class="input w50" style="width: 17%">(90～139)mmHg</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>血糖：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="blood_sugar" id="blood_sugar" class="input w50" type="number">
                        <label  class="input w50" style="width: 17%">(3.92～7.0)mmol/L</label>

                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>吸烟：</label>
                </div>
                <div class="field">
                    <input type="radio" value="吸烟" name="smoke" >吸烟
                    <input type="radio" value="不吸烟" name="smoke" >不吸烟
                    <div class="tips"></div>
                </div>
  <%--              <div class="field">
                    &lt;%&ndash; <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">&ndash;%&gt;
                    <input name="smoke" id="smoke" class="input w50" type="text">

                    <div class="tips"></div>

                </div>--%>
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
        let height=$("#height").val();
        let weight=$("#weight").val();
     /*   let blood_type=$("#blood_type").val();*/
        let blood_type=$("input[name='blood_type']:checked").val();
        let allergy=$("#allergy").val();
        let heart_rate=$("#heart_rate").val();
        let blood_pressure=$("#blood_pressure").val();
        let blood_sugar=$("#blood_sugar").val();
   /*     let smoke=$("#smoke").val();*/
        let smoke=$("input[name='smoke']:checked").val();
        if(id.length>0&&name.length>0&&height.length>0&&weight.length>0&&blood_type.length>0&&allergy.length>0&&heart_rate.length>0&&blood_pressure.length>0&&blood_sugar.length>0&&smoke.length>0) {
            $.ajax(
                {
                    url: "/olderstatus/update",
                    type: "POST",
                    data: {"id":id,"olderid":olderid,"name":name,"height":height,"weight":weight,"blood_type":blood_type,"allergy":allergy,"heart_rate":heart_rate,"blood_pressure":blood_pressure,"blood_sugar":blood_sugar,"smoke":smoke},
                    dataType: "JSON",
                    success: function (json) {
                        if(json.status==200)
                        {
                            location.href='older_status_table.jsp';
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
                url: "/olderstatus/getolderstatus",
                type: "POST",
                data: '',
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200)
                    {

                        $("#id").val(json.message.id);
                        $("#olderid").val(json.message.olderid);
                        $("#name").val(json.message.name);
                        $("#height").val(json.message.height);
                        $("#weight").val(json.message.weight);
                     //   $("#blood_type").val(json.message.blood_type);
                        $("input[value=" + json.message.blood_type +
                            "]").attr('checked', 'true');
                   //     $("input[name='blood_type']:checked").val(json.message.blood_type);
                        $("#allergy").val(json.message.allergy);
                        $("#heart_rate").val(json.message.heart_rate);
                        $("#blood_pressure").val(json.message.blood_pressure);
                        $("#blood_sugar").val(json.message.blood_sugar);
                      /*  $("#smoke").val(json.message.smoke);*/
                        $("input[value=" + json.message.smoke +
                            "]").attr('checked', 'true');
                        $("#blood_pressure").val(json.message.blood_pressure);
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
