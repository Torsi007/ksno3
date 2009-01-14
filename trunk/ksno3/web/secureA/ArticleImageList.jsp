<%-- 
    Document   : ArticleImageList
    Created on : 10.jan.2009, 18:54:39
    Author     : tor.hauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <f:view>
            <h:form>        
                <table>
                    <t:dataList value="#{ArticleModify.images}" var="img">
                        <tr><td><t:graphicImage url="#{img.name}" height="80"/></td><td>..<t:outputText value="#{img.name}"/></td></tr>
                    </t:dataList>                    
                </table>
            </h:form>        
        </f:view>
</html>
