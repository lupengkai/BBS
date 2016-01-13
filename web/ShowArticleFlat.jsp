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


%>
<%
    int pageSize = 3;

    String strPageNo = request.getParameter("pageNo");
    int pageNo;
    if (strPageNo == null || strPageNo.equals("") ) {
        pageNo = 1;
    } else {
        try {
            pageNo = Integer.parseInt(strPageNo.trim());
            if (pageNo <= 0)
                pageNo = 1;
        } catch (NumberFormatException e) {
            pageNo = 1;
        }
    }



    String admin = (String)session.getAttribute("login");
    if (admin != null && admin.equals("true")) {
        login = true;
    }
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/bbs?user=root&password=0715";
    Connection coon = DriverManager.getConnection(url);
    Statement stmt = coon.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM article WHERE pid = 0");
    rs.next();
    int totalRecords = rs.getInt(1);
    int totalPages = totalRecords % pageSize == 0 ? totalRecords / pageSize : totalRecords / pageSize + 1;
    if(pageNo > totalPages)
        pageNo = totalPages;
    int startPos = (pageNo - 1) * pageSize;



    rs = stmt.executeQuery("select * from article WHERE pid=0 ORDER by pdate DESC " + " limit " + startPos + " , " + pageSize);
    String loginStr = "";

    while (rs.next()) {
        if (login) loginStr = "<td>" + "<a href = 'Delete.jsp?id=" + rs.getInt("id") +"&pid="+ rs.getInt("pid") + "'>" + "删除" + "</td>";
        str += "<tr>" +
                "<td>" + rs.getInt("id") + "</td>" +
                "<td>" + "<a href = 'ShowArticleDetail.jsp?id="+ rs.getInt("id")+"'>"+rs.getString("title") + " </a>" +"</td>" +
                loginStr +
                "</tr>";

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

<a href="Post.jsp">发帖</a>
<table border="1">
    <%= str%>
</table>

共 <%= totalPages%> 页 第 <%= pageNo%> 页

<a href="ShowArticleFlat.jsp?pageNo=<%= pageNo-1%>"> << </a>
<a href="ShowArticleFlat.jsp?pageNo=<%= pageNo+1%>"> >></a>

<form name="form1" onchange="document.form1.submit()">
    <select>
        <%
            for(int i = 1; i <= totalPages; i ++) {
        %>
                <option value="<%= i%>" <%= (i == pageNo)? "selected": ""%>>第<%= i%>页</option>
        <%
            }
        %>
    </select>
</form>

<form name="form2" action="ShowArticleFlat.jsp">
    <input type="text" size="4" name="pageNo" value="<%= pageNo%>">
    <input type="submit" value="提交">
</form>

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
//参数名空格， 0/O不同