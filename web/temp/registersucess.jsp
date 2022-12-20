<%@ page import="com.zc.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
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
            width: 50px;
            vertical-align: top;
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==0){
        if(r.equals("register")){%>
<script>window.alert("用户注册成功，请设置密码！");</script>
<%}    } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>

<%User u=(User)session.getAttribute("user");%>
<H1><font color="black" align="center"><%=u.getUsername()%>欢迎您！</font></H1>
<h2 align="right">
    <a HREF="../modifydetailinfo.jsp"><%=u.getUsername()%></a>
    <%--<jsp:include page="showall.jsp" flush="true" />--%>
</h2>
<p align="right">
    <a HREF="../modifypassword.jsp">密码重置</a>
<p align="center">
    <a HREF="../showallspec.jsp">查看标本</a>

</body>
</html>
