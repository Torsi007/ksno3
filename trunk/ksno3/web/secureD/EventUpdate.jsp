<%-- 
    Document   : CreateArticle
    Created on : 16.sep.2008, 18:59:01
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nytt kurs</title>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
        <style type="text/css">
            #calendarfieldscontainer {height:20px; width:20px;  position:relative}
            #calendaricon { position:absolute; left:0px; top:0px; clear:both}
            #calendarcontainer { display:none; position:absolute; left:5px; top:0px; z-index:1}
            
            #calendarfieldscontainer1 {height:20px; width:300px;  position:relative}
            #calendaricon1 { position:absolute; left:0px; top:0px; clear:both}
            #calendarcontainer1 { display:none; position:absolute; left:5px; top:0px; z-index:1}           
        </style>   
        <link rel="stylesheet" type="text/css" href="../resources/js/yui/build/fonts/fonts-min.css" />
        <link rel="stylesheet" type="text/css" href="../resources/js/yui/build/calendar/assets/skins/sam/calendar.css" />
        <script type="text/javascript" src="../resources/js/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="../resources/js/yui/build/calendar/calendar-min.js"></script>
      
    </head>
    <body class="yui-skin-sam">
        <f:view>
            <h:form id="course" onsubmit="return validate()">
                <h1>Oppdater kurs</h1>
                <table>
                    <tr>
                        <td>Start Dato</td>
                        <td required="true">
                            <t:inputText id="startDate" value="#{EventModify.startDate}">   
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>
                        <td style="overflow:hidden; width:20">
                            <script type="text/javascript">
                                YAHOO.namespace("ksno.signup.calendar");

                                YAHOO.ksno.signup.calendar.init = function() {

                                    function handleSelect(type,args,obj) {
                                        var dates = args[0];
                                        var date = dates[0];
                                        var year = date[0], month = date[1], day = date[2];

                                        if(month < 10){month = "0" + month};
                                        if(day < 10){day = "0" + day};

                                        var txtDate1 = document.getElementById("course:startDate");
                                        txtDate1.value = year + "-" + month + "-" + day;
                                        obj.hide();
                                    }   


                                      var navConfig = {
                                            strings : {
                                                month: "Choose Month",
                                                year: "Enter Year",
                                                submit: "OK",
                                                cancel: "Cancel",
                                                invalidYear: "Please enter a valid year"
                                            },
                                            monthFormat: YAHOO.widget.Calendar.SHORT,
                                            initialFocus: "year"
                                      };

                                    YAHOO.ksno.signup.calendar.calStartDate = new YAHOO.widget.Calendar("calStartDate","calendarcontainer", {navigator:navConfig} );
                                    YAHOO.ksno.signup.calendar.calStartDate.selectEvent.subscribe(handleSelect, YAHOO.ksno.signup.calendar.calStartDate, true);
                                    YAHOO.ksno.signup.calendar.calStartDate.render();

                                    YAHOO.util.Event.addListener("calendaricon", "click", YAHOO.ksno.signup.calendar.calStartDate.show, YAHOO.ksno.signup.calendar.calStartDate, true);
                                }
                                YAHOO.util.Event.onDOMReady(YAHOO.ksno.signup.calendar.init);

                            </script>                              
                            <div id="calendarfieldscontainer">
                                <img src="../resources/img/components/icons/calendar.bmp" id="calendaricon"/>
                                <div id="calendarcontainer"></div>
                            </div>
                        </td>
                        <td>Slutt Dato</td>
                        <td required="true">
                            <t:inputText id="endDate" value="#{EventModify.endDate}">   
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>
                        <td>
                            <script type="text/javascript">
                                YAHOO.namespace("ksno.signup.calendar");

                                YAHOO.ksno.signup.calendar.init = function() {

                                    function handleSelect(type,args,obj) {
                                        var dates = args[0];
                                        var date = dates[0];
                                        var year = date[0], month = date[1], day = date[2];

                                        if(month < 10){month = "0" + month};
                                        if(day < 10){day = "0" + day};

                                        var txtDate1 = document.getElementById("course:endDate");
                                        txtDate1.value = year + "-" + month + "-" + day;
                                        obj.hide();
                                    }   


                                      var navConfig = {
                                            strings : {
                                                month: "Choose Month",
                                                year: "Enter Year",
                                                submit: "OK",
                                                cancel: "Cancel",
                                                invalidYear: "Please enter a valid year"
                                            },
                                            monthFormat: YAHOO.widget.Calendar.SHORT,
                                            initialFocus: "year"
                                      };

                                    YAHOO.ksno.signup.calendar.calEndDate = new YAHOO.widget.Calendar("calEndDate","calendarcontainer1", {navigator:navConfig} );
                                    YAHOO.ksno.signup.calendar.calEndDate.selectEvent.subscribe(handleSelect, YAHOO.ksno.signup.calendar.calEndDate, true);
                                    YAHOO.ksno.signup.calendar.calEndDate.render();

                                    YAHOO.util.Event.addListener("calendaricon1", "click", YAHOO.ksno.signup.calendar.calEndDate.show, YAHOO.ksno.signup.calendar.calEndDate, true);
                                }
                                YAHOO.util.Event.onDOMReady(YAHOO.ksno.signup.calendar.init);

                            </script>                              
                            <div id="calendarfieldscontainer1">
                                <img src="../resources/img/components/icons/calendar.bmp" id="calendaricon1"/>
                                <div id="calendarcontainer1"></div>
                            </div>                           
                        </td>
                    </tr>  
                    <tr>
                        <td>Kommentar</td>
                        <td colspan="5">
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
                        <td>Ansvarlig</td>
                        <td>
                            <t:selectOneMenu value="#{EventModify.responsible.id}" >
                                <f:selectItems value="#{EventUpdate_Backing.instructorSelectItems}"/>
                            </t:selectOneMenu>
                        </td>
                    </tr>    
                    
                    <tr>
                        <td>Lokasjon</td>
                        <td>
                            <t:selectOneMenu value="#{EventModify.location}" >
                                <f:selectItem itemLabel="Haukeli" itemValue="Haukeli"/>
                                <f:selectItem itemLabel="Jæren" itemValue="Jæren"/>                                
                            </t:selectOneMenu>    
                        </td>
                        <td colsapn="4"/>
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
</html>
