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
<%--    <div class="panel admin-panel">--%>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <a href="older_add.jsp" class="button border-green">新增</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center" id="older-table">
            <tr>
                <th>id</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>地址</th>
                <th>电话</th>
                <th>家属id</th>
                <th>家属姓名</th>
<%--                <th>身高</th>
                <th>体重</th>
                <th>血型</th>
                <th>过敏</th>
                <th>心率</th>
                <th>血压</th>
                <th>血糖</th>
                <th>吸烟</th>
                <th>更新时间</th>--%>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax(
            {
                url: "/older/getall",
                type: "POST",
                data: $("#form-login").serialize(),
                dataType: "JSON",
                success: function (json) {
                    if(json.status==200)
                    {
                        for (let i=0;i<json.message.length;i++) {
                            str="<tr>"+
                                "<td>" + json.message[i].id + "</td>" +
                                "<td>" + json.message[i].name+"</td>" +
                                "<td>" + json.message[i].sex+"</td>" +
                                "<td>" + json.message[i].age+"</td>" +
                                "<td>" + json.message[i].addr+"</td>" +
                                "<td>" + json.message[i].tel+"</td>" +
                                "<td>" + json.message[i].familyid+"</td>" +
                                "<td>" + json.message[i].familyname+"</td>" +
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
                                '<div class="button-group"> ' +
                                '<a class="button border-green"+ ' + 'onclick="return update(this)"><span></span> 修改</a>' +
                                '<a class="button border-red" href="#" onclick="return del(this)"><span></span> 删除</a>' +
                                ' </div>'
                               +"</td>"+
                               "</tr>";
                            $("#older-table").append(str);
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
                url: "/older/upnid",
                type: "POST",
                data: {
                    "id":array[0]
                },
                dataType: "JSON",
                success: function (json) {
                    location.href='older_update.jsp';
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
                    url: "/older/del",
                    type: "POST",
                    data: {"id":array[0]},
                    dataType: "JSON",
                    success: function (json) {
                        location.href='older_table.jsp';
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