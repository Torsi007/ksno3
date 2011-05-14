<jsp:include page="../Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<title>kitesurfing.no - administrer ferdighetsnivåer</title>

</head>
<body>
    <f:view>
        <h:form>
            <H1>Administrer ferdighetsnivåer</H1>
            <h:dataTable id="dt1" value="#{ExperienceLevelsMaintain_Backing.experienceLevels}" binding="#{ExperienceLevelsMaintain_Backing.data}" var="item" first="0" width="10">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Prioritet" />
                    </f:facet>
                    <h:inputText value="#{item.rank}"></h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kategori" />
                    </f:facet>
                    <h:inputText value="#{item.name}"></h:inputText>
                </h:column>
                <h:column>
                    <h:commandLink action="#{ExperienceLevelsMaintain_Backing.ExperienceLevelDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </h:dataTable>
            <hr/>
            <table>
                <tr>
                    <td>
                        <t:inputText binding="#{ExperienceLevelsMaintain_Backing.newRank}"></t:inputText>
                    </td>
                    <td>
                        <t:inputText binding="#{ExperienceLevelsMaintain_Backing.newName}"></t:inputText>
                    </td>
                    <td>
                        <t:commandButton value="Opprett ny" action="#{ExperienceLevelsMaintain_Backing.ExperienceLevelCreate}"/>
                    </td>
                </tr>
            </table>
            <t:commandButton value="Lagre" action="#{ExperienceLevelsMaintain_Backing.ExperienceLevelsUpdate}"/>
            <t:outputText styleClass="errorMsg" binding="#{ExperienceLevelsMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avslutt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
