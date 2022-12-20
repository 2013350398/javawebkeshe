<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/28
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图片失败</title>
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
<H1><font color="black" align="center">图片上传失败！请选择jpg或png的文件格式进行上传：</font></H1>
<jsp:include page="../modifyheadpic.jsp" flush="true" />
</body>
</html>