<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/28
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片上传成功</title>

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
        img{
            max-width:128px;
            max-height:128px;
            width:auto;
            height:auto;
        }
    </style>
</head>
<body>
<H1><font color="black" align="center">图片上传成功！</font></H1>
<p align="center">
<img src="./pic/${filename}">
</body>
</html>
