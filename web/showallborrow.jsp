<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/25
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zc.pojo.Borrow" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>标本借阅处理</title>

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
            cellpadding:15px;/*设置单元格内容与单元格边框之间的空白间距*/
            width :100%;
            align:center;
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
    if(flag==1){
        if(r.equals("hadborrow")){%>
<script>window.alert("审核通过失败！该标本已被借出，不可重复借出！");</script>
<%}}else if(flag==0){
    if(r.equals("refuse")){%>
<script>window.alert("拒绝借阅成功");</script>
<%}if(r.equals("finish")){%>
<script>window.alert("审批成功，已归还！");</script>
<%}if(r.equals("borrowsucess")){%>
<script>window.alert("审批成功，已借出！");</script>
<%} } }//try
catch(Exception e){}
    session.setAttribute("opra",-1);
    session.setAttribute("reason","null");%>
<body>
<H1><font color="black" align="center">您好，查询到本单位的标本借阅情况如下：</font></H1>
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
    <%--待审核--%>
    <%int cnt=0;
        List<Borrow> b1=new ArrayList<>();
        try{//获取用户列表
        Object obj1=session.getAttribute("allBorrowf");
        for (Object o: (List<?>) obj1){ b1.add(Borrow.class.cast(o)); }
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
            <button onclick="window.location.href='/borrow.do?method=updateBorrow&cnt=<%=cnt%>&site=审核通过'">审核通过</button>
            <button onclick="window.location.href='/borrow.do?method=updateBorrow&cnt=<%=cnt%>&site=审核不通过'">审核不通过</button>
        </td>
        <br>
        <%cnt++;%>
    </tr>
    <%} } catch(Exception e){}%>
    <%--归还--%>
    <%try{
        Object obj4=session.getAttribute("allBorrowfo");
        List<Borrow> b4=new ArrayList<>();
        for (Object o: (List<?>) obj4){ b4.add(Borrow.class.cast(o)); }
        for (Borrow u:b4){%>
    <tr>
        <td><%=cnt+1%></td>
        <td><%=u.getSid()%></td>
        <td><%=u.getUnit()%></td>
        <td><%=u.getUid()%></td>
        <td><%=u.getBorrowman()%></td>
        <td><%=u.getReason()%></td>
        <td><%=u.getSite()%></td>
        <td class="text-center">
            <button onclick="window.location.href='/borrow.do?method=updateBorrow&cnt=<%=cnt%>&site=已归还'">已归还</button>
        </td>
        <br>
        <%cnt++;
        b1.add(u);//整合到一起
        %>
    </tr>
    <%} } catch(Exception e){}
    session.setAttribute("allBorrow",b1);
    %>
    <%--待归还--%>
    <%try{
        Object obj2=session.getAttribute("allBorrows");
        List<Borrow> b2=new ArrayList<>();
        for (Object o: (List<?>) obj2){ b2.add(Borrow.class.cast(o)); }
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
    <%--已结束--%>
    <%try{
        Object obj3=session.getAttribute("allBorrowt");
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
    <%} } catch(Exception e){}%>
</table>
</body>
</html>

