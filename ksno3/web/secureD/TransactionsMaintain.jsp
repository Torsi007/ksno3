<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<title>kitesurfing.no - vedlikehold transaksjoner</title>
<script type="text/javascript">
    function toStartPage(){
        var currentLocation = window.location.href;
        var rootLocation = currentLocation.substring(0,currentLocation.indexOf("/faces/"));
        window.location = rootLocation;
    }
        
</script>
</head>
<body>
    <f:view>
        <h:form>
            <h:dataTable id="dt1" value="#{TransactionsMaintain_Backing.transactions}" binding="#{TransactionsMaintain_Backing.data}" var="item" first="0" width="100%">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Transaksjons Dato" />
                    </f:facet>
                    <t:outputText value="#{item.date}"><f:converter converterId="CalendarConverter"/></t:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Eier" />
                    </f:facet>
                    <h:outputText value="#{item.owner.firstName} #{item.owner.lastName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kategori" />
                    </f:facet>
                    <h:outputText value="#{item.category}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Beløp" />
                    </f:facet>
                    <h:outputText value="#{item.amount}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kommentar" />
                    </f:facet>
                    <h:outputText value="#{item.comment}"></h:outputText>
                </h:column>
                <h:column>
                    <h:outputLink type="external" rendered="#{item.image.url != Empty}"  value="#{item.image.url}">
                        <h:outputText value="image"/>
                    </h:outputLink>
                </h:column>
                <h:column>
                    <h:commandLink action="#{TransactionsMaintain_Backing.invoice}">
                        <h:outputText value="Faktura"/>
                    </h:commandLink>
                </h:column>
                <h:column>
                    <h:commandLink action="#{TransactionsMaintain_Backing.selectEditTransaction}">
                        <h:outputText value="Endre"/>
                    </h:commandLink>
                </h:column>
                <h:column>
                    <h:commandLink action="#{TransactionsMaintain_Backing.transactionDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </h:dataTable>
            <h:commandButton value="Ny transaksjon" action="transactionCreate"/>
            <t:outputText styleClass="errorMsg" binding="#{TransactionsMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
