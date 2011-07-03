<jsp:include page="Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/signUpConfirmed.css"/>
<title>kitesurfing.no - påmelding vinterkurs</title>
</head>
<jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
<body class="course">
    <f:view>
        <h:form id="signup" onsubmit="return validate()">
            <div>
                <h1>Påmelding registrert</h1>
                <p>Vi har mottatt din foresørsel angående kurs</p>
                <b><t:outputText value="#{SignUpConfirmed_Backing.event.name} #{SignUpConfirmed_Backing.event.location}: #{SignUpConfirmed_Backing.event.startDate} - #{SignUpConfirmed_Backing.event.endDate}"/></b>
                <p>Du vil motta en kopi av bestillingsmailen vi sender til Haukeliseter, om resepsjonen ikke kontakter deg innen 2 dager anbefaler vi at du ringer resepsjonen på telefon: 350 62 777.</p>
            </div>
        </h:form>
    </f:view>
</body>

<jsp:include page="Ending.jsp" ></jsp:include>






