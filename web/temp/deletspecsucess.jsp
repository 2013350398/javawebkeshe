<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/24
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>标本删除成功</title>
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
            align:center;
        }
    </style>
</head>
<body>
<H1><font color="black" align="center">标本删除成功！</font></H1>
<jsp:include page="../showallspec.jsp" flush="true" />
</body>
</html>
