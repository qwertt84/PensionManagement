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
    <div <%--class="panel admin-panel"--%>>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <a href="cost_add.jsp" class="button border-green">新增</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center" id="cost-table">
            <tr>
                <th>id</th>
                <th>老人id</th>
                <th>姓名</th>
                <th>费用（元）</th>
                <th>更新时间</th>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/cost/getall",
                type: "POST",
                dataType: "JSON",
                success: function (json) {
                    let str;
                    if (json.status == 200) {
                        for (let i = 0; i < json.message.length; i++) {
                            str = "<tr>" +
                                "<td>" + json.message[i].id + "</td>" +
                                "<td>" + json.message[i].olderid + "</td>" +
                                "<td>" + json.message[i].name + "</td>" +
                                "<td>" + json.message[i].cost + "</td>" +
                                "<td>" + formatDate(json.message[i].create_time, '-') + "</td>" +
                                "<td>" +
                                '<div class="button-group"> ' +
                                '<a class="button border-green"+ ' + 'onclick="return update(this)"><span></span> 修改</a>' +
                                '<a class="button border-red" href="#" onclick="return del(this)"><span></span> 删除</a>' +
                                ' </div>'
                                + "</td>" +
                                "</tr>";
                            $("#cost-table").append(str);
                        }

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
<script type="text/javascript">
    function update(id) {
        let array=new Array();
        $(id).parents("tr").each(function(i){                   // 遍历 tr
            $(this).children('td').each(function(j){  // 遍历 tr 的各个 td
                array.push($(this).text());
            });
        });
        array.pop();
        $.ajax(
            {
                url: "/cost/upnid",
                type: "POST",
                data: {
                    "id":array[0]
                },
                dataType: "JSON",
                success: function (json) {
                    location.href='cost_update.jsp';
                },
                error: function (xhr) {
                    window.parent.location.href="/user/exit";
                    alert("会话已结束，请重新登录！");
                }
            }
        );

    }
    function del(id){
        if(confirm("您确定要删除吗?")){
            let array=new Array();
            $(id).parents("tr").each(function(i){                   // 遍历 tr
                $(this).children('td').each(function(j){  // 遍历 tr 的各个 td
                    array.push($(this).text());
                });
            });
            array.pop();

            $.ajax(
                {
                    url: "/cost/del",
                    type: "POST",
                    data: {"id":array[0]},
                    dataType: "JSON",
                    success: function (json) {
                        location.href='cost_table.jsp';
                    },
                    error: function (xhr) {
                        window.parent.location.href="/user/exit";
                        alert("会话已结束，请重新登录！");
                    }
                }
            );
            return false;
        }else {
            return false;
        }
    }


</script>
</body></html>