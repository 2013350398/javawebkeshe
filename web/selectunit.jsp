<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/26
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Unit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>单位表单</title>
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
            border:0px;
            outline:none;
            background-color:#DA70D6;
            color:black;
            font-weight: bold;
            font-family: YouYuan;
            font-size:20px;
            color: black;
        }
        table {
            border-collapse: separate;
            border-spacing:5px 10px;
            width:1200px;
            /*width :100%;*/
            align:center;
            cellpadding:15px;/*设置单元格内容与单元格边框之间的空白间距*/
            /*自动拉伸*/
            table-layout:auto;
            width:800px;
            /*边框*/
            width:1200px;
            padding:10px;
            border-radius: 10px; /* 边框圆角 */
            outline:8px solid #c497b2;
            /*字体*/
            font-weight: bold;
            font-family: YouYuan;
            font-size:18px;
            color: black;
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
        img{
            max-width: 50px;
            max-height: 50px;
            width:auto;
            height:auto;
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
    </style>
</head>
<%//获取单位列表
    Object obj=session.getAttribute("units");
    List<Unit>units=new ArrayList<>();
    for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
%>
<body>
<H1><font color="black" align="center">管理员您好，查询到的单位如下：</font></H1>
<p align="center">
<table>
    <tr>
        <td>序号</td>
        <td>单位名称</td>
        <td>联系电话</td>
        <td>邮箱地址</td>
        <td>联系地址</td>
        <td>单位性质</td>
        <br>
    </tr>

    <%
        int cnt=0;
        for (Unit u:units){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getUnname()%></td>
        <td><%=u.getTel()%></td>
        <td><%=u.getEmail()%></td>
        <td><%=u.getSite()%></td>
        <td><%=u.getUnittype()%></td>
        <td class="text-center">
            <button onclick="window.location.href='showunitdetailinfo.jsp?cnt=<%=cnt%>'">详情</button>
            <button onclick="window.location.href='modifyunitdetailinfo.jsp?cnt=<%=cnt%>&id=<%=u.getUnid()%>'">修改</button>
            <button onclick="window.location.href='/unit.do?method=deleteUnit&id=<%=u.getUnid()%>'">删除</button>
        </td>
        <br>
        <%cnt++;%>
    </tr>
    <%}%>
</table>
</body>
</html>
