<%--
  Created by IntelliJ IDEA.
  User: 20133
  Date: 2022/11/22
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%--不用了--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息更新失败</title>
    <style type="text/css">
        .center{
            text-align:center;
            margin-top: 50px;
        }
        .fon{
            font-size: 40px;
        }
        .fon1{
            font-size: 20px;
        }
        body{
            /* 加载背景图 */
            background: url("../images/flower1.jpg");
            /*background-size: 100% 100%;*/

            /* 背景图垂直、水平均居中 */
            background-position: center center;
            /* 背景图不平铺 */
            background-repeat: no-repeat;
            /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
            background-attachment: fixed;
            /* 让背景图基于容器大小伸缩 */
            background-size: cover;

        }
        input {
            background-color: transparent;
            outline: none;
            color: black;
        }
    </style>
</head>
<body>
<H1><font color="black" align="center">联系方式或邮箱格式非法，请重新输入！</font></H1>
<jsp:include page="../modifydetailinfo.jsp" flush="true" />
</body>
</html>
