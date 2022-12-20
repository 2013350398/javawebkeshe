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
    <title>修改单位信息</title>
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
            width: 80px;
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
        if(r.equals("teloremail")){%>
<script>window.alert("电话或邮箱格式非法或为空，请重新修改！");</script>
<%}    } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>

<body>
<%
    Unit unit;
    Object obj=session.getAttribute("allUnit");
    List<Unit> units=new ArrayList<>();
    for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
    int cnt;
    try{ cnt=Integer.valueOf(request.getParameter("cnt"));}
    catch(Exception e){cnt=(Integer)session.getAttribute("modifyunitcnt");}
    unit=units.get(cnt);
    int unid=Integer.valueOf(request.getParameter("id"));
    session.setAttribute("modifyunitcnt",cnt);
%>
<H1><font color="BLACK" align="center">管理员你好！详细注册信息如下，可在表单修改并提交</font></H1>
<form method="POST" action="/unit.do?method=updateUnit&id=<%=unid%>" >
    <p align="center">
        <span>单位名称</span>
        <input type="text" name="unname" style="background-color:#fff" value=<%=unit.getUnname()%> readonly="true">
    <p align="center">
        <span>联系人</span>
        <input type="text" name="linkman" style="background-color:#fff" value=<%=unit.getLinkman()%>>
    <p align="center">
        <span>联系电话</span>
        <input type="text" name="tel" style="background-color:#fff" value=<%=unit.getTel()%> >
    <p align="center">
        <span>邮箱地址</span>
        <input type="text" name="email" style="background-color:#fff" value=<%=unit.getEmail()%> >
    <p align="center">
        <span>联系地址</span>
        <input type="text" name="site" style="background-color:#fff" value=<%=unit.getSite()%> >
        <p align="center">
    <p align="center">
        <span>单位性质</span>
        <input type="radio" name="unittype" value="国家级单位"  checked="checked"> 国家级单位
        <input type="radio" name="unittype" value="省部级单位"> 省部级单位
        <input type="radio" name="unittype" value="市级单位"> 市级单位 </p>
    <p align="right">
        <ex1>(原先为<%=unit.getUnittype()%>)</ex1>
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>

</form>
</body>
</html>