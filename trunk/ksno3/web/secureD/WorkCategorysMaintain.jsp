<jsp:include page="../Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<title>kitesurfing.no - administrer kategorier</title>

</head>
<body>
    <f:view>
        <h:form>
            <H1>Administrer kategorier</H1>
            <h:dataTable id="dt1" value="#{WorkCategorysMaintain_Backing.workCategorys}" binding="#{WorkCategorysMaintain_Backing.data}" var="item" first="0" width="10">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kategori" />
                    </f:facet>
                    <h:inputText value="#{item.name}"></h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Beskrivelse" />
                    </f:facet>
                    <h:inputText value="#{item.description}"></h:inputText>
                </h:column>
                <h:column>
                    <h:commandLink action="#{WorkCategorysMaintain_Backing.WorkCategoryDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </h:dataTable>
            <hr/>
            <table>
                <tr>
                    <td>
                        <t:inputText binding="#{WorkCategorysMaintain_Backing.newName}"></t:inputText>
                    </td>
                    <td>
                        <t:inputText binding="#{WorkCategorysMaintain_Backing.newDescription}"></t:inputText>
                    </td>
                    <td>
                        <t:commandButton value="Opprett ny" action="#{WorkCategorysMaintain_Backing.WorkCategoryCreate}"/>
                    </td>
                </tr>
            </table>
            <t:commandButton value="Lagre" action="#{WorkCategorysMaintain_Backing.WorkCategorysUpdate}"/>
            <t:outputText styleClass="errorMsg" binding="#{WorkCategorysMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
