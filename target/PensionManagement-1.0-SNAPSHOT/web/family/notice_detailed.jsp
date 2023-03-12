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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>公告详情</strong></div>
    <div class="body-content">
        <form class="form-x" id="form-notice">
            <div class="form-group">
                <div class="label">
                    <label>公告id：</label>
                </div>
                <div class="field">
                    <input name="id" id="id" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>公告类型：</label>
                </div>
                <div class="field">
                    <input name="type" id="type" class="input w50" type="text" disabled="disabled">
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>公告内容：</label>
                </div>
                <div class="field">
                   <%-- <input name="data" id="data" class="input w50" type="text" style="width: 500px;height: 500px">--%>
                    <textarea name="data" id="data" class="input w50" type="text" style="width: 420px;height: 200px" disabled="disabled"></textarea>
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
                <button class="button bg-main icon-check-square-o" type="button" id="btn-detailed">确认</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
  $(document).ready(function () {

    $.ajax(
            {
              url: "/notice/getnotice",
              type: "POST",
              data: '',
              dataType: "JSON",
              success: function (json) {
                if(json.status==200)
                {

                  $("#id").val(json.message.id);
                  $("#type").val(json.message.type);
                  $("#data").val(json.message.data);
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
<script type="text/javascript">
  $("#btn-detailed").click(function () {
 {
     location.href='notice_table.jsp';
 }


  });
</script>
</body></html>
