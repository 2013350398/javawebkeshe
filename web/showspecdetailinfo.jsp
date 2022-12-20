<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/24
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Spec" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>标本详情</title>
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
        spec{
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
            width:125px;
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
        }
    </style>
</head>
<%
    Object obj;
    try{
        obj=session.getAttribute("allSpec");
        if(request.getParameter("type").equals("1")){ obj=session.getAttribute("otherSpec"); }
    }
    catch (Exception e){ obj=session.getAttribute("otherSpec"); }
    List<Spec> specs=new ArrayList<>();
    for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
    int cnt=Integer.valueOf(request.getParameter("cnt"));
    Spec spec=specs.get(cnt);
%>
<H1><%=spec.getSname()%>的详情信息如下</H1>
<body>
<p align="center">
    <spec>标本名称</spec>
    <p1><%=spec.getSname()%></>
<p align="center">
    <spec>所属单位</spec>
    <p1><%=spec.getUnitname()%></>
<p align="center">
    <spec>标本编号</spec>
    <p1><%=spec.getCode()%></>
<p align="center">
    <spec>出土地点</spec>
    <p1><%=spec.getSite()%></>
<p align="center">
    <spec>出土时间</spec>
    <p1><%=spec.getExcavatetime()%></>
<p align="center">
    <spec>标本材质</spec>
    <p1><%=spec.getMaterial()%></>
<p align="center">
    <spec>所属年代</spec>
    <p1><%=spec.getAges()%></>
<p align="center">
    <spec>录入人</spec>
    <p1><%=spec.getEntryman()%></>
<p align="center">
    <spec>入库时间</spec>
    <p1><%=spec.getEntrytime()%></>
<p align="center">
    <spec>描述</spec>
    <p1><%=spec.getDescr()%></>
<p align="center">
    <spec>标本图片路径</spec>
    <p1><img src="./pic/<%=spec.getPic()%>"></p1>
<p align="center">
    <spec>是否对外开放</spec>
    <p1><%=spec.getState()%></>
</body>
</html>

