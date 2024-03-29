<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<title>kitesurfing.no - administrasjon</title>
</head>
<body>
    <f:view>
        <h:form enctype="multipart/form-data">
            <h2>Welcom to the page administration</h2>
            <t:commandLink enabledOnUserRole="admin,internal,authuser, external" action="articlesMaintain">Administrer artikler</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="articleCategories">Administrer kategorier</t:commandLink>
            <br/>
            <t:commandLink enabledOnUserRole="admin,internal,authuser, external" action="videosMaintain">Administrer videoer</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal, external"  action="eventsMaintain">Administrer opplegg</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="textsMaintain">Administrer tekster</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="adminEconomy">Administrer økonomi</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="sendMail">Send mail</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal,authuser, external" action="preferences">Innstillinger</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="instructorProfile">Instruktørprofil</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="onDutysMaintain">Administrer vakter</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="workHoursMaintain">Registrer timer</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal" action="experienceLevelsMaintain">Administrer ferdighetsnivåer</t:commandLink>
            <br/>
            <t:commandLink visibleOnUserRole="admin,internal,authuser, external" action="participationAddInfo">Legg til deltagerinfo</t:commandLink>
        </h:form>
    </f:view>

</body>
<jsp:include page="../Ending.jsp" ></jsp:include>

