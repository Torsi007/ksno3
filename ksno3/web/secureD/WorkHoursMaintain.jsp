<jsp:include page="../Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/jqueryTableSorter/style.css" type="text/css"/>
<script src="${request.contextPath}/resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>
<title>kitesurfing.no - administrer oppgaver</title>
<script type="text/javascript">
     $(document).ready(function(){
        if($('#tasksPopulated').val() == undefined || $('#tasksPopulated').val() == ""){
           $('#btnFetchWorkTasksByCategory').trigger("click");
        }
        /*$('#form').submit(function() {
          if(!validate()){
              alert("Feil under validering")
              return false;
          }
        });*/

     });

     function validate(){
         var returnval = true;
        $('.cal').each(function(index) {
            if($(this).val() == ""){
                returnval = false;
            }
         });
         if(!returnval){
             return returnval;
         }
        $('.hours').each(function(index) {
            if($(this).val() == ""){
                returnval = false;
            }
         });
        return returnval;
     }

    $(function() {
        $(".cal").datepicker({ dateFormat: 'yyyy-mm-dd', onSelect: function(dateText, inst) {if(this.value.length > 11){this.value = this.value.substr(4,14)}}});
    });
</script>
</head>
<body>
    <f:view>
        <h:form id="form">
            <H1>Hei <h:outputText value="#{WorkHoursMaintain_Backing.instructor.firstName}" /> flinke gutt som registrer timene dine:)</H1>
            <t:dataTable id="tblHours" forceId="true" value="#{WorkHoursMaintain_Backing.workHoursList}" binding="#{WorkHoursMaintain_Backing.data}" var="item" first="0" width="10">
                <t:column>
                    <f:facet name="header">
                        <h:outputText value="Kategori" />
                    </f:facet>
                    <t:outputText style="width:200px" value="#{item.workTask.workCategory.name}"></t:outputText>
                </t:column>
                <t:column>
                    <f:facet name="header">
                        <h:outputText value="Oppgave" />
                    </f:facet>
                    <t:outputText style="width:200px" value="#{item.workTask.name}"></t:outputText>
                </t:column>
                <t:column>
                    <f:facet name="header">
                        <h:outputText value="Date" />
                    </f:facet>
                    <h:inputText value="#{item.workDate}" style="width:60px" styleClass="cal">
                        <f:converter converterId="CalendarConverter"/>
                    </h:inputText>
                </t:column>
                <t:column>
                    <f:facet name="header">
                        <h:outputText value="Timer" />
                    </f:facet>
                    <h:inputText value="#{item.hours}" style="width:50px" styleClass="hours"></h:inputText>
                </t:column>
                <t:column>
                    <f:facet name="header">
                        <h:outputText value="Beskrivelse" />
                    </f:facet>
                    <h:inputText value="#{item.description}" style="width:500px"></h:inputText>
                </t:column>
                <h:column>
                    <f:facet name="header">
                        <f:verbatim escape="false">&nbsp;</f:verbatim>
                    </f:facet>
                    <h:selectBooleanCheckbox value="#{item.uIChecked}" style="width:20px"/>
                </h:column>
            </t:dataTable>
            <hr/>
            <table>
                <tr>
                    <td >
                        <h:selectOneMenu id="ddCategory"  binding="#{WorkHoursMaintain_Backing.newWorkCategory}" converter="WorkCategoryConverter"  style="width:200px" valueChangeListener="#{WorkHoursMaintain_Backing.fetchWorkTasksByCategory}" onchange="document.getElementById('btnFetchWorkTasksByCategory').click()">
                           <f:selectItems value="#{WorkHoursMaintain_Backing.workCategorySelectItems}" />
                        </h:selectOneMenu>
                    </td>
                    <td >
                        <t:selectOneMenu id="ddTask" binding="#{WorkHoursMaintain_Backing.newWorkTask}" converter="WorkTaskConverter" style="width:200px">
                           <f:selectItems value="#{WorkHoursMaintain_Backing.workTasksByCategory}" />
                        </t:selectOneMenu>
                    </td>
                    <td >
                        <t:inputText style="width:60px" binding="#{WorkHoursMaintain_Backing.newWorkDate}" styleClass="cal">
                            <f:converter converterId="CalendarConverter"/>
                        </t:inputText>
                    </td>
                    <td>
                        <t:inputText style="width:50px" id="newHours" binding="#{WorkHoursMaintain_Backing.newWorkHours}" styleClass="hours">
                        </t:inputText>
                    </td>
                    <td>
                        <t:inputText style="width:500px" binding="#{WorkHoursMaintain_Backing.newDescription}"></t:inputText>
                    </td>
                    <td>
                        <t:commandButton value="Opprett ny" action="#{WorkHoursMaintain_Backing.WorkHoursCreate}"/>
                    </td>
                </tr>
            </table>
            <t:inputText style="display:none" binding="#{WorkHoursMaintain_Backing.tasksPopulated}" forceId="true" id="tasksPopulated"></t:inputText>
            <t:commandButton value="dummy" style="display:none" forceId="true" id="btnFetchWorkTasksByCategory" styleClass="btnFetchWorkTasksByCategory"/>
            <t:commandButton value="Lagre" action="#{WorkHoursMaintain_Backing.WorkHoursUpdate}"/>
            <t:commandButton value="Slett" action="#{WorkHoursMaintain_Backing.WorkHoursDelete}"/>
            <t:outputText styleClass="errorMsg" binding="#{WorkHoursMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avslutt" action="cancel" />
            <br/>
            <t:commandLink action="workCategorysMaintain">Administrer arbeidskategorier</t:commandLink>
            <br/>
            <t:commandLink action="workTasksMaintain">Administrer arbeidsoppgaver</t:commandLink>
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
