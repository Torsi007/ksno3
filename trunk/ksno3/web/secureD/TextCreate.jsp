<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   


<title>kitesurfing.no - opprett tekst</title>
<script src="${request.contextPath}/resources/js/logic.js" type="text/javascript"></script>
</head>
<body>
    <f:view>
        <h:form id="text" onsubmit="return validate()">
            <h1>Nytt kurs</h1>
            <p>Du er i ferd med å opprette et nytt kurs</p>
            <table>
                <tr>
                    <td>Navn</td>
                    <td required="true">
                        <t:inputText id="it1" binding="#{TextCreate_Backing.name}" />
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Overskrift</td>
                    <td required="true">
                        <t:inputText id="it2" binding="#{TextCreate_Backing.subject}" />
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td colspan="3">Text</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <t:inputTextarea required="true"  binding="#{TextCreate_Backing.body}"  rows="4" cols="40" style="width: 100%"/>
                    </td>
                </tr>
            </table>
            <h:commandButton value="Lagre og avslutt" action="#{TextCreate_Backing.createText}" />
            <t:outputText binding="#{TextCreate_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
