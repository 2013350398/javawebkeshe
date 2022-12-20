<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 22:59
  To change this template use File | Settings | File Templates.
  /user.do?method=addUser
  /unit.do?method=addUnit
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<html>
<head>
    <title>管理员页面</title>
    <style type="text/css">
        body{
            /*text-align:center;字体居中对齐*/
            background-color:#e7dad2;
            /*ffbe7a  */
            /*background: url("./images/flower1.jpg");*/
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: black;
            font-weight: bold;
            font-family: YouYuan;
            color: #de07f5;
        }
        h1{
            font-weight: bold;
            color: black;
            font-size: 30px;
            font-family: YouYuan;
            border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/
        }

        .p1 {
            /*边框*/
            width:100px;
            padding:8px;
            border: 5px #beb8dc;
            border-radius: 15px; /* 边框圆角 */
            font-weight: bold;
            font-family: YouYuan;
            align:center;
        }
        /*!*show的时候用*!*/
        /*img {*/
            /*width: 25%;*/
            /*border-radius: 10px;*/
            /*float: left;*/
            /*margin: 10px;*/
        /*}*/
        /*input {*/
            /*font-weight: bold;*/
            /*background-color: transparent;*/
            /*outline: none;*/
            /*color: black;*/
            /*font-family: YouYuan;*/
        /*}*/
        button{
            /*边框*/
            width:250px;
            padding:8px;
            border-radius: 15px; /* 边框圆角 */
            outline:5px solid #c497b2;
            /*beb8dc*/
            /*border: 5px dotted #beb8dc; !* 上下左右都相同 红色直角边框*!*/
            /*字体*/
            font-weight: bold;
            font-family: YouYuan;
            font-size:18px;
            color: black;
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==0){
        if(r.equals("useradd")){%>
<script>window.alert("新建用户成功！");</script>
<%} else if(r.equals("unitadd")){%>
<script>window.alert("新建单位成功！");</script>
<%}else if(r.equals("passwordmodify")){%>
<script>window.alert("密码修改成功！");</script>
<%}else if(r.equals("login")){%>
<script>window.alert("管理员登录成功！");</script>
<%} else if(r.equals("findpassword")){%>
<script>window.alert("找回密码成功！");</script>
<%}    } }//try
catch(Exception e){}
session.setAttribute("opra",-1);
session.setAttribute("reason","null");%>

<%User u=(User)session.getAttribute("user");%>
<H1 align="left">管理员您好！</H1>
<body>
<p align="center">
    <button onclick="window.location.href='addunit.jsp'">新建单位</button>
<p align="center">
    <button onclick="window.location.href='/unit.do?method=choseUnit'">新建工作人员</button>
<p align="center">
    <button onclick="window.location.href='/user.do?method=allUser'">显示所有用户</button>
<p align="center">
    <button onclick="window.location.href='/spec.do?method=adminshow'">显示所有标本</button>
<p align="center">
    <button onclick="window.location.href='/unit.do?method=allUnit'">显示所有单位</button>
<p align="center">
    <button onclick="window.location.href='modifypassword.jsp'">密码重置</button>
</body>
</html>
