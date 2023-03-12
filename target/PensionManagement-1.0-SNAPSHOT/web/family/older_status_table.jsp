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
<form method="post" action="">
 <%--   <div class="panel admin-panel">--%>
        <table class="table table-hover text-center" id="older-status-table">
            <tr>
                <th>id</th>
                <th>老人id</th>
                <th>姓名</th>
                <th>身高(cm)</th>
                <th>体重(kg)</th>
                <th>血型</th>
                <th>过敏</th>
                <th>心率(次/分)</th>
                <th>血压(mmHg)</th>
                <th>血糖(mmol/L)</th>
                <th>吸烟</th>
                <th>更新时间</th>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/olderstatus/getolderstatusbyuid",
                type: "POST",
                data: '',
                dataType: "JSON",
                success: function (json) {
                    var str;
                    if (json.status == 200) {
                        for (let i = 0; i < json.message.length; i++) {
                            str = "<tr>" +
                                "<td>" + json.message[i].id + "</td>" +
                                "<td>" + json.message[i].olderid + "</td>" +
                                "<td>" + json.message[i].name + "</td>" +
                                "<td>" + json.message[i].height + "</td>" +
                                "<td>" + json.message[i].weight + "</td>" +
                                "<td>" + json.message[i].blood_type + "</td>" +
                                "<td>" + json.message[i].allergy + "</td>" +
                                "<td>" + json.message[i].heart_rate + "</td>" +
                                "<td>" + json.message[i].blood_pressure + "</td>" +
                                "<td>" + json.message[i].blood_sugar + "</td>" +
                                "<td>" + json.message[i].smoke + "</td>" +
                                "<td>" + formatDate(json.message[i].create_time, '-') + "</td>"+
                                "<td>" +
                                "</tr>";
                            $("#older-status-table").append(str);
                        }

                    }
                },
                error: function (xhr) {
                    window.parent.location.href = "/user/exit";
                    alert("会话已结束，请重新登录！")
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
        return YY + MM + DD;
    }
</script>
</body>
</html>