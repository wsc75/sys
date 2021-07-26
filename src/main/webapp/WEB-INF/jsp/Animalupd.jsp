<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/18
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
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
            <form action="${pageContext.request.contextPath}/sys/user/updUser?a_id=${a_id}" method="post" id="myform">
                <table width="100%" height="500" align="center" border="1" cellspacing="0" cellpadding="0">
                    <tr align="center">
                        <td colspan="2">
                            <h1>新宠物添加</h1>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">名称</td>
                        <td>
                            <input type="text" id="a_name" name="a_name">
                            <span id="a_namespan"></span>
                        </td>
                    </tr>

                    <tr>
                        <td align="center">性别</td>
                        <td>
                            <select name="a_sex" id="a_sex">
                                <option value ="1">雄</option>
                                <option value ="2">雌</option>
                            </select>
                            <span id="a_sexspan"></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">种类</td>
                        <td>
                            <select name="a_k_id" id="a_k_id">

                            </select>
                            <span id="a_k_idspan"></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">年龄</td>
                        <td>
                            <input type="text" id="a_age" name="a_age">
                            <span id="a_agespan"></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">健康值</td>
                        <td>
                            <input type="text" id="a_health" name="a_health">
                            <span id="a_healthspan"></span>
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="提交">
                            <input type="reset" value="重置">
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>
</body>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.min.js"></script>
<script>
    $(document).ready(function () {
        //获取角色
        //获取角色
        function initRole() {
            var a_k_id = null;
            a_k_id = $("#a_k_id");
            $.ajax({
                "url":"${pageContext.request.contextPath}/sys/role/getRoll",
                "type":"GET",
                "data":null,
                "dataType":"json",
                "async":false,
                "success":function (data) {
                    if(data != null){
                        a_k_id.html("");
                        var options = "<option value='0'>请选择</option>";
                        for(var i = 0; i < data.length; i++){
                            options += "<option value='"+data[i].k_id+"'>"+data[i].k_name+"</option>";
                        }
                        a_k_id.html(options);
                    }
                }
            });

        }
        initRole();
        let olda_name = null;
        function initUser() {
            $.ajax({
                "url":"${pageContext.request.contextPath}/sys/user/getUser",
                "type":"GET",
                "data":{a_id:${a_id}},
                "dataType":"json",
                "async":false,
                "success":function (data) {
                    $("#a_name").val(data.a_name);
                    olda_name = data.a_name
                    $("#a_sex").val(data.a_sex);
                    $("#a_k_id").children().each(function () {
                        if($(this).val()==data.a_k_id){
                            $(this).attr("selected", "selected");
                        }
                    });
                    $("#a_age").val(data.a_age);
                    $("#a_health").val(data.a_health);
                }
            });

        }
        initUser();
        //异步请求用户名重复
        let a_nameflag = false;
        let a_sexflag = false;
        let a_k_idflag = false;
        let a_ageflag = false;
        let a_healthflag = false;

        $("#a_name").blur(function () {
            let a_name = $("#a_name").val();
            if (a_name==olda_name){
                $("#a_namespan").text("该账号可以使用").css("color","green")
                a_nameflag = true;
            }else {
            $.ajax({
                "url":"${pageContext.request.contextPath}/sys/user/cheakName",
                "type":"GET",
                "data":{a_name:a_name},
                "dataType":"json",
                "success":function (data) {
                    if(data.a_name == "exist"){//账号已存在，错误提示
                        $("#a_namespan").text("该用户账号已存在").css("color","red")
                        a_nameflag = false;
                    }else if(data.a_name == "nodata"){
                        $("#a_namespan").text("不能为空").css("color","red")
                        a_nameflag = false;
                    }else{//账号可用，正确提示
                        $("#a_namespan").text("该账号可以使用").css("color","green")
                        a_nameflag = true;
                    }
                }
            });}
        })
        $("#a_sex").blur(function () {
            let a_sex = $("#a_sex").val();
            if(a_sex==0){
                a_sexflag=false;
                $("#a_sexspan").text("不能为空").css("color","red")
            }else {
                a_sexflag=true;
                $("#a_sexspan").text("√").css("color","green")
            }
        })
        $("#a_k_id").blur(function () {
            let a_k_id = $("#a_k_id").val();
            if(a_k_id==0){
                a_k_idflag=false;
                $("#a_k_idspan").text("不能为空").css("color","red")
            }else {
                a_k_idflag=true;
                $("#a_k_idspan").text("√").css("color","green")
            }
        })
        $("#a_age").blur(function () {
            let a_age = $("#a_age").val();
            if(a_age==""||a_age==null){
                a_ageflag=false;
                $("#a_agespan").text("不能为空").css("color","red")
            }else {
                a_ageflag=true;
                $("#a_agespan").text("√").css("color","green")
            }
        })
        $("#a_health").blur(function () {
            let a_health = $("#a_health").val();
            if(a_health==""||a_health==null){
                a_healthflag=false;
                $("#a_healthspan").text("不能为空").css("color","red")
            }else {
                a_healthflag=true;
                $("#a_healthspan").text("√").css("color","green")
            }
        })
        //判断表单提交
        $("#myform").submit(function (){
            if (a_nameflag&a_sexflag&a_k_idflag&a_ageflag&a_healthflag){
                return true;
            }else {
                return false;
            }
        })
    })
</script>
</html>
