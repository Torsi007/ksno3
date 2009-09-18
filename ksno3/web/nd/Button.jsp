<%-- 
    Document   : button
    Created on : 23.aug.2009, 00:05:56
    Author     : Roger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table class="button" style="width:<%= request.getParameter("width")%>px">
    <tr>
        <td class="left"></td>
        <td><a href="<%= request.getParameter("link")%>"><%= request.getParameter("title")%></a></td>
        <td class="right"></td>
    </tr>
</table>
