<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.zc.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工作人员主页面</title>
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

        .p1 {
            /*边框*/
            width:100px;
            padding:8px;
            border: 5px #beb8dc;
            font-weight: bold;
            font-family: YouYuan;
            align:center;
        }
        /*show的时候用*/
        img {
            width: 25%;
            border-radius: 10px;
            float: left;
            margin: 10px;
        }
        input {
            font-weight: bold;
            background-color: transparent;
            outline: none;
            color: black;
            font-family: YouYuan;
        }
        button{
            /*边框*/
            width:250px;
            padding:8px;
            outline:5px solid #c497b2;
            /*beb8dc*/
            border-radius: 15px; /* 边框圆角 */
            /*border: 5px dotted #beb8dc; !* 上下左右都相同 红色直角边框*!*/
            /*字体*/
            font-weight: bold;
            font-family: YouYuan;
            font-size:18px;
            color: black;
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==0){ if(r.equals("passwordmodify")){%>
<script>window.alert("密码修改成功！");</script>
<%}else if(r.equals("login")){%>
<script>window.alert("工作人员登录成功！");</script>
<%} else if(r.equals("userupdate")){%>
<script>window.alert("用户信息修改成功！");</script>
<%} else if(r.equals("specadd")){%>
<script>window.alert("新建标本成功！");</script>
<%} else if(r.equals("excelload")){%>
<script>window.alert("excel录入成功！");</script>
<%} else if(r.equals("findpassword")){%>
<script>window.alert("找回密码成功！");</script>
<%}} }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<%User u=(User)session.getAttribute("user");%>
<H1 align="left"><%=u.getUsername()%>欢迎您！</H1>
<%--功能按钮--%>
<h2 align="right"/>
    <button onclick="window.location.href='modifydetailinfo.jsp'"><%=u.getUsername()%></button>
<p align="center">
    <button onclick="window.location.href='addspec.jsp'">新建标本</button>
<p align="center">
    <button onclick="window.location.href='excelroad.jsp?entryman=<%=u.getUsername()%>&unitname=<%=u.getUnitname()%>'">从excel导入标本</button>
<p align="center">
    <button onclick="window.location.href='/spec.do?method=allSpec'">显示本单位所有标本</button>
<p align="center">
    <button onclick="window.location.href='/spec.do?method=showOthers'">查看其它单位标本</button>
<p align="center">
    <button onclick="window.location.href='/borrow.do?method=allBorrow'">处理借阅申请</button>
<p align="center">
    <button onclick="window.location.href='/borrow.do?method=OtherBorrow'">查看借阅进度</button>
<p align="center">
    <button onclick="window.location.href='/borrow.do?method=sum'">单位标本统计分析</button>
<p align="center">
    <button onclick="window.location.href='modifypassword.jsp'">密码重置</button>
</body>
</html>
