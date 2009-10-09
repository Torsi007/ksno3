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
        <link rel="stylesheet" type="text/css" href="css/signUpConfirmed.css"/>
        <title>JSP Page</title>
    </head>
    <body class="course">
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <div>
                    <h1>Påmelding bekreftet</h1>
                    <p>Du har nå meldt deg på følgende kurs</p>
                    <b><t:outputText value="#{SignUpConfirmed_Backing.event.name} #{SignUpConfirmed_Backing.event.location}: #{SignUpConfirmed_Backing.event.startDate} - #{SignUpConfirmed_Backing.event.endDate}"/></b>
                    <p>En mail vil bli tilsendt mailadressen du registrerte under påmeldingen. Om du ikke har motatt denne i løpet av 2 timer, ta kontakt med oss på <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a>.</p>
                </div>
            </h:form> 
        </f:view>    
    </body>
</html>
