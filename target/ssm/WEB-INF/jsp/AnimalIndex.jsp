<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工管理</title>
</head>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
    var pageIndex=1;
    //获取所有的用户
    function initUsers() {
      $.ajax({
        "url":"${pageContext.request.contextPath}/sys/user/pagelists",
        "type":"GET",
        "data": {pageIndex:pageIndex},
        "dataType":"json",
        "success":function (data) {
          pageIndex=data.pageIndex;
          $("#mytbody").html("");//清空内容
          if(data.counts!=0){
            $(data.lists).each(function () {
              $("#mytbody").append("<tr align=\"center\">" +
                      "<td>"+this.a_id+"</td>" +
                      "<td>"+this.a_name+"</td>" +
                      "<td class='sex'></td>" +
                      "<td>"+this.k_name+"</td>" +
                      "<td>"+this.a_age+"</td>" +
                      "<td>"+this.a_health+"</td>" +
                      "<td>"+this.a_date+"</td>" +
                      "<td>" +
                      "<a href='javascript:void(0);' class='del' value='"+this.a_id+"'>删除</a>" +
                      "<a href='${pageContext.request.contextPath}/sys/user/upd/"+this.a_id+"'>修改</a>" +
                      "</td>" +
                      "</tr>");
                      if (this.a_sex==1){
                        this.$(".sex").text("雄")
                      }else {
                        this.$(".sex").text("雌")
                      }
            });
            $("#mytbody").append("<tr align='center'>" +
                    "      <td colspan='8'>" +
                    "        【"+data.pageIndex+"/"+data.pageCount+"】" +
                    "      </td>" +
                    "    </tr>" +
                    "    <tr align='center'>" +
                    "      <td colspan='7'>" +
                    "          <a href='javascript:void(0);' id='first'>首页</a>" +
                    "          <a href='javascript:void(0);' id='up'>上一页</a>" +
                    "          <a href='javascript:void(0);' id='down'>下一页</a>" +
                    "          <a href='javascript:void(0);' id='end'>尾页</a>" +
                    "      </td>" +
                    "    </tr>");
            //点击事件
            $("#first").click(function () {
              pageIndex=1;
              initUsers();
            });
            $("#up").click(function () {
              pageIndex--;
              initUsers();
            });
            $("#down").click(function () {
              pageIndex++;
              initUsers();
            });
            $("#end").click(function () {
              pageIndex=data.pageCount;
              initUsers();
            });

            //删除
            $(".del").click(function () {
              delUser($(this).attr("value"));
              delUser();
            })

          }else{
            $("#mytbody").html("<tr><td colspan='7' align='center'><h3>暂无数据</h3></td></tr>");
          }
        }
      });
    }
    initUsers();
    //异步请求删除的方法
    function delUser(a_id) {
      $.ajax({
        "url":"${pageContext.request.contextPath}/sys/user/del",
        "type":"GET",
        "data": {a_id:a_id},
        "dataType":"json",
        "success":function (data) {
          if(data=='del'){
            alert("删除成功")
          }else {
            alert("删除失败")
          }
            initUsers();
        }

      });
    }


  });
</script>
<body>
<table width="100%" height="500" align="center" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="15%">
      <h1>${loginUser.name}</h1>
      <ul style="list-style-type: none">
        <li><a href="${pageContext.request.contextPath}/sys/user/userIndex">宠物管理</a></li>
        <li><a href="${pageContext.request.contextPath}/sys/user/userRegiter">添加宠物</a></li>
        <li><a href="${pageContext.request.contextPath}/sys/role/rolePage">宠物类型查看</a></li>
      </ul>
    </td>
    <td height="50" align="right">
      <h3 id="datetime">
        <script>
          setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
        </script>
      </h3>
    </td>
  </tr>
  <tr>
    <td>
      <table border="1" width="600" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
          <td colspan="8">
            <h1>宠物列表</h1>
          </td>
        </tr>
        <tr>
          <th>编号</th>
          <th>名称</th>
          <th>性别</th>
          <th>种类</th>
          <th>年龄</th>
          <th>健康值</th>
          <th>入店时间</th>
          <th>操作</th>
        </tr>
        <tbody id="mytbody"></tbody>
      </table>
    </td>
  </tr>
</table>
</body>

</html>
