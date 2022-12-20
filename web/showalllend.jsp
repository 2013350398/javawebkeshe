<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/25
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Borrow" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>标本借阅列表</title>
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
            width :100%;
            align:center;
            cellpadding:15px;/*设置单元格内容与单元格边框之间的空白间距*/
            /*自动拉伸*/
            table-layout:auto;
            width:800px;
            /*边框*/
            width:900px;
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
    if(flag==0){
        if(r.equals("return")){%>
<script>window.alert("成功提交归还申请！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<H1><font color="black" align="center">您好，查询到您的标本借阅情况如下：</font></H1>
<p align="center">
<table>
    <tr>
        <td>序号</td>
        <td>标本编号</td>
        <td>标本所属单位</td>
        <td>借阅账户</td>
        <td>借阅人</td>
        <td>借阅理由</td>
        <td>状态</td>
        <br>
    </tr>
    <%--已借出--%>
    <%int cnt=0;
        try{
        Object obj1=session.getAttribute("allLendf");//已借出--归还
        List<Borrow> b1=new ArrayList<>();
        for (Object o: (List<?>) obj1){ b1.add(Borrow.class.cast(o)); }
        session.setAttribute("allLendchange",b1);
        for (Borrow bb:b1){
            System.out.println(bb.toString());
        }
        for (Borrow u:b1){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getSid()%></td>
        <td><%=u.getUnit()%></td>
        <td><%=u.getUid()%></td>
        <td><%=u.getBorrowman()%></td>
        <td><%=u.getReason()%></td>
        <td><%=u.getSite()%></td>
        <td class="text-center">
            <button onclick="window.location.href='/borrow.do?method=updateBorrow&cnt=<%=cnt%>&site=归还'">归还</button>
        </td>
        <br>
        <%cnt++;%>
    </tr>
    <%} } catch(Exception e){}%>
    <%--归还--待确认--%>
    <%try{
            Object obj4=session.getAttribute("allLendfo");//已结束
            List<Borrow> b4=new ArrayList<>();
            for (Object o: (List<?>) obj4){ b4.add(Borrow.class.cast(o));}
            for (Borrow u:b4){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getSid()%></td>
        <td><%=u.getUnit()%></td>
        <td><%=u.getUid()%></td>
        <td><%=u.getBorrowman()%></td>
        <td><%=u.getReason()%></td>
        <td>待确认归还</td>
        <br>
        <%cnt++;%>
    </tr>
    <%} } catch(Exception e){}%>
    <%--已结束--%>
    <%try{
        Object obj2=session.getAttribute("allLends");//已结束
        List<Borrow> b2=new ArrayList<>();
        for (Object o: (List<?>) obj2){ b2.add(Borrow.class.cast(o));}
        for (Borrow u:b2){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getSid()%></td>
        <td><%=u.getUnit()%></td>
        <td><%=u.getUid()%></td>
        <td><%=u.getBorrowman()%></td>
        <td><%=u.getReason()%></td>
        <td><%=u.getSite()%></td>
        <br>
        <%cnt++;%>
    </tr>
    <%} } catch(Exception e){}%>
    <%--待审核--%>
    <%try{
        Object obj3=session.getAttribute("allLendt");//待审核
        List<Borrow> b3=new ArrayList<>();
        for (Object o: (List<?>) obj3){ b3.add(Borrow.class.cast(o)); }
        for (Borrow u:b3){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getSid()%></td>
        <td><%=u.getUnit()%></td>
        <td><%=u.getUid()%></td>
        <td><%=u.getBorrowman()%></td>
        <td><%=u.getReason()%></td>
        <td><%=u.getSite()%></td>
        <br>
        <%cnt++;%>
    </tr>
    <%} } catch(Exception e){}
    %>
</table>
</body>
</html>

