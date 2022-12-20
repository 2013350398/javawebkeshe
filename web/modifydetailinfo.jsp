<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.zc.pojo.Unit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>详细信息页面</title>

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
    if(flag==1&&r.equals("telormail")){%>
<script>window.alert("电话或邮箱格式非法或为空，请重新修改！");</script>
<%} }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<%
    User user;
    List<User> users=new ArrayList<>();
    try{//admin
        Object obj=session.getAttribute("allUser");
        for (Object o: (List<?>) obj){ users.add(User.class.cast(o)); }
        int cnt=Integer.valueOf(request.getParameter("cnt"));
        user=users.get(cnt);
        session.setAttribute("userin",user);//因为user是admin
    }
    catch (Exception e){//工作人员
        user=(User)session.getAttribute("user");
    }
    String id=request.getParameter("id");
    List<Unit> units=new ArrayList<>();
    try{
        Object objun=session.getAttribute("allUnit");
        for (Object o: (List<?>) objun){ units.add(Unit.class.cast(o)); }
    }
    catch(Exception e){}
%>
<H1><font color="BLACK" align="left">详细注册信息如下，可在表单修改并提交</font></H1>
<form method="POST" action="/user.do?method=updateUser" >
    <p align="center">
        <span>用户名</span>
        <input type="text" name="username" style="background-color:#fff" value=<%=user.getUsername()%> readonly="true"><%--设置用户名不可以修改--%>
    <p align="center">
        <span>真实姓名</span>
        <input type="text" name="realname" style="background-color:#fff" value=<%=user.getRealname()%>>
    <p align="center">
        <span>联系电话</span>
        <input type="text" name="tel" style="background-color:#fff" value=<%=user.getTel()%> >
    <p align="center">
        <span>邮箱</span>
        <input type="text" name="email" style="background-color:#fff" value=<%=user.getEmail()%> >
    <p align="center">
        <span>住址</span>
        <input type="text" name="home" style="background-color:#fff" value=<%=user.getHome()%> >
    <p align="center">
        <span>性别</span>
        <input type="radio" name="sexy" value="男"  checked="checked"> 男
        <input type="radio" name="sexy" value="女"> 女<br>
        <ex1>原性别为：<%=user.getSexy()%></ex1>
    <p align="center">
        <span>密保问题答案</span>
        <input type="text" name="answer" style="background-color:#fff" value=<%=user.getAnswer()%> >
    <%if(user.getState().equals("工作人员")){%>
    <p align="center">
        <span>工作单位</span>
        <select name="unitname">
            <%for (Unit un:units){%>
            <option value="<%=un.getUnname()%>"><%=un.getUnname()%></option>
            <%}%>
        </select>
    <%}%>
    <p align="center">
        <input type="submit" style="background-color:#fff" value="提交">
        <input type="reset" style="background-color:#fff" value="重写"></p>
</form>
<p align="center">
    <button onclick="window.location.href='modifyheadpic.jsp'">修改头像</button>
</body>
</html>

<!-- file元素不允许有默认值 -->
<%--<INPUT TYPE="file" NAME="pictureLocation" ></p>--%>

<%--<input type="text" name="sexy" style="background-color:#fff" value=<%=user.getSexy()%> >--%>