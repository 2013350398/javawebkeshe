<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/28
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<html>
<head>
    <title>添加标本成功</title>

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
        h1{
            font-weight: bold;
            color: black;
            font-size: 30px;
            font-family: YouYuan;
            border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/
        }
    </style>
</head>
<body>
<%User u=(User)session.getAttribute("user");%>
<H1><font color="black" align="center"><%=u.getUsername()%>您好！标本导入成功</font></H1>

</body>
</html>
