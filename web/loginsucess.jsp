<%@ page import="com.zc.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆成功</title>
    <style type="text/css">
        center{
            text-align:center;
            margin-top: 50px;
        }
        body{
            /*background: url("./images/flower1.jpg");*/
            background-color:#e7dad2;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }button{
             /*边框*/
             width:250px;
             padding:8px;
             outline:5px solid #c497b2;
             /*beb8dc*/
             border-radius: 15px; /* 边框圆角 */
             /*border: 5px dotted #beb8dc; !* 上下左右都相同 红色直角边框*!*/
             /*字体*/
             font-weight: bold;
             font-family: YouYuan;
             font-size:18px;
             color: black;
         }
        input {
            /*background-color: transparent;*/
            border:0px;
            outline:none;
            background-color:#DA70D6;
            color:black;
            /*#DA70D6 */
        }
        h1{
            font-weight: bold;
            color: black;
            font-size: 30px;
            font-family: YouYuan;
            border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==0){
        if(r.equals("passwordmodify")){%>
<script>window.alert("密码修改成功！");</script>
<%} else if(r.equals("register")){%>
<script>window.alert("用户注册成功！");</script>
<%}else if(r.equals("login")){%>
<script>window.alert("用户登录成功！");</script>
<%} else if(r.equals("userupdate")){%>
<script>window.alert("用户信息修改成功！");</script>
<%} else if(r.equals("findpassword")){%>
<script>window.alert("找回密码成功！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<%User u=(User)session.getAttribute("user");%>
<H1><font color="black" align="center"><%=u.getUsername()%>欢迎您！</font></H1>
<h2 align="right">
    <button onclick="window.location.href='modifydetailinfo.jsp'"><%=u.getUsername()%></button>
</h2>
<p align="center">
    <button onclick="window.location.href='/spec.do?method=showOthers'">查看标本</button>
<p align="center">
    <button onclick="window.location.href='modifypassword.jsp'">密码重置</button>
</body>
</html>


