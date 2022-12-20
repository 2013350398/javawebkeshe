<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
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
    </style>
</head>
<body>
<div  style="text-align:center">
    <%--jfreechart _3D柱状图 <br><br>--%>
    <%--点击显示柱状图<a href="getColumnChart">getMajorChart</a>--%>
    <%--<br><br>--%>
        <%--柱状图600 400--%>
    <img src="${chartURL}"  width=600 height=400  border=0  color=gray>
</div>

</body>
</html>