<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<title>Kitesurfing.no - sett opp kurs</title>

<link type="text/css" href="../resources/css/admin.css" rel="stylesheet" />



<SCRIPT type="text/javascript">
   
    $(document).ready(function(){
    });
</SCRIPT>
<style type="text/css">
    th.width80 {width:80px}
    th.width120 {width:130px}
    th.width140 {width:160px}
    table.tablesorter {table-layout:fixed; width:950px; border-width: 1px; border-style: solid; border-color:black; border-spacing:0px; border-collapse:collapse}
    table.tablesorter tbody tr td {font-size:16px; border-width: 1px; border-style: solid; border-color:black}
    table.tablesorter thead tr th {font-size:16px}
</style>
</head>
<body>
    <f:view>
        <h:form id="course" >
            <t:dataTable value="#{EventModify.courseSetUpList}" binding="#{CourseParticipantsMaintain_Backing.dataConfirmedParticipants}" var="confirmedParticipation" first="0" width="100%"  >
                <h:column headerClass="width160">
                    <f:facet name="header">
                        <h:outputText value="Navn" />
                    </f:facet>
                    <h:outputText  value="#{confirmedParticipation.participant.firstName} #{confirmedParticipation.participant.lastName}"></h:outputText>
                </h:column>
                <h:column headerClass="width80">
                    <f:facet name="header">
                        <h:outputText value="Telefon" />
                    </f:facet>
                    <h:outputText style="width:60px" value="#{confirmedParticipation.participant.phone}"></h:outputText>
                </h:column>
                <h:column headerClass="width80">
                    <f:facet name="header">
                        <h:outputText value="Vekt" />
                    </f:facet>
                    <h:outputText value="#{confirmedParticipation.weight}"></h:outputText>
                </h:column>
                <h:column headerClass="width80">
                    <f:facet name="header">
                        <h:outputText value="Trapes" />
                    </f:facet>
                    <h:outputText value="#{confirmedParticipation.harnessSize}"></h:outputText>
                </h:column>
                <h:column headerClass="width120">
                    <f:facet name="header" >
                        <h:outputText value="Instruktør" />
                    </f:facet>
                    <h:outputText value="#{confirmedParticipation.workGroup}" />
                </h:column>
                <h:column headerClass="width80">
                    <f:facet name="header">
                        <h:outputText value="Kite" />
                    </f:facet>
                    <h:outputText value="" />
                </h:column>
                <h:column headerClass="width80">
                    <f:facet name="header">
                        <h:outputText value="Walkie" />
                    </f:facet>
                    <h:outputText value="" />
                </h:column>
                <h:column headerClass="width120">
                    <f:facet name="header">
                        <h:outputText value="Ut" />
                    </f:facet>
                    <h:outputText value="" />
                </h:column>
                <h:column headerClass="width120">
                    <f:facet name="header">
                        <h:outputText value="Inn" />
                    </f:facet>
                    <h:outputText value="" />
                </h:column>
            </t:dataTable>
        </div>
    </div>
</div>
<br/>
</h:form>
</f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
