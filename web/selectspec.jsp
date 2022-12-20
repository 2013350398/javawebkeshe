<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/26
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Spec" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>标本列表</title>
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
<%
    //获取标本列表
    Object obj=session.getAttribute("specs");
    List<Spec>specs=new ArrayList<>();
    for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
//    session.setAttribute("allSpec",specs);
%>
<body>
<H1><font color="black" align="center">${username}您好，查询到的标本如下：</font></H1>
<p align="center">
<table>
    <tr>
        <td>序号</td>
        <td>标本图片</td>
        <td>标本名称</td>
        <td>所属单位</td>
        <td>标本编号</td>
        <td>出土地</td>
        <td>标本材质</td>
        <td>创建人</td>
        <td>创建时间</td>
        <br>
    </tr>

    <%
        int cnt=0;
        for (Spec u:specs){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><img src="./pic/<%=u.getPic()%>"></td>
        <td><%=u.getSname()%></td>
        <td><%=u.getUnitname()%></td>
        <td><%=u.getCode()%></td>
        <td><%=u.getSite()%></td>
        <td><%=u.getMaterial()%></td>
        <td><%=u.getEntryman()%></td>
        <td><%=u.getEntrytime()%></td>
        <td class="text-center">
            <button onclick="window.location.href='showspecdetailinfo.jsp?cnt=<%=cnt%>&type=0'">详情</button>
            <button onclick="window.location.href='modifyspecdetailinfo.jsp?cnt=<%=cnt%>&id=<%=u.getSid()%>'">修改</button>
            <button onclick="window.location.href='/spec.do?method=deleteSpec&id=<%=u.getSid()%>'">删除</button>
        </td>
        <br>
        <%cnt++;%>
    </tr>
    <%}%>
</table>
</body>
</html>
