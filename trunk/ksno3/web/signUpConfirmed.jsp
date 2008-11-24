<%-- 
    Document   : studentsAtCourse
    Created on : 13.nov.2008, 12:30:20
    Author     : tor.hauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/style.css"/> 
        <title>JSP Page</title>
    </head>
    <body class="course">
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <div>
                    <h1><t:outputText value="#{SignUpConfirmed_Backing.event.name} #{SignUpConfirmed_Backing.event.location}: #{SignUpConfirmed_Backing.event.startDate} - #{SignUpConfirmed_Backing.event.endDate}"/></h1>		
                    <span>Deltagere</span>
                    <ul type="square" style="margin-top:0">	
                        <t:dataList value="#{SignUpConfirmed_Backing.event.participations}" var="participation">
                            <li><span><t:outputText value="#{participation.participant.firstName} #{participation.participant.lastName}"/></span></li>
                        </t:dataList>                    
                    </ul>
                </div>
            </h:form> 
        </f:view>    
    </body>
</html>
