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
            #calendarfieldscontainer {height:20px; width:300px;  position:relative}
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
                <h1>Nytt kurs</h1>
                <p>Du er i ferd med å opprette et nytt kurs</p>
                <table>
                    <tr>
                        <td>Start Dato</td>
                        <td required="true">
                            <t:inputText id="startDate" binding="#{BeginnerCourseCreate_Backing.startDate}">   
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
                    </tr>
                    <tr>
                        <td>Slutt Dato</td>
                        <td required="true">
                            <t:inputText id="endDate" binding="#{BeginnerCourseCreate_Backing.endDate}">   
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
                        <td>Instruktører</td>
                        <td>
                            <h:selectManyListbox  size="3"  value="#{BeginnerCourseCreate_Backing.responsibleIds}" binding="#{BeginnerCourseCreate_Backing.slctManyInstructors}">
                                <f:selectItems value="#{BeginnerCourseCreate_Backing.instructorSelectItems}"/>
                            </h:selectManyListbox>                             
                        </td>
                        <td/>
                    </tr>    
                    
                    <tr>
                        <td>Lokasjon</td>
                        <td>
                            <t:selectOneMenu binding="#{BeginnerCourseCreate_Backing.location}" >
                                <f:selectItem itemLabel="Haukeli" itemValue="Haukeli"/>
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
</html>
