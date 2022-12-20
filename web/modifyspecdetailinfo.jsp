<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/24
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Spec" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>修改标本信息</title>
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
        button{
            /*边框*/
            width:100px;
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
            width: 120px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<%
    Spec spec;
    Object obj=session.getAttribute("allSpec");
    List<Spec> specs=new ArrayList<>();
    for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
    int cnt=Integer.valueOf(request.getParameter("cnt"));
    spec=specs.get(cnt);
    session.setAttribute("modifyspec",spec);
    int sid=Integer.valueOf(request.getParameter("id"));
%>
<H1><font color="BLACK" align="center">详细注册信息如下，可在表单修改并提交</font></H1>
<form method="POST" action="/spec.do?method=updateSpec&id=<%=sid%>" >
    <p align="center">
        <span>标本名称</span>
        <input type="text" name="sname" style="background-color:#fff" value=<%=spec.getSname()%> readonly="true">
    <p align="center">
    <span>所属单位</span>
        <input type="text" name="unitname" style="background-color:#fff" value=<%=spec.getUnitname()%> readonly="true">
    <p align="center">
    <span>标本编号</span>
        <input type="text" name="code" style="background-color:#fff" value=<%=spec.getCode()%> readonly="true">
    <p align="center">
    <span>出土地点</span>
        <input type="text" name="site" style="background-color:#fff" value=<%=spec.getSite()%>>
    <p align="center">
    <span>出土时间</span>
        <input type="text" name="excavatetime" style="background-color:#fff" value=<%=spec.getExcavatetime()%> >
    <p align="center">
    <span>标本材质</span>
        <input type="text" name="material" style="background-color:#fff" value=<%=spec.getMaterial()%> >
    <p align="center">
    <span>所属年代</span>
        <input type="text" name="ages" style="background-color:#fff" value=<%=spec.getAges()%> >
    <p align="center">
    <span>录入人</span>
        <input type="text" name="entryman" style="background-color:#fff" value=<%=spec.getEntryman()%>>
    <p align="center">
    <span>描述</span>
        <input type="text" name="descr" style="background-color:#fff" value=<%=spec.getDescr()%>><%--设置用户名不可以修改--%>
    <p align="center">
    <span>标本图片路径</span>
        <input type="text" name="pic" style="background-color:#fff" value=<%=spec.getPic()%> >
    <p align="center">
    <span>是否对外开放</span>
        <input type="text" name="state" style="background-color:#fff" value=<%=spec.getState()%> >
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
    <input type="reset" style="background-color:#fff" value="重写"></p>

</form>
<p align="center">
    <button onclick="window.location.href='modifyspecpic.jsp'">修改标本图片</button>
    <%--<a HREF="modifyspecpic.jsp">修改标本图片</a>--%>
</body>
</html>