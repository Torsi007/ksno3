<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   


<title>kitesurfing.no - mail</title>
<script src="../resources/js/logic.js" type="text/javascript"></script>
</head>
<body>
    <f:view>
        <h:form id="text" onsubmit="return validate()">
            <t:selectOneMenu  id="courses" binding="#{SendMail_Backing.coursesSelect}">
                <f:selectItems value="#{SendMail_Backing.courses}"/>
            </t:selectOneMenu>
            <h:commandButton id="filter" value="Sett filter" action="#{SendMail_Backing.filter}" />
            <h:dataTable  id="dt1" value="#{SendMail_Backing.recipients}" binding="#{SendMail_Backing.dataRecipients}" var="item" first="0" width="100%">
                <h:column>
                    <f:facet name="f1">
                        <h:outputText value="Etternavn" />
                    </f:facet>
                    <h:outputText value="#{item.lastName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Fornavn" />
                    </f:facet>
                    <h:outputText value="#{item.firstName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Email" />
                    </f:facet>
                    <h:outputText value="#{item.userName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Send mail" />
                    </f:facet>
                    <h:selectBooleanCheckbox value="#{item.uiSendMail}"/>
                </h:column>
            </h:dataTable>
            Send private mails: <t:selectBooleanCheckbox binding="#{SendMail_Backing.induvidualMails}"/>
            Overskrift
            <t:inputText binding="#{SendMail_Backing.subject}" />
            Innhold
            <t:inputTextarea binding="#{SendMail_Backing.body}"  rows="4" cols="40" style="width: 100%"/>
            <h:commandButton value="Send" action="#{SendMail_Backing.send}" />
            <t:outputText binding="#{SendMail_Backing.errorMsg}"/>
            <t:outputText binding="#{SendMail_Backing.confirmMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
