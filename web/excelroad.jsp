<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/28
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>excel上传标本</title>
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
        h2{
            font-weight: bold;
            color: black;
            font-size: 25px;
            font-family: YouYuan;
            border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/
        }
        span {
            font-weight: bold;
            color: black;
            font-size: 20px;
            font-family: YouYuan;
        }
        input {
            font-weight: bold;
            background-color: transparent;
            outline: none;
            color: black;
            font-family: YouYuan;
        }
    </style>
</head>
<body>
<%
String entryman=request.getParameter("entryman");
String unitname=request.getParameter("unitname");
%>
<H1><font color="BLACK" align="center">你好！请输入excel表路径进行上传：</font></H1>
<h2><font color="BLACK" align="center">表格表头为： 标本编号	标本名称	出土地	出土时间	标本材质	所属年代	标本描述	是否对外开放</font></h2>
<form method="POST" action="/spec.do?method=addExcel&entryman=<%=entryman%>&unitname=<%=unitname%>">
    <p align="center">
        <span>excel表路径：</span>
        <input type="text" name="road" style="background-color:#fff" >
        <input type="submit" value="上传" style="background-color:#fff" >
</form>
</body>
</html>

