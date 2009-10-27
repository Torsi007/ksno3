<jsp:include page="../nd/Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<title>kitesurfing.no - oppdater text</title>
<script src="../resources/js/logic.js" type="text/javascript"></script>
</head>
<body class="yui-skin-sam">
    <f:view>
        <h:form id="course" onsubmit="return validate()">
            <h1>Oppdater tekst</h1>
            <table style="width:100%">
                <tr>
                    <td>Navn</td>
                    <td>
                        <t:outputText id="it1" value="#{TextModify.name}" />
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Overskrift</td>
                    <td required="true">
                        <t:inputText id="it2" value="#{TextModify.subject}" />
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td colspan="3">Text</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <t:inputTextarea required="true" value="#{TextModify.body}"  rows="15" cols="40" style="width: 100%"/>
                    </td>
                </tr>
            </table>
            <h:commandButton value="Lagre og avslutt" action="#{TextUpdate_Backing.update}" />
            <t:outputText binding="#{TextUpdate_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../nd/Ending.jsp" ></jsp:include>
