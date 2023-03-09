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
        <table class="table table-hover text-center" id="salary-table">
            <tr>
                <th>id</th>
                <th>护工id</th>
                <th>姓名</th>
                <th>薪资</th>
                <th>发薪日期</th>
                <th>更新时间</th>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/salary/getsalarybyuid",
                type: "POST",
                dataType: "JSON",
                success: function (json) {
                    let str;
                    if (json.status == 200) {
                            str = "<tr>" +
                                "<td>" + json.message.id + "</td>" +
                                "<td>" + json.message.workersid + "</td>" +
                                "<td>" + json.message.username + "</td>" +
                                "<td>" + json.message.salary + "</td>" +
                                "<td>" + formatDate(json.message.salary_time, '-') + "</td>" +
                                "<td>" + formatDate(json.message.create_time, '-') + "</td>" +
                                "</tr>";
                            $("#salary-table").append(str);
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
        return YY + MM + DD/* + " " + hh + mm + ss*/;
    }
</script>
</body></html>