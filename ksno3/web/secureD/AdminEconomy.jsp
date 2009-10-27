<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

        <title>kitesurfing.no - administrer økonomi</title>
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
<jsp:include page="../Ending.jsp" ></jsp:include>
