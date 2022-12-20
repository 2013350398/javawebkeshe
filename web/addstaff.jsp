<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Unit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>工作人员新建页面</title>
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
        p1{
            font-weight: bold;
            font-family: YouYuan;
            font-size:13px;
            color: black;
        }
    </style>
</head>

<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("teloremail")){%>
<script>window.alert("工作人员电话或邮箱格式非法或为空，请重新添加！");</script>
<%      }else if(r.equals("useradd")){%>
<script>window.alert("已存在同名（工作编码）工作人员，请重新添加！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<%
Object obj=session.getAttribute("choseUnit");
List<Unit>units=new ArrayList<>();
for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
%>
<p align="center">
<H1><font color="black">请输入新建工作人员信息信息：</font></H1>
<p align="left">
<p1>（用户名即为工作编号，密码默认工作编号后四位）</p1>
<form method="post" action="/user.do?method=addStaff">
    <%--工作编号--%>
    <p align="center">
        <span>用户名*</span>
        <input type="text" name="username" style="background-color:#fff" >
    <p align="center">
        <span>密码*</span>
        <input type="password" name="password"style="background-color:#fff" >
    <p align="center">
        <span>真实姓名</span>
        <input type="text" name="realname" style="background-color:#fff">
    <p align="center">
        <span>联系电话*</span>
        <input type="text" name="tel" style="background-color:#fff" >
    <p align="center">
        <span>邮箱*</span>
        <input type="text" name="email" style="background-color:#fff" >
    <p align="center">
        <span>住址</span>
        <input type="text" name="home" style="background-color:#fff" >
    <p align="center">
        <span>性别</span>
        <input type="radio" name="sexy" value="男"  checked="checked"> 男
        <input type="radio" name="sexy" value="女"> 女<br>
    <p align="center">
        <span>工作单位</span>
        <select name="unitname">
            <%for (Unit u:units){%>
            <option value="<%=u.getUnname()%>"><%=u.getUnname()%></option>
            <%}%>
        </select>
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>
</form>
</body>
</html>
