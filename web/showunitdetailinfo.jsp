<%--
  Created by IntelliJ IDEA.
  Unit: 20133
  Date: 2022/11/24
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Unit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>单位详情</title>
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
        span{
            background-color:#ffffff;
            /*对齐*/
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: center;
            width: 80px;
            vertical-align: top;
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
    Object obj=session.getAttribute("allUnit");
    List<Unit> units=new ArrayList<>();
    for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
    int cnt=Integer.valueOf(request.getParameter("cnt"));
    Unit u=units.get(cnt);
%>
<H1><font color="black" align="center"><%=u.getUnname()%>的详情信息如下</font></H1>
<body>
<p align="center">
    <span>单位名称</span>
    <p1><%=u.getUnname()%></>
<p align="center">
    <span>联系人</span>
    <p1><%=u.getLinkman()%></>
<p align="center">
    <span>联系电话</span>
    <p1><%=u.getTel()%></>
<p align="center">
    <span>邮箱地址</span>
    <p1><%=u.getEmail()%></>
<p align="center">
    <span>联系地址</span>
    <p1><%=u.getSite()%></>
<p align="center">
    <span>单位性质</span>
    <p1><%=u.getUnittype()%></>
</body>
</html>

