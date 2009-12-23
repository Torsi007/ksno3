<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   
<title>Kitesurfing.no - oppdater kurs</title>
<script src="../resources/js/logic.js" type="text/javascript"></script>
<link type="text/css" href="../resources/css/trontastic/jquery-ui.custom.css" rel="stylesheet" />
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
                    <td>Start Dato</td>
                    <td required="true">
                        <t:inputText forceId="true" id="dp_StartDate" value="#{EventModify.startDate}">
                            <f:convertDateTime pattern="yyyy-MM-dd"/>
                        </t:inputText>
                    </td>
                    <td>Slutt Dato</td>
                    <td required="true">
                        <t:inputText forceId="true" id="dp_EndDate" value="#{EventModify.endDate}">
                            <f:convertDateTime pattern="yyyy-MM-dd"/>
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
                    <td>
                        <h:selectManyListbox id="slct_Instructors" size="3"  value="#{EventUpdate_Backing.eventInstructors}" binding="#{EventUpdate_Backing.slctManyInstructors}">
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
                    <td colsapn="2"/>
                </tr>
            </table>
            <b>Deltagere</b><br/>
            <t:dataTable id="dt1" value="#{EventModify.participations}" binding="#{EventUpdate_Backing.data}" var="participation" first="0" width="100%">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Navn" />
                    </f:facet>
                    <h:outputText value="#{participation.participant.firstName} #{participation.participant.lastName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Mail" />
                    </f:facet>
                    <h:inputText readonly="true" value="#{participation.participant.userName}"></h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Telefon" />
                    </f:facet>
                    <h:inputText value="#{participation.participant.phone}"></h:inputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Sko" />
                    </f:facet>
                    <t:selectOneMenu style="width:98" required="true" value="#{participation.shoeSize}" >
                        <f:selectItem itemLabel="-" itemValue="empty"/>
                        <f:selectItem itemLabel="45" itemValue="45"/>
                        <f:selectItem itemLabel="44" itemValue="44"/>
                        <f:selectItem itemLabel="43" itemValue="43"/>
                        <f:selectItem itemLabel="42" itemValue="42"/>
                        <f:selectItem itemLabel="41" itemValue="41"/>
                        <f:selectItem itemLabel="40" itemValue="40"/>
                        <f:selectItem itemLabel="39" itemValue="39"/>
                        <f:selectItem itemLabel="38" itemValue="38"/>
                        <f:selectItem itemLabel="37" itemValue="37"/>
                        <f:selectItem itemLabel="36" itemValue="36"/>
                        <f:selectItem itemLabel="35" itemValue="35"/>
                    </t:selectOneMenu>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Hjelm" />
                    </f:facet>
                    <t:selectOneMenu style="width:98" required="true" value="#{participation.helmetSize}" >
                        <f:selectItem itemLabel="Tar med selv!" itemValue="empty"/>
                        <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                        <f:selectItem itemLabel="XL" itemValue="XL"/>
                        <f:selectItem itemLabel="L" itemValue="L"/>
                        <f:selectItem itemLabel="M" itemValue="M"/>
                        <f:selectItem itemLabel="S" itemValue="S"/>
                        <f:selectItem itemLabel="XS" itemValue="XS"/>
                    </t:selectOneMenu>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Våtdrakt" />
                    </f:facet>
                    <t:selectOneMenu  style="width:98" required="true" value="#{participation.wetSuitSize}">
                        <f:selectItem itemLabel="-" itemValue="empty"/>
                        <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                        <f:selectItem itemLabel="XL" itemValue="XL"/>
                        <f:selectItem itemLabel="L" itemValue="L"/>
                        <f:selectItem itemLabel="M" itemValue="M"/>
                        <f:selectItem itemLabel="S" itemValue="S"/>
                        <f:selectItem itemLabel="XS" itemValue="XS"/>
                    </t:selectOneMenu>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Bruker kommentar" />
                    </f:facet>
                    <h:outputText value="#{participation.comment}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Ksno kommentar" />
                    </f:facet>
                    <h:inputText value="#{participation.commentKSNO}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="På ventelist" />
                    </f:facet>
                    <h:selectBooleanCheckbox value="#{participation.onWaitList}"/>
                </h:column>
                <%--
                 <h:column>
                    <h:commandLink action="#{EventUpdate_Backing.selectEditParticipant}">
                        <h:outputText value="Endre"/>
                    </h:commandLink>
                </h:column>
                --%>
                <h:column>
                    <h:commandLink action="#{EventUpdate_Backing.participantDelete}">
                        <h:outputText value="Slett"/>
                    </h:commandLink>
                </h:column>
            </t:dataTable>
            <h:commandButton value="Lagre og avslutt" action="#{EventUpdate_Backing.updateEvent}" />
            <h:commandButton value="Legg til ukjent deltager" action="#{EventUpdate_Backing.participantUnknownAdd}"/>
            <h:commandButton value="Legg til deltager" action="addParticipant"/>
            <t:outputText binding="#{EventUpdate_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
