<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/jqueryTableSorter/style.css" type="text/css"/>
<script src="${request.contextPath}/resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>
<title>Kitesurfing.no - administrer kurs</title>
<script type="text/javascript">
    $(document).ready(function(){


        if(location.search != undefined && location.search.toLowerCase().indexOf("courseid")> -1){
            var queryCourse = location.search.split('=')[1];
            $("#dt1 tr").each(function (i) {
                if($(this).find("div[id=courseId]").text() != undefined){
                    if(queryCourse ==  $(this).find("div[id=courseId]").text()){
                        $(this).find("a[title=Administrer deltagere]").click();
                    }
                }
              });
        }
        $("table.tablesorter").attr("border", 0).attr("cellpadding",0).attr("cellspacing",0);
        $("#dt1").tablesorter({
            headers: {
                9: { sorter: false },
                10: { sorter: false },
                11: { sorter: false }
            },
            widgets: ['zebra']
        });
    });
        
</script>
</head>
<body>
    <f:view>
        <h:form>
            <t:htmlTag value="div" styleClass="ui-widget" style="margin-top:15px;" rendered="#{CourseParticipantsMaintain_Backing.errorMsg.rendered}">
                <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                    <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                        <strong>Alert:</strong> <t:outputText rendered="false" binding="#{CourseParticipantsMaintain_Backing.errorMsg}"/></p>
                </div>
            </t:htmlTag>
            <t:dataTable forceId="true" styleClass="tablesorter"  id="dt1" value="#{EventsMaintain_Backing.eventsFromThisYear}" binding="#{EventsMaintain_Backing.data}" var="item" first="0" width="100%">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Start dato" />
                    </f:facet>
                    <div style="display:none" id="courseId"><h:outputText value="#{item.id}"/></div>
                    <h:inputHidden value="#{item.id}"/>
                    <h:outputText value="#{item.startDate}"><f:convertDateTime pattern="yyyy-MM-dd"/>
                    </h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Slutt dato" />
                    </f:facet>
                    <h:outputText value="#{item.endDate}"><f:convertDateTime pattern="yyyy-MM-dd"/>
                    </h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Navn" />
                    </f:facet>
                    <h:outputText value="#{item.name}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Ansvarlig" />
                    </f:facet>
                    <h:outputText value="#{item.instructor.firstName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Hjelpeinstruktører" />
                    </f:facet>
                    <h:outputText value="#{item.instructorsCSV}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kommentar" />
                    </f:facet>
                    <h:outputText value="#{item.comment}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Lokasjon" />
                    </f:facet>
                    <h:outputText value="#{item.location}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Ant plasser" />
                    </f:facet>
                    <h:outputText value="#{item.maxSize}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Åpent" />
                    </f:facet>
                    <h:outputText value="V" rendered="#{item.open}" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <f:verbatim escape="false">&nbsp;</f:verbatim>
                    </f:facet>
                    <t:htmlTag value="table" styleClass="iconContainer">
                        <t:htmlTag value="tr">
                            <t:htmlTag value="td" visibleOnUserRole="admin, internal">
                                <t:commandLink  action="#{EventsMaintain_Backing.eventUpdate}" title="Oppdater kurs">
                                    <span class="ui-icon ui-icon-pencil"></span>
                                </t:commandLink>
                            </t:htmlTag>
                            <t:htmlTag value="td" visibleOnUserRole="admin, internal, external">
                                <t:commandLink action="#{EventsMaintain_Backing.participantsMaintain}" title="Administrer deltagere">
                                    <span class="ui-icon ui-icon-person"></span>
                                </t:commandLink>
                            </t:htmlTag>
                            <t:htmlTag value="td" visibleOnUserRole="admin, internal">
                                <t:commandLink  action="#{EventsMaintain_Backing.eventDelete}" title="Slett kurs">
                                    <span class="ui-icon ui-icon-trash"></span>
                                </t:commandLink>
                            </t:htmlTag>
                        </t:htmlTag>
                    </t:htmlTag>
                </h:column>
            </t:dataTable>
            <t:commandLink visibleOnUserRole="admin, internal" id="confirm" styleClass="fg-button ui-state-default ui-corner-all" value="Opprett nytt kurs" action="courseCreate" />
            <h:commandLink styleClass="fg-button ui-state-default ui-corner-all" value="Avslutt" action="cancel" immediate="true" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
