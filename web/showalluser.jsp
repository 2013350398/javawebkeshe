<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zc.pojo.User" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>用户表单</title>
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
        table {
            border-collapse: separate;
            border-spacing:5px 10px;
            width:1200px;
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
        h1{
            font-weight: bold;
            color: black;
            font-size: 30px;
            font-family: YouYuan;
            border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/
        }
    </style>
</head>
<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("userdel")){%>
<script>window.alert("当前用户借阅标本未归还，不可删除！");</script>
<%      }
}else if(flag==0){
        if(r.equals("userdel")){
            %>
<script>window.alert("用户删除成功！");</script>
<%}else if(r.equals("userupdate")){%>
<script>window.alert("用户信息修改成功！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<%//获取用户列表
    Object obj=session.getAttribute("allUser");
    List<User>users=new ArrayList<>();
    for (Object o: (List<?>) obj){ users.add(User.class.cast(o)); }
%>
<body>
<H1><font color="black" align="center">您好，用户列表如下：</font></H1>
<p align="center">
<table>
<tr>
    <td>序号</td>
    <td>用户名</td>
    <td>用户身份</td>
    <td>邮箱地址</td>
    <td>手机号码</td>
    <td>所属单位</td>
    <td>最后登录时间</td>
    <br>
</tr>

<%
    int cnt=0;
    for (User u:users){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getUsername()%></td>
        <td><%=u.getState()%></td>
        <td><%=u.getEmail()%></td>
        <td><%=u.getTel()%></td>
        <td><%=u.getUnitname()%></td>
        <td><%=u.getLasttime()%></td>
        <td class="text-center">
            <button onclick="window.location.href='showuserdetailinfo.jsp?cnt=<%=cnt%>'">详情</button>
            <button onclick="window.location.href='modifydetailinfo.jsp?cnt=<%=cnt%>'">修改</button>
            <button onclick="window.location.href='/user.do?method=deleteUser&id=<%=u.getUid()%>'">删除</button>
        </td>
        <br>
        <%cnt++;%>
    </tr>
<%}%>
</table>
</body>
</html>
