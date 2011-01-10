<jsp:include page="../Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/jqueryTableSorter/style.css" type="text/css"/>
<script src="${request.contextPath}/resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>
<title>kitesurfing.no - administrer oppgaver</title>
<script type="text/javascript">
    $(function() {
	$("#newStartDate").datepicker({ dateFormat: 'yyyy-mm-dd', onSelect: function(dateText, inst) {if(this.value.length > 11){this.value = this.value.substr(4,14)}}});
	$("#newEndDate").datepicker({ dateFormat: 'yyyy-mm-dd', onSelect: function(dateText, inst) {if(this.value.length > 11){this.value = this.value.substr(4,14)}}});
    });
</script>
</head>
<body>
    <f:view>
        <h:form>
            <H1>Administrer oppgaver</H1>
            <t:selectOneMenu id="slct_WorkCat" forceId="true" binding="#{WorkTasksMaintain_Backing.slctOneWorkCategory}" converter="WorkCategoryConverter" >
                <f:selectItems value="#{WorkTasksMaintain_Backing.workCategorySelectItems}"/>
            </t:selectOneMenu>
            <h:commandLink action="#{WorkTasksMaintain_Backing.Filter}">
                <h:outputText value="Velg"/>
            </h:commandLink>
            <hr/>
            <h:dataTable id="dt1" value="#{WorkTasksMaintain_Backing.workTasks}" binding="#{WorkTasksMaintain_Backing.data}" var="item" first="0" width="10">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kategori" />
                    </f:facet>
                    <h:inputText value="#{item.name}" style="width:200px"></h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Startet" />
                    </f:facet>
                    <h:inputText value="#{item.startDate}" style="width:100px">
                        <f:converter converterId="CalendarConverter"/>
                    </h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Avsluttet" />
                    </f:facet>
                    <h:inputText value="#{item.endDate}" style="width:100px">
                        <f:converter converterId="CalendarConverter"/>
                    </h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Beskrivelse" />
                    </f:facet>
                    <h:inputText value="#{item.description}" style="width:300px"></h:inputText>
                </h:column>
                <h:column>
                    <h:commandLink action="#{WorkTasksMaintain_Backing.WorkTaskDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </h:dataTable>
            <hr/>
            <table>
                <tr>
                    <td >
                        <t:inputText style="width:200px" binding="#{WorkTasksMaintain_Backing.newName}"></t:inputText>
                    </td>
                    <td >
                        <t:inputText style="width:100px" id="newStartDate" forceId="true" binding="#{WorkTasksMaintain_Backing.newStartDate}">
                            <f:converter converterId="CalendarConverter"/>
                        </t:inputText>
                    </td>
                    <td>
                        <t:inputText style="width:100px" id="newEndDate" forceId="true" binding="#{WorkTasksMaintain_Backing.newEndDate}">
                            <f:converter converterId="CalendarConverter"/>
                        </t:inputText>
                    </td>
                    <td>
                        <t:inputText style="width:300px" binding="#{WorkTasksMaintain_Backing.newDescription}"></t:inputText>
                    </td>
                    <td>
                        <t:commandButton value="Opprett ny" action="#{WorkTasksMaintain_Backing.WorkTaskCreate}"/>
                    </td>
                </tr>
            </table>
            <t:commandButton value="Lagre" action="#{WorkTasksMaintain_Backing.WorkTasksUpdate}"/>
            <t:outputText styleClass="errorMsg" binding="#{WorkTasksMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
