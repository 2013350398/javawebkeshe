<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Spec" %>
<%@ page import="com.zc.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>其他单位标本表单</title>
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

<%try{
    String r=(String)session.getAttribute("reason");
    int flag=(Integer)session.getAttribute("opra");
    if(flag==1){
        if(r.equals("sendborrowagain")){%>
<script>window.alert("借阅申请失败！您已经提交该标本的借阅申请，不能再提交！请等待审核通过或您归还之后再次提交。");</script>
<%} else if(r.equals("otherlend")){%>
<script>window.alert("借阅申请失败，该标本已被借阅！");</script>
<%}}else if(flag==0){
    if(r.equals("sendborrowsucess")){%>
<script>window.alert("申请借阅成功！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>

<body>
<form method="post" action="/spec.do?method=selectOthersSpec">
    <p align="center">
        <input type="text" style="background-color:#fff" name="info" value="请输入标本相关信息进行检索">   <input type="submit" style="background-color:#fff" value="查询">
    <p align="center">
        <label >查询依据
        <input type="radio" name="selecttype" value="sname"  checked="checked"> 标本名称
        <input type="radio" name="selecttype" value="site"> 出土地点
        <input type="radio" name="selecttype" value="material"> 标本材质
        <input type="radio" name="selecttype" value="unitname"> 所属单位名称 </label></p>
</form>
<%
    //获取标本列表
    Object obj=session.getAttribute("otherSpec");
    List<Spec>specs=new ArrayList<>();
    for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
%>
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
            <button onclick="window.location.href='showspecdetailinfo.jsp?cnt=<%=cnt%>&type=1'">详情</button>
            <button onclick="window.location.href='borrowinfo.jsp?cnt=<%=cnt%>'">借阅</button>
        </td>
        <br>
        <%cnt++;%>
    </tr>
    <%}%>
</table>
</body>
</html>
