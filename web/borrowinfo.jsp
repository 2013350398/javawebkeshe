<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/24
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>借阅页面</title>
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
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: right;
            width: 80px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<%
    //获取借阅人信息
    User user=(User)session.getAttribute("user");
    int cnt=Integer.valueOf(request.getParameter("cnt"));
%>
<H1><font color="BLACK" align="center"><%=user.getUsername()%>你好！请填写相关信息进行借阅：</font></H1>
<form method="POST" action="/borrow.do?method=addBorrow&id=<%=user.getUid()%>&cnt=<%=cnt%>" >
    <p align="center">
        <span>借阅人</span>
        <input type="text" name="borrowman" style="background-color:#fff" value="<%=user.getUsername()%>" readonly="true">
    <p align="center">
    <span>联系电话</span>
        <input type="text" name="tel" style="background-color:#fff" value="<%=user.getTel()%>" readonly="true">
    <p align="center">
    <span>邮箱地址</span>
        <input type="text" name="email" style="background-color:#fff" value="<%=user.getEmail()%>" readonly="true">
    <p align="center">
    <span>联系地址</span>
        <input type="text" name="site" style="background-color:#fff" value="<%=user.getUnitname()%>" readonly="true">
    <p align="center">
    <span>借阅理由</span>
        <input type="text" name="reason" style="background-color:#fff" >
    <p align="center">
    <span>备注</span>
        <input type="text" name="tips" style="background-color:#fff"  >
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>

</form>
</body>
</html>
</body>
</html>
