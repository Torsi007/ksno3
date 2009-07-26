<%-- 
    Document   : youtubevideoupload
    Created on : 25.jul.2009, 19:20:04
    Author     : Roger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="<%= request.getParameter("url") %>?nexturl=http://example.com" method ="post" enctype="multipart/form-data">
            <input type="file" name="file"/>
            <input type="hidden" name="token" value="token_value"/>
            <input type="submit" value="go" />
        </form>
    </body>
</html>



