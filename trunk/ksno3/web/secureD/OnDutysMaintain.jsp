<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/jqueryTableSorter/style.css" type="text/css"/>
<script src="${request.contextPath}/resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>
<title>kitesurfing.no - Videoer</title>
<script type="text/javascript">
    $(function() {
	$("#onDutyFromDate").datepicker({ dateFormat: 'yyyy-mm-dd', onSelect: function(dateText, inst) {if(this.value.length > 11){this.value = this.value.substr(4,14)}}});
    });
</script>
</head>
<body>
    <f:view>
        <h:form>
            <h:dataTable id="dt1" value="#{OnDutysMaintain_Backing.onDutys}" binding="#{OnDutysMaintain_Backing.data}" var="item" first="0" width="400px">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Fra" />
                    </f:facet>
                    <h:outputText value="#{item.fromDate}">
                        <f:converter converterId="CalendarConverter"/>
                    </h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Instruktør" />
                    </f:facet>
                    <h:outputText value="#{item.instructor.firstName}"></h:outputText>
                </h:column>
                <h:column>
                    <h:commandLink action="#{OnDutysMaintain_Backing.onDutyDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </h:dataTable>
            <hr/>
            <table>
                <tr>
                    <td>Instruktør</td>
                    <td style="width:100px">
                        <t:selectOneMenu id="slct_Instructor" forceId="true" binding="#{OnDutysMaintain_Backing.slctOneInstructor}" converter="PersonConverter">
                            <f:selectItems value="#{OnDutysMaintain_Backing.instructorObjectSelectItems}"/>
                        </t:selectOneMenu>
                    </td>
                    <td>Vakt fra dato</td>
                    <td style="width:100px">
                        <t:inputText forceId="true" id="onDutyFromDate" binding="#{OnDutysMaintain_Backing.txtStartDate}">
                            <f:converter converterId="CalendarConverter"/>
                        </t:inputText>
                    </td>
                    <td>
                        <t:commandButton value="Opprett ny" action="#{OnDutysMaintain_Backing.onDutyCreate}"/>
                    </td>
                </tr>
            </table>
            <t:commandButton value="Lagre" action="#{OnDutysMaintain_Backing.onDutysUpdate}"/>
            <t:outputText styleClass="errorMsg" binding="#{OnDutysMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>

    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>




