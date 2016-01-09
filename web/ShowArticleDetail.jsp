<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/9/16
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String strId = request.getParameter("id");
    int id = Integer.parseInt(strId);
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/bbs?user=root&password=0715";
    Connection coon = DriverManager.getConnection(url);
    Statement stmt = coon.createStatement();
    ResultSet rs = stmt.executeQuery("select * from article WHERE id=" + id);


%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<%
    if (rs.next()) {
%>
<table border="1">
    <tr>
        <td>ID</td>
        <td><%= rs.getInt("id")%>
        </td>
    </tr>
    <tr>
        <td>Title</td>
        <td><%= rs.getString("title")%>
        </td>
    </tr>
    <tr>
        <td>Content</td>
        <td><%= rs.getString("cont")%>
        </td>
    </tr>
</table>
<a href="Reply.jsp?id=<%= rs.getInt("id")%>&rootid=<%= rs.getInt("rootid")%>">Reply</a>
<%
    }
%>

<%
    rs.close();
    stmt.close();
    coon.close();
%>

</body>
</html>
