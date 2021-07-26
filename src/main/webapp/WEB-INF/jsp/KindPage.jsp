<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工管理</title>
</head>
<style>
  #OneUl li{
    margin-top: 5px;
  }
</style>
<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>

<script type="text/javascript" src="${ctp }/statics/js/jquery-1.12.4.min.js"></script>
<script>
    $(document).ready(function () {
        let pageindex = 1;
        function initSort() {
            $.ajax({
                "url":"${ctp }/sys/role/getRoll",
                "type":"GET",
                "data":null,
                "dataType":"json",
                "success":function (data) {
                    $("#myTbody").html("");//清空数据
                    $(data).each(function () {
                        $("#myTbody").append(
                            "<tr>    " +
                            "<td align='center'>"+this.k_id+"</td>    " +
                            "<td align='center'>"+this.k_name+"</td>    " +
                            "<td align='center' class='k_mate'></td>    " +
                            "<td align='center' class='k_crawl'></td>    " +
                            "</tr>");
                        alert(this.k_mate)
                        if (this.k_mate==1){
                            $(".k_mate").text("是")
                        }else{
                            $(".k_mate").text("否")
                        }
                        if (this.k_crawl==1){
                            $(".k_crawl").text("是")
                        }else{
                            $(".k_crawl").text("否")
                        }
                    })
                    $(".del").click(function () {
                        delGoods($(this).attr("id"));
                    })
                }
            });
        }
        initSort()
    })
</script>
<body>
<table width="100%" height="500" cellpadding="0" cellspacing="0" align="center" border="1">
    <tr>
        <td rowspan="2" width="150" align="left" id="OneUl">
            <ul style="list-style: none">
                <li><a href="${pageContext.request.contextPath}/sys/user/userIndex">宠物管理</a></li>
                <li><a href="${pageContext.request.contextPath}/sys/user/userRegiter">添加宠物</a></li>
                <li><a href="KindPage.jsp">宠物类型查看</a></li>
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
            <table width="600" cellpadding="0" cellspacing="0" align="center" border="1">
                <tr align="center">
                    <td  colspan="7">
                        <h3>角色列表</h3>
                    </td>
                </tr>
                <tr>
                    <th>种类编号</th>
                    <th>种类名称</th>
                    <th>是否日常伴侣类型</th>
                    <th>是否爬行动物</th>
                </tr>
                <tbody id="myTbody">

                </tbody>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
