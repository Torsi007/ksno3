<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <f:view>
            <h1><h:outputText value="JavaServer Faces1dsfsd" /></h1>
            <h:form>
                <h:dataTable cellpadding="0" cellspacing="0" value="#{Main_Backing.persons}" var="person">
                    <h:column><h:outputText value="#{person.firstName}"/></h:column>
                </h:dataTable>    
 </h:form>

        </f:view>
    </body>
</html>
