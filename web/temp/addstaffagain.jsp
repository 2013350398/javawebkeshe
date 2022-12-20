<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/23
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重新新建工作人员</title>

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
    </style>
</head>
<body>
<%--<h2 align="right">张昌含弘</h2>--%>
<H1><font color="BLACK" align="center">同名工作人员已存在，请重新输入详情信息</font></H1>
<jsp:include page="../addstaff.jsp" flush="true" />

</body>
</html>