<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<title>kitesurfing.no - oppdater deltagerdata</title>
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/jqueryTableSorter/style.css" type="text/css"/>

<script src="../resources/js/logic.js" type="text/javascript"></script>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        /*$("input[type=submit]").click(function(event){
           if($("textarea").html() == ''){
               $("textarea").html($("#text").html());
           }
       });*/
    });

        

</script>
</head>
<body>
    <f:view>
        <h:form>
            <h1>Oppdater deltagerdata</h1>
            <h3>
                Ved å fylle inn feltene nedenfor hjelper du oss å planlegge kurset slik at vi kan gjennomføre kurset mer effektivt.
                På forhånd takk.
            </h3>
            <table width="100%">
                <tr>
                    <td style="width:200px" nowrap>Deltager</td>
                    <td style="width:200px">
                        <t:outputText value="#{ParticipationAddInfo_Backing.participation.participant.firstName} #{ParticipationAddInfo_Backing.participation.participant.lastName}"/>
                    </td>
                    <td style="width:100%">&nbsp</td>
                </tr>
                <tr>
                    <td style="width:200px" nowrap>Kurs</td>
                    <td style="width:200px">
                        <t:outputText value="#{ParticipationAddInfo_Backing.participation.event}"/>
                    </td>
                    <td style="width:100%">&nbsp</td>
                </tr>
                <tr>
                    <td style="width:200px" nowrap>Relevant erfaring</td>
                    <td style="width:1">
                        <t:selectOneMenu binding="#{ParticipationAddInfo_Backing.experienceLevel}" value="#{ParticipationAddInfo_Backing.participation.level}" converter="ExperienceLevelConverter" style="width:200px">
                            <f:selectItems value="#{ParticipationAddInfo_Backing.experienceLevelSelectItems}"/>
                        </t:selectOneMenu>
                    </td>
                    <td style="width:100%">Om flere av valgene er aktuelle, velg det øverste</td>
                </tr>
                <tr>
                    <td style="width:200px">Vekt [kg]</td>
                    <td style="width:1" required="true">
                        <t:selectOneMenu binding="#{ParticipationAddInfo_Backing.weight}" value="#{ParticipationAddInfo_Backing.participation.weight}" style="width:200px">
                            <f:selectItem itemLabel="-" itemValue="empty"/>
                            <f:selectItem itemLabel="< 50" itemValue="< 50"/>
                            <f:selectItem itemLabel="50 - 59" itemValue="50 - 59"/>
                            <f:selectItem itemLabel="60 - 69" itemValue="60 - 69"/>
                            <f:selectItem itemLabel="70 - 79" itemValue="70 - 89"/>
                            <f:selectItem itemLabel="80 - 89" itemValue="80 - 89"/>
                            <f:selectItem itemLabel="90 - 99" itemValue="90 - 99"/>
                            <f:selectItem itemLabel="> 100" itemValue="> 100"/>
                        </t:selectOneMenu>
                    </td>
                    <td style="width:100%">&nbsp</td>
                </tr>
                <tr>
                    <td style="width:200px">Trapes størrelse</td>
                    <td style="width:1" required="true">
                        <t:selectOneMenu binding="#{ParticipationAddInfo_Backing.harnessSize}" value="#{ParticipationAddInfo_Backing.participation.harnessSize}" style="width:200px">
                            <f:selectItem itemLabel="Tar med selv" itemValue="empty"/>
                            <f:selectItem itemLabel="46/XS (71-78cm)" itemValue="XS"/>
                            <f:selectItem itemLabel="48/S (76-83cm)" itemValue="S"/>
                            <f:selectItem itemLabel="50/M (81-88cm)" itemValue="M"/>
                            <f:selectItem itemLabel="52/L (86-93cm)" itemValue="L"/>
                            <f:selectItem itemLabel="54/XL (91-98cm)" itemValue="XL"/>
                        </t:selectOneMenu>
                    </td>
                    <td style="width:100%">Målet er hoftevidde</td>
                </tr>
                <tr>
                    <td style="width:200px; white-space:nowrap" nowrap>Ønsker å kite med</td>
                    <td style="width:1">
                        <h:selectOneMenu binding="#{ParticipationAddInfo_Backing.partner}" style="width:200px" converter="ParticipationConverter">
                            <f:selectItems value="#{ParticipationAddInfo_Backing.partnerSelectItems}"/>
                        </h:selectOneMenu>
                    </td>
                    <td style="width:100%">velg blant de registrerte deltagerene, eller</td>
                </tr>
                <tr>
                    <td/>
                    <td style="width:1">
                        <t:inputText binding="#{ParticipationAddInfo_Backing.partnerName}" value="#{ParticipationAddInfo_Backing.participation.partner}" style="width:200px"/>
                    </td>
                    <td style="width:100%">skriv navnet her om deltageren ikke er registrert ennå</td>
                </tr>
            </table>
            <h:commandButton value="Lagre og avslutt" action="#{ParticipationAddInfo_Backing.store}"/>
        </h:form>
        <h:form>
            <h:commandButton value="Avbryt" action="Cancel" immediate="true" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
