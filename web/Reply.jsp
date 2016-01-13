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
    <script language="javascript">
        <!--
        function LTrim(str){
            var i;
            for(i=0;i<str.length; i++) {
                if(str.charAt(i)!=" ") break;
            }
            str = str.substring(i,str.length);
            return str;
        }

        function RTrim(str){
            var i;
            for(i=str.length-1;i>=0;i--){
                if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
            }
            str = str.substring(0,i+1);
            return str;
        }
        function Trim(str){

            return LTrim(RTrim(str));

        }

        function check() {
            if(Trim(document.reply.title.value) == "") {
                alert("please intput the title!");
                document.reply.title.focus();
                return false;
            }

            if(Trim(document.reply.cont.value) == "") {
                alert("plsease input the content!");
                document.reply.cont.focus();
                return false;
            }

            return true;

        }
        -->
    </script>
</head>
<body>
<form  name="reply" action="ReplyOK.jsp" method="post" onsubmit="check()">
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
