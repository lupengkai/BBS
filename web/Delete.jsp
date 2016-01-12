<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/9/16
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="java.sql.*" %>
<%!
    private void del(Connection coon, int id) {
        try {
            Statement stmt = coon.createStatement();
            ResultSet rs= null;
            rs = stmt.executeQuery("SELECT * FROM article WHERE pid = " + id);
            while (rs.next()){
                del(coon, rs.getInt("id"));
            }

            stmt.executeUpdate("DELETE FROM article where id = " + id);
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>




<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<%
    String admin = (String)session.getAttribute("login");
    if (admin != null && admin.equals("true")) {
        int id = Integer.parseInt(request.getParameter("id"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/bbs?user=root&password=0715";
        Connection coon = DriverManager.getConnection(url);
        coon.setAutoCommit(false);
        del(coon, id);
        Statement stmt = coon.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM article where id = " + pid);
        rs.next();
        int childNum = rs.getInt(1);
        if (childNum <= 0) {
            stmt.executeUpdate("UPDATE article set isleaf = 0 WHERE id = " + pid);
        }

        coon.setAutoCommit(true);
        rs.close();
        stmt.close();
        coon.close();
        response.sendRedirect("ShowArticleTree.jsp");
    } else {
        out.println("hehe");
    }
%>
</body>
</html>
