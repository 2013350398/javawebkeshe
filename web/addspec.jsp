<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<html>
<head>
    <title>新建标本</title>
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
            width: 130px;
            vertical-align: top;
        }
        ex1{
            font-size:13px;
        }
    </style>
</head>

<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("specadd")){%>
<script>window.alert("已存在相同编号标本！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<%User u=(User)session.getAttribute("user");%>
<H1><font color="black" align="center">请输入标本信息：</font></H1>
<form method="post" action="/spec.do?method=addSpec">
    <p align="center">
        <span>标本编号*</span>
        <input type="text" name="code" style="background-color:#fff">
    <p align="center">
        <span>标本名称*</span>
        <input type="text" name="sname" style="background-color:#fff">
    <p align="center">
        <span>出土地</span>
        <input type="text" name="site"style="background-color:#fff">
    <p align="center">
        <span>出土时间</span>
        <input type="text" name="excavatetime" style="background-color:#fff">
    <p align="center">
        <span>标本材质</span>
        <input type="text" name="material" style="background-color:#fff" >
    <p align="center">
        <span>所属年代</span>
        <input type="text" name="ages" style="background-color:#fff" >
    <p align="center">
        <span>录入人</span>
        <input type="text" name="entryman" style="background-color:#fff" value="<%=u.getUsername()%>" readonly="true">
    <p align="center">
        <span>所属单位</span>
        <input type="text" name="unitname" style="background-color:#fff" value="<%=u.getUnitname()%>" readonly="true">
    <p align="center">
        <span>标本描述</span>
        <input type="text" name="descr" style="background-color:#fff" >
    <p align="center">
        <span>是否对外展示*</span>
        <input type="radio" name="state" value="是"  checked="checked"> 是
        <input type="radio" name="state" value="否"> 否 </p>
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>
</form>
</body>
</html>
