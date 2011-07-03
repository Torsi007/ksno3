<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/signUpConfirmed.css"/>
        <title>kitesurfing.no - p�melding sommerkurs</title>
    </head>
    <jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
    <body class="course">
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <div>
                    <h1>P�melding bekreftet</h1>
                    <p>Du har n� meldt deg p� f�lgende kurs</p>
                    <b><t:outputText value="#{SignUpConfirmed_Backing.event.name} #{SignUpConfirmed_Backing.event.location}: #{SignUpConfirmed_Backing.event.startDate} - #{SignUpConfirmed_Backing.event.endDate}"/></b>
                    <p>En mail vil bli tilsendt mailadressen du registrerte under p�meldingen. Om du ikke har motatt denne i l�pet av 2 timer, ta kontakt med oss p� <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a>.</p>
                </div>
            </h:form> 
        </f:view>    
    </body>
<jsp:include page="Ending.jsp" ></jsp:include>

