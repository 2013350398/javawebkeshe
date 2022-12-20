<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <title>登录界面</title>

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
        }
        button{
            /*边框*/
            width:50px;
            padding:5px;
            outline:3px solid #beb8dc;
            /*beb8dc*/
            border-radius: 10px; /* 边框圆角 */
            /*border: 5px dotted #beb8dc; !* 上下左右都相同 直角圆点边框*!*/
            /*字体*/
            font-weight: bold;
            font-family: YouYuan;
            font-size:14px;
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
        form{
            font-weight: bold;
            font-family: YouYuan;
            font-size:20px;
            color: black;
        }
        span{
            /*控制对齐*/
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: right;
            width: 150px;
            vertical-align: top;
        }
        label {
        }
    </style>
</head>

<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("loginfail")){%>
<script>window.alert("用户名或密码错误，请重新登录！");</script>
<%} } }//try
    catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<h2 align="right">张昌含弘</h2>
<p align="center">
<H1><font color="black" align="center">请登录</font></H1>
<form method="post" action="/user.do?method=login">
    <p align="center">
        <span>用户名</span>
        <%--<label for="username">Name*</label>--%>
        <input type="text" style="background-color:#fff" name="username">
    <p align="center">
        <span>密码</span>
        <input type="password" style="background-color:#fff" name="password">
    <p align="center">
        <input type="submit" style="background-color:#fff" value="登录">
        <input type="reset" style="background-color:#fff" value="重置"></p>
</form>
<p align="center">
    <button onclick="window.location.href='register.jsp'">注册</button>
<p align="center">
    <button onclick="window.location.href='findpassword.jsp'">密码找回</button>
</body>
</html>