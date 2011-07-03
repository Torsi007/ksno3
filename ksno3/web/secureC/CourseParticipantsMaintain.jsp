<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<title>Kitesurfing.no - oppdater kurs</title>
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/jqueryTableSorter/style.css" type="text/css"/>
<script src="${request.contextPath}/resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>
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

        $('#moveToEvent').change(function() {
            if(parseInt($(this).val()) < 0){
                $(this).next().css("display","inline").next().css("display","none");
              
            }else{
                $(this).next().css("display","none").next().css("display","inline");
            }
        });

        $('#moveToEventButton').click(function(event) {
            if(!validateCheckedRowsForMove()){
                event.preventDefault();
            }
        });
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

    function confirmMove(link) {
        if (validateCheckedRowsForMove()) {
            //alert("6");
            $(link).trigger('click');
            return true;
        }
        return false;
    }

    function validateCheckedRowsForMove(){
        var msg = "Beklager, ukjente deltagere kan ikke flyttes. Følgende deltagere vil dermed måtte legges til manuellt på kurset du øsnker å flytte til: \n";
        var confirmMsg = "Trykk 'OK' for å flytte følgende deltagere til kurs " + $('#moveToEvent :selected').text() + ":";
        //alert("1");
        var checkedCount = 0;
        var showMsg = false;
        $("#tblConfirmedParticipants tr").each(function (i) {
            if($(this).find("div[id=email]").text() != undefined){
                var checkBox = $(this).find("input[type=checkbox]");
                if(checkBox.length > 0){
                    if($(this).find("div[id=email]").text().indexOf("dummy") > -1){
                        if(checkBox.attr("checked")){
                            msg += $(this).find("div[id=email]").text() + "\n";
                            checkBox.attr("checked",false);
                            showMsg = true;
                        }
                    }else{
                        confirmMsg += $(this).find("div[id=email]").text() + "\n";
                        //alert("1.1 " + confirmMsg);
                    }
                    if(checkBox.attr("checked")){
                        checkedCount++;
                        //alert("1.2 " + checkedCount);
                    }
                }
            }
        });
        //alert("2");
        $("#tblUnConfirmedParticipants tr").each(function (i) {
            if($(this).find("div[id=email]").text() != undefined){
                var checkBox = $(this).find("input[type=checkbox]");
                if(checkBox != undefined){
                    if($(this).find("div[id=email]").text().indexOf("dummy") > -1){
                        if(checkBox.attr("checked")){
                            msg += $(this).find("div[id=email]").text() + "\n";
                            checkBox.attr("checked",false);
                            showMsg = true;
                        }
                    }else{
                        confirmMsg += $(this).find("div[id=email]").text() + "\n";
                    }
                    if(checkBox.attr("checked")){
                        checkedCount++;
                    }
                }
            }
        });
        //alert("3");
        if(showMsg){
            alert(msg);
        }
        if(checkedCount == 0){
            //alert("4");
            return false;
        }else{
            //alert("5");
            confirmMsg += "Merk at deltagerenes status IKKE blir endret under flyttingen.\n"
            confirmMsg += "Du blir IKKE automatisk flyttet til kurs: " + $('#moveToEvent :selected').text() + " for å kontrollere at deltagerene er flyttet korrekt bør du derfor åpne dette kurset og sjekke."
            var bval = confirm(confirmMsg);
            //alert(bval);
            return bval;
        }
    }







</SCRIPT>

