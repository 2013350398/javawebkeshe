<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/25
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<html>
<head>
    <title>统计详情</title>
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
        span{
            /*边框*/
            /*width:200px;*/
            /*padding:3px;*/
            /*border: 2px black;*/
            /*outline:2px solid #c497b2;*/
            /*border-radius: 15px; !* 边框圆角 *!*/
            font-size: 25px;
            color: black;
            font-weight: bold;
            font-family: YouYuan;
        }
        p1{
            /*background-color:#ffffff;*/
            /*!*边框*!*/
            /*width:200px;*/
            /*padding:3px;*/
            /*border: 2px black;*/
            /*outline:2px solid #beb8dc;*/
            font-size: 20px;
            color: black;
            font-weight: bold;
            font-family: YouYuan;
        }
        button{
            /*边框*/
            width:300px;
            padding:8px;
            border-radius: 15px; /* 边框圆角 */
            outline:5px solid #c497b2;
            background-color:#ffffff;
            /*beb8dc*/
            /*border: 5px dotted #beb8dc; !* 上下左右都相同 红色直角边框*!*/
            /*字体*/
            font-weight: bold;
            font-family: YouYuan;
            font-size:18px;
            color: black;
        }
    </style>
</head>
<%User u=(User)session.getAttribute("user");%>
<H1><font color="black" align="center"><%=u.getUsername()%>您好，本单位标本统计信息如下：</font></H1>
<body>
<p align="center">
    <span>本单位总标本数:${sum}</span>
<p align="center">
    <span>当前在库总标本数:${inunit}</span><br>
<p align="center">
<p1>近年借阅情况统计</p1>
<p align="center">
    <button onclick="window.location.href='/chart.do?method=getYear'">按年度统计（柱状图）</button>
<p align="center">
    <button onclick="window.location.href='/chart.do?method=getMon'">按本年度每月统计（柱状图）</button>
<p align="center">
    <button onclick="window.location.href='/chart.do?method=Year'">按年度统计（折线图）</button>
<p align="center">
    <button onclick="window.location.href='/chart.do?method=Mon'">按本年度每月统计（折线图）</button>
</html>
