<%-- 
    Document   : AdminArticles
    Created on : 28.sep.2008, 13:19:26
    Author     : halsnehauge
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
                    <t:dataList value="#{AdminArticle_Backing.articles}" var="article">
                        <tr><td><t:outputText value="#{article.name}"/></td></tr>
                    </t:dataList>                    
                </table>
                <h:commandButton value="Lag ny artikkel" action="CreateArticle" />                                                                
            </h:form>        
        </f:view>
    </body>
</html>
