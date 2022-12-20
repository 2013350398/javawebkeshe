<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/12/14
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码找回</title>
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
        button{
            /*边框*/
            width:50px;
            padding:5px;
            outline:3px solid #beb8dc;
            /*beb8dc*/
            border-radius: 10px; /* 边框圆角 */
            /*border: 5px dotted #beb8dc; !* 上下左右都相同 直角圆点边框*!*/
            /*字体*/
            font-weight: bold;
            font-family: YouYuan;
            font-size:14px;
            color: black;
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
            /*控制对齐*/
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: right;
            width: 150px;
            vertical-align: top;
        }
        label {
        }
    </style>
</head>
<%
try{
    int opra=(int)session.getAttribute("opra");
    String reason=(String)session.getAttribute("reason");
    if(opra==1){
        if(reason.equals("密保问题答案错误")){%>
    <script>window.alert("密保问题答案错误");</script>
<%} else if(reason.equals("不存在该用户")){%>
<script>window.alert("不存在该用户");</script>
<%}
    }//else if opra==0
    }catch(Exception e){}
%>
<body>
<H1><font color="black" align="center">请输入用户名及密保问题答案</font></H1>
<form method="post" action="/user.do?method=findpassword">
    <p align="center">
        <span>用户名</span>
        <input type="text" style="background-color:#fff" name="username">
    <p align="center">
        <span>密保问题答案</span>
        <input type="text" style="background-color:#fff" name="answer">
    <p align="center">
        <input type="submit" style="background-color:#fff" value="找回">
        <input type="reset" style="background-color:#fff" value="重置"></p>
</form>
</body>
</html>
