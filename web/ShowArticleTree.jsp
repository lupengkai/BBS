<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/9/16
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="gbk" %>
<%@ page import="java.sql.*" %>
<%!
    String str ="";
    boolean login = false;
    private void tree(Connection coon, int id, int level) {
        Statement stmt = null;
        ResultSet rs = null;
        String prestr = "";
        for (int i = 0; i < level; i++) {
            prestr += "----";
        }
        try{
            stmt = coon.createStatement();
            String sql = "select * from article where pid =" + id;
            rs = stmt.executeQuery(sql);
            String loginStr = "";

            while (rs.next()) {
                if (login) loginStr = "<td>" + "<a href = 'Delete.jsp?id=" + rs.getInt("id") +"&pid="+ rs.getInt("pid") + "'>" + "ɾ��" + "</td>";
                str += "<tr>" +
                        "<td>" + rs.getInt("id") + "</td>" +
                        "<td>" +
                        prestr +
                        "<a href = 'ShowArticleDetail.jsp?id=" + rs.getInt("id") + "' >"
                        + rs.getString("title") +
                        " </a>" +
                        "</td>" +
                        loginStr +
                        "</tr>";
                if (rs.getInt("isleaf") != 0) {
                    tree(coon, rs.getInt("id"), level+1);

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

%>
<%
    String admin = (String)session.getAttribute("login");
    if (admin != null && admin.equals("true")) {
        login = true;
    }
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/bbs?user=root&password=0715";
    Connection coon = DriverManager.getConnection(url);
    Statement stmt = coon.createStatement();
    ResultSet rs = stmt.executeQuery("select * from article WHERE pid=0");
    String loginStr = "";

    while (rs.next()) {
        if (login) loginStr = "<td>" + "<a href = 'Delete.jsp?id=" + rs.getInt("id") +"&pid="+ rs.getInt("pid") + "'>" + "ɾ��" + "</td>";
        str += "<tr>" +
                "<td>" + rs.getInt("id") + "</td>" +
                "<td>" + "<a href = 'ShowArticleDetail.jsp?id="+ rs.getInt("id")+"'>"+rs.getString("title") + " </a>" +"</td>" +
                loginStr +
                "</tr>";
        if (rs.getInt("isleaf") != 0) {
            tree(coon, rs.getInt("id"), 1);

        }
    }

    rs.close();
    stmt.close();
    coon.close();
%>


<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="gbk">
    <title></title>
</head>
<body>

<a href="Post.jsp">����</a>
<table border="1">
    <%= str%>
</table>

<%
    str = "";
    login=false;
%>

</body>












<%--<table border="1">
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id")%></td>
        <td><%= rs.getString("cont")%></td>
    </tr>
    <%
        }
    %>
</table>--%>

</html>
