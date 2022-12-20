<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/24
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>用户详情</title>
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
        h1{
            font-weight: bold;
            color: black;
            font-size: 30px;
            font-family: YouYuan;
            border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/
        }
        img{
            max-width: 50px;
            max-height: 50px;
            width:auto;
            height:auto;
        }
        span{
            background-color:#ffffff;
            /*对齐*/
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: center;
            width: 80px;
            vertical-align: top;
            /*字体*/
            font-weight: bold;
            color: black;
            font-size: 20px;
            font-family: YouYuan;
            /*边框*/
            width:120px;
            padding:3px;
            outline:3px solid #c497b2;
            border-radius: 3px; /* 边框圆角 */
        }
        p1{
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: left;
            width: 350px;
            vertical-align: top;
            font-weight: bold;
            color: black;
            font-size: 20px;
            font-family: YouYuan;
            /*边框*/
            /*width:100px;*/
            /*padding:3px;*/
            /*outline:3px solid #c497b2;*/
            /*border-radius: 3px; !* 边框圆角 *!*/
        }
    </style>
</head>
<%
    Object obj=session.getAttribute("allUser");
    List<User> users=new ArrayList<>();
    for (Object o: (List<?>) obj){ users.add(User.class.cast(o)); }
    int cnt=Integer.valueOf(request.getParameter("cnt"));
    User u=users.get(cnt);
%>
<H1><%=u.getUsername()%>的详情信息如下</H1>
<body>
<p align="center">
    <span>用户名</span>
    <p1><%=u.getUsername()%></>
<p align="center">
    <span>真实姓名</span>
    <p1><%=u.getRealname()%></>
<p align="center">
    <span>联系电话</span>
    <p1><%=u.getTel()%></>
<p align="center">
    <span>邮箱</span>
    <p1><%=u.getEmail()%></>
<p align="center">
    <span>住址</span>
    <p1><%=u.getHome()%></>
<p align="center">
    <span>创建时间</span>
    <p1><%=u.getCreattime()%></>
<p align="center">
    <span>性别</span>
    <p1><%=u.getSexy()%></>
<p align="center">
    <span>头像路径</span>
    <p1><img src="./pic/<%=u.getHead()%>"></p1>
<p align="center">
    <span>用户身份</span>
    <p1><%=u.getState()%></>
<p align="center">
    <span>上次登陆时间</span>
    <p1><%=u.getLasttime()%></>
<p align="center">
    <span>所属单位</span>
    <p1><%=u.getUnitname()%></>
<p align="center">
    <span>工作编号</span>
    <p1><%=u.getNum()%></>
</body>
</html>
