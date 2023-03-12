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
        <table class="table table-hover text-center" id="workers-table">
            <tr>
                <th>id</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>地址</th>
                <th>电话</th>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/workers/getall",
                type: "POST",
                data: $("#form-login").serialize(),
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200)
                    {
                        for (let i=0;i<json.message.length;i++) {
                            str="<tr>"+
                                "<td>" + json.message[i].id + "</td>" +
                                "<td>" + json.message[i].username+"</td>" +
                                "<td>" + json.message[i].sex+"</td>" +
                                "<td>" + json.message[i].age+"</td>" +
                                "<td>" + json.message[i].addr+"</td>" +
                                "<td>" + json.message[i].tel+"</td>" +
/*                                "<td>" + json.message[i].height+"</td>" +
                                "<td>" + json.message[i].weight+"</td>" +
                                "<td>" + json.message[i].blood_type+"</td>" +
                                "<td>" + json.message[i].allergy+"</td>" +
                                "<td>" + json.message[i].heart_rate+"</td>" +
                                "<td>" + json.message[i].blood_pressure+"</td>" +
                                "<td>" + json.message[i].blood_sugar+"</td>" +
                                "<td>" + json.message[i].smoke+"</td>" +
                                "<td>" + formatDate(json.message[i].create_time,'-')+"</td>" +*/
                            //new Date(json.message[i].create_time).getUTCFullYear()+"年"+new Date(json.message[i].create_time).getUTCMonth()+"月"+new Date(json.message[i].create_time).getUTCDay()+"日"+new Date(json.message[i].create_time).getUTCDate()+"</td>" +
                                "<td>"+
                               "</tr>";
                            $("#workers-table").append(str);
                        }

                    }
                },
                error: function (xhr) {
                    window.parent.location.href="/user/exit";
                    alert("会话已结束，请重新登录！")
                }
            }
        );
    })
</script>
</body></html>