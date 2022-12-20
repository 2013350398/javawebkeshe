<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<html>
<head>
    <title>输入新密码</title>
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
<%--<%try{--%>
    <%--String r=(String)session.getAttribute("reason");--%>
    <%--int flag=(Integer)session.getAttribute("opra");--%>
    <%--if(flag==1){--%>
        <%--if(r.equals("olderror")){%>--%>
<%--<script>window.alert("旧密码错误，请重新输入！");</script>--%>
<%--<%}} }//try--%>
<%--catch(Exception e){}--%>
    <%--session.setAttribute("opra",-1);--%>
    <%--session.setAttribute("reason","null");%>--%>
<%User u=(User)session.getAttribute("user");%>
<H1><font color="BLACK" align="center">请设置新密码：</font></H1>
<form method="POST" action="/user.do?method=findpwd&id=<%=u.getUid()%>" >
    <p align="center">
    <p align="center">
        <span>新密码</span>
        <input type="text" name="newpassword" style="background-color:#fff">
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>
</form>
</body>
</html>
