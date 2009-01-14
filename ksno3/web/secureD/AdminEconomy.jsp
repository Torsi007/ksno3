<%-- 
    Document   : AdminMain
    Created on : 08.okt.2008, 19:09:49
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
            <h:form enctype="multipart/form-data">
                <h2>Welkommen til økonomi administrasjon</h2>
                <t:commandLink enabledOnUserRole="admin,internal" action="transactionsMaintain">Administrer transaksjoner</t:commandLink>                                
                <br/>
                <h:commandButton immediate="true" value="Avbryt" action="cancel" />    
            </h:form>        
        </f:view>
        
    </body>
</html>
