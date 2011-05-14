<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   
<title>Kitesurfing.no - oppdater kurs</title>
<script src="../resources/js/logic.js" type="text/javascript"></script>
<link type="text/css" href="../resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="../resources/css/admin.css" rel="stylesheet" />
<script type="text/javascript" src="../resources/js/jquery-ui.custom.js"></script>
<script type="text/javascript">
    $(function() {
	$("#dp_StartDate").datepicker({ dateFormat: 'yyyy-mm-dd', onSelect: function(dateText, inst) {if(this.value.length > 11){this.value = this.value.substr(4,14)}}});
	$("#dp_EndDate").datepicker({ dateFormat: 'yyyy-mm-dd', onSelect: function(dateText, inst) {if(this.value.length > 11){this.value = this.value.substr(4,14)}}});
    });
</script>
</head>
<body>
    <f:view>
        <h:form id="course" onsubmit="return validate()">
            <h1>Oppdater kurs</h1>
            <table>
                <tr>
                    <td>Name</td>
                    <td required="true" colspan="3">
                        <t:inputText id="it_name" value="#{EventModify.name}" style="width:506px"/>
                    </td>
                </tr>
                <tr>
                    <td>Start Dato</td>
                    <td required="true" style="width:200px">
                        <t:inputText forceId="true" id="dp_StartDate" value="#{EventModify.startDate}">
                            <f:converter converterId="DateConverter"/>
                        </t:inputText>
                    </td>
                    <td>Slutt Dato</td>
                    <td required="true" style="width:200px">
                        <t:inputText forceId="true" id="dp_EndDate" value="#{EventModify.endDate}">
                            <f:converter converterId="DateConverter"/>
                        </t:inputText>
                    </td>
                </tr>
                <tr>
                    <td>Kommentar</td>
                    <td colspan="3">
                        <t:inputText id="it1" value="#{EventModify.comment}" />
                    </td>
                </tr>
                <tr>
                    <td>Ant plasser</td>
                    <td required="true">
                        <t:inputText id="it2" value="#{EventModify.maxSize}" />
                    </td>
                    <td>Åpent kurs</td>
                    <td>
                        <t:selectBooleanCheckbox value="#{EventModify.open}"/>
                    </td>
                </tr>
                <tr>
                    <td>Hovedinstruktør</td>
                    <td>
                        <t:selectOneMenu id="slct_MainInstructor" forceId="true" value="#{EventModify.instructor}" converter="PersonConverter">
                            <f:selectItems value="#{EventUpdate_Backing.instructorObjectSelectItems}"/>
                        </t:selectOneMenu>
                    </td>
                    <td>Hjelpeinstruktører</td>
                    <td rowspan="2">
                        <h:selectManyListbox id="slct_Instructors" size="3"  value="#{EventUpdate_Backing.eventInstructors}" binding="#{EventUpdate_Backing.slctManyInstructors}" style="height:46px">
                            <f:selectItems value="#{EventUpdate_Backing.instructorSelectItems}"/>
                        </h:selectManyListbox>
                    </td>
                </tr>
                <tr>
                    <td>Lokasjon</td>
                    <td>
                        <t:selectOneMenu value="#{EventModify.location}" >
                            <f:selectItem itemLabel="Haukeli" itemValue="Haukeliseter"/>
                            <f:selectItem itemLabel="Jæren" itemValue="Jæren"/>
                        </t:selectOneMenu>
                    </td>
                    <td/>
                </tr>
            </table>
            <h:commandButton value="Lagre og avslutt" action="#{EventUpdate_Backing.updateEvent}" />
            <t:outputText binding="#{EventUpdate_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