</head>
<body>
    <f:view>
        <h:form id="course" >
            <t:htmlTag value="div" styleClass="ui-widget" style="margin-top:15px;" rendered="#{CourseParticipantsMaintain_Backing.errorMsg.rendered}">
                <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                    <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                        <strong>Alert:</strong> <t:outputText rendered="false" binding="#{CourseParticipantsMaintain_Backing.errorMsg}"/></p>
                </div>
            </t:htmlTag>
            <h2>
                <t:outputLabel value="#{EventModify.name}"/>&nbsp;
                <t:outputText forceId="true" value="#{EventModify.startDate}">
                    <f:converter converterId="DateConverter"/>
                </t:outputText>
                -
                <t:outputText forceId="true" value="#{EventModify.endDate}">
                    <f:converter converterId="DateConverter"/>
                </t:outputText>
            </h2>
            <table >
                <tr>
                    <td><b>Status:</b></td>
                    <td><t:outputText rendered="#{EventModify.open}" value="Åpent "/><t:outputText rendered="#{!EventModify.open}" value="Lukket "/></td>
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
                    <td><b>Hovedinstruktør:</b></td>
                    <td>
                        <t:outputText value="#{EventModify.instructor.firstName}"/>
                        (<t:outputText value="#{EventModify.instructor.phone}"/>)
                    </td>
                </tr>
            </table>
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Ubekreftet</a></li>
                    <li><a href="#tabs-2">Bekreftet (synlig i påmeldingssider)</a></li>
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
                                <div id="email">
                                    <h:outputText value="#{unConfirmedParticipation.participant.userName}"></h:outputText>
                                </div>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Påmeldingsdato" />
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
                            <h:column rendered="#{EventModify.location == 'Jæren'}">
                                <f:facet name="header">
                                    <h:outputText value="3 dag" />
                                </f:facet>
                                <h:selectBooleanCheckbox value="#{unConfirmedParticipation.thirdDay}"/>
                            </h:column>
                            <h:column rendered="#{EventModify.location == 'Jæren'}">
                                <f:facet name="header">
                                    <h:outputText value="Adresse" />
                                </f:facet>
                                <h:outputText value="#{unConfirmedParticipation.participant.streetName} , #{unConfirmedParticipation.participant.city}"></h:outputText>
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
                            <h:column >
                                <f:facet name="header">
                                    <h:outputText value="Navn" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.participant.firstName} #{confirmedParticipation.participant.lastName}"></h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Mail" />
                                </f:facet>
                                <div id="email">
                                    <h:outputText value="#{confirmedParticipation.participant.userName}"></h:outputText>
                                </div>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Påmeldingsdato" />
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
                                    <h:outputText value="Vekt" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.weight}"></h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Trapes" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.harnessSize}"></h:outputText>
                            </h:column>

                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Ønsket partner" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.partner}"></h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Kommentar fra bruker" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.comment}"></h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Par" />
                                </f:facet>
                                <t:selectOneMenu value="#{confirmedParticipation.workGroup}" style="width:120px">
                                    <f:selectItems value="#{CourseParticipantsMaintain_Backing.workGroupSelectItems}"/>
                                </t:selectOneMenu>
                            </h:column>
                            <h:column rendered="#{EventModify.location == 'Jæren'}">
                                <f:facet name="header">
                                    <h:outputText value="3 dag" />
                                </f:facet>
                                <h:selectBooleanCheckbox value="#{confirmedParticipation.thirdDay}"/>
                            </h:column>
                            <h:column rendered="#{EventModify.location == 'Jæren'}">
                                <f:facet name="header">
                                    <h:outputText value="Våtdrakt" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.wetSuitSize}"></h:outputText>
                            </h:column>
                            <h:column rendered="#{EventModify.location == 'Jæren'}">
                                <f:facet name="header">
                                    <h:outputText value="Sko" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.shoeSize}"></h:outputText>
                            </h:column>
                            <h:column rendered="#{EventModify.location == 'Jæren'}">
                                <f:facet name="header">
                                    <h:outputText value="Adresse" />
                                </f:facet>
                                <h:outputText value="#{confirmedParticipation.participant.streetName} , #{confirmedParticipation.participant.city}"></h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Intern kommentar" />
                                </f:facet>
                                <h:inputText value="#{confirmedParticipation.commentKSNO}"/>
                            </h:column>
                            <h:column>
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
            <t:commandLink forceId="true" id="confirm" styleClass="fg-button ui-state-default ui-corner-all" value="Bekreft påmelding" action="#{CourseParticipantsMaintain_Backing.confirmParticipants}" />
            <t:commandLink forceId="true" id="unConfirm" style="display:none" styleClass="fg-button ui-state-default ui-corner-all" value="Flytt påmeldt til ubekreftet" action="#{CourseParticipantsMaintain_Backing.unConfirmParticipants}" />
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Legg til ukjent deltager" action="#{CourseParticipantsMaintain_Backing.participantUnknownAdd}"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Legg til deltager" action="addParticipant"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Lagre" action="#{CourseParticipantsMaintain_Backing.save}"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Slett" action="#{CourseParticipantsMaintain_Backing.deleteParticipants}"/>
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Print" action="print" />
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Avslutt" action="#{CourseParticipantsMaintain_Backing.close}" />
            <t:selectOneMenu id="moveToEvent" forceId="true" binding="#{CourseParticipantsMaintain_Backing.eventSelect}">
                <f:selectItems value="#{CourseParticipantsMaintain_Backing.eventSelectItems}"/>
            </t:selectOneMenu>
            <a href="#" class="fg-button ui-state-disabled ui-corner-all" >Flytt til kurs</a>
            <h:commandLink id="moveToEventButton" onmousedown="confirmMove(this);" styleClass="fg-button ui-state-default ui-corner-all" value="Flytt til kurs" action="#{CourseParticipantsMaintain_Backing.moveParticipantsToCourse}" style="display:none" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
