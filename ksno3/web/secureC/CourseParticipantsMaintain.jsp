<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<title>Kitesurfing.no - oppdater kurs</title>
<link type="text/css" href="../resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="../resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/jqueryTableSorter/style.css" type="text/css"/>
<script src="../resources/js/logic.js" type="text/javascript"></script>
<script src="../resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../resources/js/jquery-ui.custom.js"></script>
<SCRIPT type="text/javascript">
   
    $(document).ready(function(){
        $("#tabs").tabs();
        $('#tabs').bind('tabsshow', function(event, ui) {
            if(ui.index == 0){
                //initTblUnconfirmedParticipants();
                $("#confirm").css("display","inline");
                $("#unConfirm").css("display","none");
            }
            if(ui.index == 1){
                //initTblConfirmedParticipants();
                $("#confirm").css("display","none");
                $("#unConfirm").css("display","inline");
            }
        });
        //initTblUnconfirmedParticipants();
        //initTblConfirmedParticipants();
        $("table.tablesorter").attr("border", 0).attr("cellpadding",0).attr("cellspacing",0)
    });
 
    function initTblUnconfirmedParticipants(){
        $("#tblUnconfirmedParticipants").tablesorter({
            headers: {
                3: { sorter: false },
                4: { sorter: false },
                6: { sorter: false }
            },
            widgets: ['zebra']
        });
    }

    function initTblConfirmedParticipants(){
        $("#tblConfirmedParticipants").tablesorter({
            headers: {
                2: { sorter: false },
                4: { sorter: false },
                5: { sorter: false },
                6: { sorter: false },
                7: { sorter: false }
            },
            widgets: ['zebra']
        });
    }

</SCRIPT>

