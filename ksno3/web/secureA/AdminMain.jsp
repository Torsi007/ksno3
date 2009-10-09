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
                <h2>Welcom to the page administration</h2>
                <t:commandLink enabledOnUserRole="admin,internal,authuser" action="articlesMaintain">Administrer artikler</t:commandLink>
                <br/>
                <t:commandLink visibleOnUserRole="admin,internal" action="articleCategories">Administrer kategorier</t:commandLink>
                <br/>
                <t:commandLink enabledOnUserRole="admin,internal,authuser" action="videosMaintain">Administrer videoer</t:commandLink>
                <br/>
                <t:commandLink visibleOnUserRole="admin,internal"  action="eventsMaintain">Administrer opplegg</t:commandLink>                
                <br/>
                <t:commandLink visibleOnUserRole="admin,internal" action="textsMaintain">Administrer tekster</t:commandLink>                
                <br/>
                <t:commandLink visibleOnUserRole="admin,internal" action="adminEconomy">Administrer økonomi</t:commandLink>                                
                <br/>
                <t:commandLink visibleOnUserRole="admin,internal" action="sendMail">Send mail</t:commandLink>                                
                <br/>                
                <t:commandLink visibleOnUserRole="admin,internal,authuser" action="preferences">Innstillinger</t:commandLink>
                <br/>
                <t:commandLink visibleOnUserRole="admin,internal" action="instructorProfile">Instruktørprofil</t:commandLink>
            </h:form>        
        </f:view>
        
    </body>
</html>
