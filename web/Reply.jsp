<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/9/16
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%
    int pid = Integer.parseInt(request.getParameter("id"));
    int rootId = Integer.parseInt(request.getParameter("rootid"));
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<form action="ReplyOK.jsp" method="post">
    <input type="hidden" name="pid" value="<%= pid%>">
    <input type="hidden" name="rootid" value="<%= rootId%>">
    <table>
        <tr><td>
            <input type="text" name="title" size="80">
        </td></tr>
        <tr><td>
            <textarea cols="80" rows="20" name="cont"></textarea>
        </td></tr>
        <tr><td>
            <input type="submit" value="提交">
        </td></tr>
    </table>
</form>
</body>
</html>
