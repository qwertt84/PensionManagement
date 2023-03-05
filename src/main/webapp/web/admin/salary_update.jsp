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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改请假</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-leave">
            <div class="form-group">
                <div class="label">
                    <label>id：</label>
                </div>
                <div class="field">
                    <input name="id" id="id" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>员工id：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="workersid" id="workersid" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input name="name" id="name" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>薪资：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="salary" id="salary" class="input w50" type="number"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>发薪日期：</label>
                </div>
                <div class="field">
                    <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <input name="salary_time" id="salary_time" class="input w50" type="date"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>更新时间：</label>
                </div>
                <div class="field">
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
  $(document).ready(function () {

    $.ajax(
            {
              url: "/salary/getsalary",
              type: "POST",
              data: '',
              dataType: "JSON",
              success: function (json) {
                if(json.status==200)
                {
                  $("#id").val(json.message.id);
                  $("#workersid").val(json.message.workersid);
                  $("#name").val(json.message.name);
                  $("#salary").val(json.message.salary);
                  $("#salary_time").val(dateVal(json.message.salary_time));
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
  function dateVal(date){
      var now = new Date(date);
      //格式化日，如果小于9，前面补0
      var day = ("0" + now.getDate()).slice(-2);
      //格式化月，如果小于9，前面补0
      var month = ("0" + (now.getMonth() + 1)).slice(-2);
      //拼装完整日期格式
      var day = now.getFullYear()+"-"+(month)+"-"+(day) ;
     return day;
  }
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
<script type="text/javascript">
  $("#btn-update").click(function () {
      let workersid=$("#workersid").val();
      let name=$("#name").val();
      let salary=$("#salary").val();
      let salary_time=$("#salary_time").val();
      if(workersid.length>0&&name.length>0&&salary.length>0&&salary_time.length>0) {
          $.ajax(
              {
                url: "/salary/update",
                type: "POST",
                data: {"workersid":workersid,"name":name,"salary":salary,"salary_time":salary_time},
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
</script>
</body></html>
