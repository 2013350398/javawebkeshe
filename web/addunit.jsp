<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单位新建页面</title>
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
            width: 100px;
            vertical-align: top;
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("teloremail")){%>
<script>window.alert("单位电话或邮箱格式非法或为空，请重新添加！");</script>
<%      }else if(r.equals("unitadd")){%>
<script>window.alert("已存在同名单位，请重新添加！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<p align="center">
<H1><font color="black">请输入新建单位信息</font></H1>
<form method="post" action="/unit.do?method=addUnit">
    <p align="center">
        <span>单位名称*</span>
        <input type="text" name="unname" style="background-color:#fff">
    <p align="center">
        <span>联系人</span>
        <input type="text" name="linkman"style="background-color:#fff">
    <p align="center">
        <span>联系电话*</span>
        <input type="text" name="tel" style="background-color:#fff" >
    <p align="center">
        <span>邮箱地址*</span>
        <input type="text" name="email" style="background-color:#fff" >
    <p align="center">
        <span>联系地址</span>
        <input type="text" name="site" style="background-color:#fff" >
    <p align="center">
        <span>单位性质*</span>
        <input type="radio" name="unittype" value="国家级单位"  checked="checked"> 国家级单位
        <input type="radio" name="unittype" value="省部级单位"> 省部级单位
        <input type="radio" name="unittype" value="市级单位"> 市级单位 </p>
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>
</form>
</body>
</html>
