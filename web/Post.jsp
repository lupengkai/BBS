
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.spi.ResolveResult" %>
<%
    String str = request.getParameter("action");
    if (str != null) {
        request.setCharacterEncoding("GBK");
        String title = request.getParameter("title");
        String content = request.getParameter("cont");
        content = content.replace("\n", "<br>");
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/bbs?user=root&password=0715";
        Connection coon = DriverManager.getConnection(url);

        coon.setAutoCommit(false);

        Statement stmt = coon.createStatement();
        String sql = "insert into article values(null, 0, ?, ?, ?, now(), 0)";

        PreparedStatement prestmt = coon.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        prestmt.setInt(1, -1);
        prestmt.setString(2, title);
        prestmt.setString(3, content);



        prestmt.executeUpdate();


        ResultSet rsKeys = prestmt.getGeneratedKeys();
        rsKeys.next();


        int key = rsKeys.getInt(1);
        rsKeys.close();

        stmt.executeUpdate(" UPDATE article SET rootid = " + key + " where id = " + key);

        coon.commit();
        coon.setAutoCommit(true);

        stmt.close();
        prestmt.close();
        coon.close();

        response.sendRedirect("ShowArticleTree.jsp");
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>



<form action="Post.jsp" method="post">
    <input type="hidden" name="action" value="post">
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

//SQL语句注意加空格