<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/28
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>标本图片修改页面</title>
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
            width: 120px;
            vertical-align: top;
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("jpgorpng")){%>
<script>window.alert("图片上传失败，请选择jpg或png的文件格式进行上！");</script>
<%}    } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>

<body>
<H1><font color="BLACK" align="center">你好！请选择jpg或png的文件格式进行上传：</font></H1>
<form enctype="multipart/form-data" method="post" action="/spec.do?method=uploadhead">
    <p align="center">
        <span>标本图片路径</span>
        <input type="file" name="head" style="background-color:#fff" >
        <input type="submit" value="上传" style="background-color:#fff" >
</form>
</body>
</html>
