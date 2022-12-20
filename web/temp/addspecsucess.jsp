<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 20:48
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
<body>
<%User u=(User)session.getAttribute("user");%>
<H1><font color="black" align="center"><%=u.getUsername()%>您好！标本添加成功</font></H1>
<jsp:include page="../modifyspecpic.jsp" flush="true" />
<%--<H1><font color="BLACK" align="center">请选择jpg或png的文件格式进行上传：</font></H1>--%>
<%--<form enctype="multipart/form-data" method="post" action="/spec.do?method=uploadhead">--%>
    <%--<p align="center">--%>
        <%--头像：--%>
        <%--<input type="file" name="head" style="background-color:#fff" >--%>
        <%--<input type="submit" value="上传" style="background-color:#fff" >--%>
<%--</form>--%>
</body>
</html>
