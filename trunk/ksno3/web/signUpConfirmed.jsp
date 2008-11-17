<%-- 
    Document   : studentsAtCourse
    Created on : 13.nov.2008, 12:30:20
    Author     : tor.hauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/style.css"/> 
        <title>JSP Page</title>
    </head>
    <body>
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
               <t:outputText value="#{SignUpConfirmed_Backing.event.name} #{SignUpConfirmed_Backing.event.location}: #{SignUpConfirmed_Backing.event.startDate} - #{SignUpConfirmed_Backing.event.endDate}"/>
               <table>
                   <tr><td>Deltagere</td></tr>
                    <t:dataList value="#{SignUpConfirmed_Backing.event.participations}" var="participation">
                        <tr><td><t:outputText value="#{participation.participant.firstName} #{participation.participant.lastName}"/></td></tr>
                    </t:dataList>                    
                </table>
            </h:form> 
        </f:view>    
    </body>
</html>
