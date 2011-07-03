<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<title>Opprett kurs</title>
<script src="${request.contextPath}/resources/js/logic.js" type="text/javascript"></script>
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>
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
            <h1>Nytt kurs</h1>
            <p>Du er i ferd med å opprette et nytt kurs</p>
            <table>
                <tr>
                    <td>Name</td>
                    <td required="true">
                        <t:inputText id="it_namr" binding="#{BeginnerCourseCreate_Backing.name}" value="Nybegynnerkurs"/>
                    </td>
                </tr>
                <tr>
                    <td>Start Dato</td>
                    <td required="true">
                        <t:inputText id="dp_StartDate" forceId="true" binding="#{BeginnerCourseCreate_Backing.startDate}">
                            <f:converter converterId="DateConverter"/>
                        </t:inputText>
                    </td>
                </tr>
                <tr>
                    <td>Slutt Dato</td>
                    <td required="true">
                        <t:inputText id="dp_EndDate" forceId="true" binding="#{BeginnerCourseCreate_Backing.endDate}">
                            <f:converter converterId="DateConverter"/>
                        </t:inputText>
                    </td>
                </tr>
                <tr>
                    <td>Kommentar</td>
                    <td>
                        <t:inputText id="it1" binding="#{BeginnerCourseCreate_Backing.comment}" />
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Ant plasser</td>
                    <td required="true">
                        <t:inputText id="it2" binding="#{BeginnerCourseCreate_Backing.maxSize}" />
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Åpent kurs</td>
                    <td>
                        <t:selectBooleanCheckbox binding="#{BeginnerCourseCreate_Backing.open}"/>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Hovedinstruktør</td>
                    <td>
                        <t:selectOneMenu  binding="#{BeginnerCourseCreate_Backing.slctOneInstructor}">
                            <f:selectItems value="#{BeginnerCourseCreate_Backing.mainInstructorSelectItems}"/>
                        </t:selectOneMenu>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Hjelpeinstruktører</td>
                    <td>
                        <h:selectManyListbox  size="3"  binding="#{BeginnerCourseCreate_Backing.slctManyInstructors}">
                            <f:selectItems value="#{BeginnerCourseCreate_Backing.instructorSelectItems}"/>
                        </h:selectManyListbox>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Lokasjon</td>
                    <td>
                        <t:selectOneMenu binding="#{BeginnerCourseCreate_Backing.location}" >
                            <f:selectItem itemLabel="Haukeli" itemValue="Haukeliseter"/>
                            <f:selectItem itemLabel="Jæren" itemValue="Jæren"/>
                        </t:selectOneMenu>
                    </td>
                    <td/>
                </tr>
            </table>
            <h:commandButton value="Lagre og avslutt" action="#{BeginnerCourseCreate_Backing.createCourse}" />
            <t:outputText binding="#{BeginnerCourseCreate_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
