<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
  <%--<head>--%>
    <%--<title>$Title$</title>--%>
  <%--</head>--%>
  <%--<body>--%>
  <%--$END$--%>
  <%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>工作人员主页面</title>
  <%--<style type="text/css">--%>
    <%--body{--%>
      <%--/*text-align:center;字体居中对齐*/--%>
      <%--background-color:#e7dad2;--%>
      <%--/*ffbe7a  */--%>
      <%--/*background: url("./images/flower1.jpg");*/--%>
      <%--background-position: center center;--%>
      <%--background-repeat: no-repeat;--%>
      <%--background-attachment: fixed;--%>
      <%--background-size: cover;--%>
      <%--color: black;--%>
      <%--font-weight: bold;--%>
      <%--font-family: YouYuan;--%>
      <%--color: #de07f5;--%>
    <%--}--%>
    <%--h1{--%>
      <%--font-weight: bold;--%>
      <%--color: black;--%>
      <%--font-size: 50px;--%>
      <%--font-family: YouYuan;--%>
      <%--border-left: 5px solid #c497b2; /*只有左侧的紫色边缘框*/--%>
    <%--}--%>

    <%--.p1 {--%>
      <%--/*边框*/--%>
      <%--width:100px;--%>
      <%--padding:8px;--%>
      <%--border: 5px #beb8dc;--%>
      <%--font-weight: bold;--%>
      <%--font-family: YouYuan;--%>
      <%--align:center;--%>
    <%--}--%>
    <%--/*show的时候用*/--%>
    <%--img {--%>
      <%--width: 25%;--%>
      <%--border-radius: 10px;--%>
      <%--float: left;--%>
      <%--margin: 10px;--%>
    <%--}--%>
    <%--input {--%>
      <%--font-weight: bold;--%>
      <%--background-color: transparent;--%>
      <%--outline: none;--%>
      <%--color: black;--%>
      <%--font-family: YouYuan;--%>
    <%--}--%>
    <%--button{--%>
      <%--/*边框*/--%>
      <%--width:250px;--%>
      <%--padding:8px;--%>
      <%--outline:5px solid #c497b2;--%>
      <%--/*beb8dc*/--%>
      <%--border-radius: 15px; /* 边框圆角 */--%>
      <%--border: 5px dotted #beb8dc; /* 上下左右都相同 直角边框*/--%>
      <%--/*字体*/--%>
      <%--font-weight: bold;--%>
      <%--font-family: YouYuan;--%>
      <%--font-size:18px;--%>
      <%--color: black;--%>
    <%--}--%>
  <style type="text/css">
    center{
      text-align:center;
      margin-top: 50px;
    }
    input {
      border:0px;
      outline:none;
      background-color:#DA70D6;
      color:black;
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
      background-color: transparent;
      outline: none;
      color: black;
      font-weight: bold;
      font-family: YouYuan;
      font-size:20px;
      color: black;
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
      font-size: 50px;
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
      /*边框*/
      width:200px;
      padding:8px;
      border: 2px dotted #beb8dc;
      outline:2px solid #c497b2;
      /*border-radius: 15px; !* 边框圆角 *!*/
      font-size: 20px;
      color: black;
      font-weight: bold;
      font-family: YouYuan;
    }
  </style>
</head>
<body><p align="center">
<span>近年借阅情况统计</span><p align="center">
<span>近年借阅情况统计</span><p align="center">
  <span>近年借阅情况统计</span><p align="center">
  <span>近年借阅情况统计</span>
<%--<H1 align="left">欢迎您！</H1>--%>
<%--<p align="center">--%>
  <%--<form method="post" action="/spec.do?method=selectOthersSpec">--%>
<%--<p align="center">--%>
  <%--<input type="text" style="background-color:#fff" name="info" value="请输入标本相关信息进行检索">   <input type="submit" style="background-color:#fff" value="查询">--%>
<%--<p align="center">--%>
    <%--<span >查询依据</span>--%>
    <%--<input type="radio" name="selecttype" value="sname"  checked="checked"> 标本名称--%>
    <%--<input type="radio" name="selecttype" value="site"> 出土地点--%>
    <%--<input type="radio" name="selecttype" value="material"> 标本材质--%>
    <%--<input type="radio" name="selecttype" value="unitname"> 所属单位名称 </p>--%>
<%--</form>--%>
<%--<table>--%>
  <%--<tr>--%>
    <%--<td>序号</td>--%>
    <%--<td>标本编号</td>--%>
    <%--<td>标本所属单位</td>--%>
    <%--<td>借阅账户</td>--%>
    <%--<td>借阅人</td>--%>
    <%--<td>借阅理由</td>--%>
    <%--<td>状态</td>--%>
    <%--<br>--%>
  <%--</tr>--%>
  <%--<%--%>
    <%--int cnt=0;--%>
    <%--for (int i=0;i<10;i++){--%>
<%--%>--%>
  <%--<tr>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td><%=cnt+1%></td>--%>
    <%--<td class="text-center">--%>
      <%--<button onclick="window.location.href='/unit.do?method=choseUnit'">审核通过</button>--%>
    <%--</td>--%>
    <%--<td class="text-center">--%>
      <%--<button onclick="window.location.href='/unit.do?method=choseUnit'">审核不通过</button>--%>
    <%--</td>--%>
    <%--<br>--%>
    <%--<%cnt++;--%>
    <%--}%>--%>
  <%--</tr>--%>
<%--</table>--%>

<%--&lt;%&ndash;功能按钮&ndash;%&gt;--%>
<%--<h2 align="right"/>--%>
<%--<button class="p1" onclick="window.location.href='modifydetailinfo.jsp'">姓名</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='addspec.jsp'">新建标本</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='excelroad.jsp'">从excel导入标本</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='/spec.do?method=allSpec'">显示本单位所有标本</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='/spec.do?method=showOthers'">查看其它单位标本</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='/borrow.do?method=allBorrow'">处理借阅申请</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='/borrow.do?method=OtherBorrow'">查看借阅进度</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='/borrow.do?method=sum'">单位标本统计分析</button>--%>
<%--<p align="center">--%>
  <%--<button onclick="window.location.href='modifypassword.jsp'">密码重置</button>--%>

</body>
</html>