</head>
<body>
    <f:view>
        <h:form id="course" onsubmit="return validate()">
            <t:htmlTag value="div" styleClass="ui-widget" style="margin-top:15px;" rendered="#{CourseParticipantsMaintain_Backing.errorMsg.rendered}">
                <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                    <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                        <strong>Alert:</strong> <t:outputText rendered="false" binding="#{CourseParticipantsMaintain_Backing.errorMsg}"/></p>
                </div>
            </t:htmlTag>
            <h2>
                <t:outputLabel value="#{EventModify.name}"/>&nbsp;
                <t:outputText forceId="true" value="#{EventModify.startDate}">
                    <f:convertDateTime pattern="yyyy-MM-dd"/>
                </t:outputText>
                -
                <t:outputText forceId="true" value="#{EventModify.endDate}">
                    <f:convertDateTime pattern="yyyy-MM-dd"/>
                </t:outputText>
            </h2>
            <table >
                <tr>
                    <td><b>Status:</b></td>
                    <td><t:outputText rendered="#{EventModify.open}" value="�pent "/><t:outputText rendered="#{!EventModify.open}" value="Lukket "/></td>
                </tr>
                <tr>
                    <td><b>Lokasjon:</b></td>
                    <td><t:outputLabel value="#{EventModify.location}" /></td>
                </tr>
                <tr>
                    <td><b>Ant plasser:</b></td>
                    <td><t:outputText value="#{EventModify.maxSize}" /></td>
                </tr>
                <tr>
                    <td><b>Kommentar:</b></td>
                    <td>
                        <t:outputText value="#{EventModify.comment}" />
                    </td>
                </tr>
                <tr>
                    <td><b>Hovedinstrukt�r:</b></td>
                    <td>
                        <t:outputText value="#{EventModify.instructor.firstName}"/>
                        (<t:outputText value="#{EventModify.instructor.phone}"/>)
                    </td>
                </tr>
            </table>
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Ubekreftet</a></li>
                    <li><a href="#tabs-2">Bekreftet (synlig i p�meldingssider)</a></li>
                </ul>
                <div id="tabs-1" >
                    <div style="width:100%">
                    <t:dataTable styleClass="tablesorter" forceId="true" id="tblUnconfirmedParticipants" value="#{EventModify.unConfirmedParticipations}" binding="#{CourseParticipantsMaintain_Backing.dataUnconfirmedParticipants}" var="unConfirmedParticipation" first="0" width="100%">
                        <h:column >
                            <f:facet name="header">
                                <h:outputText value="Navn" />
                            </f:facet>
                            <h:outputText value="#{unConfirmedParticipation.participant.firstName} #{unConfirmedParticipation.participant.lastName}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Mail" />
                            </f:facet>
                            <h:outputText value="#{unConfirmedParticipation.participant.userName}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="P�meldingsdato" />
                            </f:facet>
                            <h:outputText value="#{unConfirmedParticipation.createdDate}">
                                <f:converter converterId="CalendarDateAndTimeConverter"/>
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Telefon" />
                            </f:facet>
                            <h:outputText value="#{unConfirmedParticipation.participant.phone}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Kommentar fra bruker" />
                            </f:facet>
                            <h:outputText value="#{unConfirmedParticipation.comment}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Intern kommentar" />
                            </f:facet>
                            <h:inputText value="#{unConfirmedParticipation.commentKSNO}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <f:verbatim escape="false">&nbsp;</f:verbatim>
                            </f:facet>
                            <h:selectBooleanCheckbox value="#{unConfirmedParticipation.uIChecked}"/>
                        </h:column>
                    </t:dataTable>
                                </div>
                </div>
                <div id="tabs-2">
                    <div style="width:100%">
                    <t:dataTable styleClass="tablesorter" id="tblConfirmedParticipants" forceId="true" value="#{EventModify.confirmedParticipations}" binding="#{CourseParticipantsMaintain_Backing.dataConfirmedParticipants}" var="confirmedParticipation" first="0" width="100%">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Navn" />
                            </f:facet>
                            <h:outputText value="#{confirmedParticipation.participant.firstName} #{confirmedParticipation.participant.lastName}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Mail" />
                            </f:facet>
                            <h:outputText value="#{confirmedParticipation.participant.userName}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="P�meldingsdato" />
                            </f:facet>
                            <h:outputText value="#{confirmedParticipation.createdDate}">
                                <f:converter converterId="CalendarDateAndTimeConverter"/>
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Telefon" />
                            </f:facet>
                            <h:outputText value="#{confirmedParticipation.participant.phone}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Kommentar fra bruker" />
                            </f:facet>
                            <h:outputText value="#{confirmedParticipation.comment}"></h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Intern kommentar" />
                            </f:facet>
                            <h:inputText value="#{confirmedParticipation.commentKSNO}"/>
                        </h:column>
                        <h:column >
                            <f:facet name="header">
                                <f:verbatim escape="false">&nbsp;</f:verbatim>
                            </f:facet>
                            <h:selectBooleanCheckbox value="#{confirmedParticipation.uIChecked}"/>
                        </h:column>
                    </t:dataTable>
                    </div>
                </div>
            </div>
            <br/>
            <t:commandLink forceId="true" id="confirm" styleClass="fg-button ui-state-default ui-corner-all" value="Bekreft p�melding" action="#{CourseParticipantsMaintain_Backing.confirmParticipants}" />
            <t:commandLink forceId="true" id="unConfirm" style="display:none" styleClass="fg-button ui-state-default ui-corner-all" value="Flytt p�meldt til ubekreftet" action="#{CourseParticipantsMaintain_Backing.unConfirmParticipants}" />
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Legg til ukjent deltager" action="#{CourseParticipantsMaintain_Backing.participantUnknownAdd}"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Legg til deltager" action="addParticipant"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Lagre" action="#{CourseParticipantsMaintain_Backing.save}"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Slett" action="#{CourseParticipantsMaintain_Backing.deleteParticipants}"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Avslutt" action="#{CourseParticipantsMaintain_Backing.close}" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
