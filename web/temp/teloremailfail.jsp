<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单位电话或邮箱格式非法</title>

    <style type="text/css">
        .center{
            text-align:center;
            margin-top: 50px;
        }
        .fon{
            font-size: 40px;
        }
        .fon1{
            font-size: 20px;
        }
        body{
            background: url("../images/flower1.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        input {
            background-color: transparent;
            outline: none;
            color: black;
        }
    </style>
</head>
<body>
<%--<h2 align="right">张昌含弘</h2>--%>
<H1><font color="BLACK" align="center">单位电话或邮箱格式非法或为空，请重新添加</font></H1>
<jsp:include page="../addunit.jsp" flush="true" />

</body>
</html>
