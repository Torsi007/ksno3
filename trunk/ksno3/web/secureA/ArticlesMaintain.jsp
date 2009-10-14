<jsp:include page="../nd/Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<title>kitesurfing.no - artikler</title>
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
            <h:dataTable id="dt1" value="#{ArticlesMaintain_Backing.articles}" binding="#{ArticlesMaintain_Backing.data}" var="item" first="0" width="100%">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Tittel" />
                    </f:facet>
                    <h:outputText value="#{item.name}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Opprettet" />
                    </f:facet>
                    <h:outputText value="#{item.createdDate}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Forfatter" />
                    </f:facet>
                    <h:outputText value="#{item.author.firstName} #{item.author.lastName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Aktiv" />
                    </f:facet>
                    <t:selectBooleanCheckbox enabledOnUserRole="admin,internal" value="#{item.visible}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Location" />
                    </f:facet>
                    <t:selectOneMenu value="#{item.frontPagePosition}" >
                        <f:selectItem itemLabel="Top" itemValue="top"/>
                        <f:selectItem itemLabel="Default" itemValue="default"/>
                    </t:selectOneMenu>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Category" />
                    </f:facet>
                    <t:selectOneMenu value="#{item.category}" converter="CategoryConverter">
                        <f:selectItems value="#{ArticlesMaintain_Backing.categorySelectItems}"/>
                    </t:selectOneMenu>
                </h:column>
                <h:column>
                    <h:commandLink action="#{ArticlesMaintain_Backing.selectEditArticle}">
                        <h:outputText value="Endre"/>
                    </h:commandLink>
                </h:column>
                <h:column>
                    <h:commandLink action="#{ArticlesMaintain_Backing.articleDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </h:dataTable>
            <input type="button" value="Tilbake til hovedsiden" onclick="toStartPage()"/>
            <h:commandButton value="Opprett ny artikkel" action="articleCreate"/>
            <t:commandButton value="Lagre" visibleOnUserRole="admin,internal" action="#{ArticlesMaintain_Backing.articlesUpdate}"/>
            <t:outputText styleClass="errorMsg" binding="#{ArticlesMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../nd/Ending.jsp" ></jsp:include>

