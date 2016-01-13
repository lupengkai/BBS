<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/9/16
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("GBK");
    int pid = Integer.parseInt(request.getParameter("pid"));
    int rootId = Integer.parseInt(request.getParameter("rootid"));
    String title = request.getParameter("title");
    String content = request.getParameter("cont");
    content = content.replace("\n", "<br>");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/bbs?user=root&password=0715";
    Connection coon = DriverManager.getConnection(url);
    Statement stmt = coon.createStatement();
    String sql = "insert into article values(null, ?, ?, ?, ?, now(), 0)";
    PreparedStatement prestmt = coon.prepareStatement(sql);
    prestmt.setInt(1, pid);
    prestmt.setInt(2, rootId);
    prestmt.setString(3, title);
    prestmt.setString(4, content);

    coon.setAutoCommit(false);

    prestmt.executeUpdate();
    stmt.executeUpdate(" update article set isleaf = 1 WHERE id = " +pid);

    coon.commit();
    coon.setAutoCommit(true);

    stmt.close();
    prestmt.close();
    coon.close();

    response.sendRedirect("ShowArticleFlat.jsp");
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>

</body>
</html>
