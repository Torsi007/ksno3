
<%-- 
    Document   : SignUp
    Created on : 07.okt.2008, 20:01:44
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   



<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="resources/css/style.css"/> 
        <style type="text/css">
            #examplecontainer {height:20px; width:300px;  position:relative}
            #show1up { position:absolute; left:0px; top:0px; clear:both}
            #cal2Container { display:none; position:absolute; left:5px; top:0px; z-index:1}
        </style>        
        <link rel="stylesheet" type="text/css" href="resources/js/yui/build/fonts/fonts-min.css" />
        <link rel="stylesheet" type="text/css" href="resources/js/yui/build/calendar/assets/skins/sam/calendar.css" />
        <script type="text/javascript" src="resources/js/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="resources/js/yui/build/calendar/calendar-min.js"></script>
        <script type="text/javascript">
            YAHOO.namespace("ksno.signup.calendar");

            YAHOO.ksno.signup.calendar.init = function() {
                
                function handleSelect(type,args,obj) {
                    var dates = args[0];
                    var date = dates[0];
                    var year = date[0], month = date[1], day = date[2];
                    
                    if(month < 10){month = "0" + month};
                    if(day < 10){day = "0" + day};

                    var txtDate1 = document.getElementById("signup:dob");
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





                YAHOO.ksno.signup.calendar.cal2 = new YAHOO.widget.Calendar("cal2","cal2Container", {navigator:navConfig} );
                YAHOO.ksno.signup.calendar.cal2.selectEvent.subscribe(handleSelect, YAHOO.ksno.signup.calendar.cal2, true);
                YAHOO.ksno.signup.calendar.cal2.render();

                YAHOO.util.Event.addListener("show1up", "click", YAHOO.ksno.signup.calendar.cal2.show, YAHOO.ksno.signup.calendar.cal2, true);
            }
            YAHOO.util.Event.onDOMReady(YAHOO.ksno.signup.calendar.init);



           


            function validate(){
                alert(event.srcElement.id);
                /*id = src.id;
               lastColon = id.lastIndexOf(':');
               if (lastColon == -1) {
                 basePath = "";
               } else {
                    basePath = id.substring(0, lastColon + 1);*/
                
                return false;
               
                
            }            
            
            function signup() 
            {
                if ( validateInput() ) {
                    document.getElementById("signupForm").submit();		
                }	
            } 	
        
            function validateInput() {
                if ( !checkField("firstName", "First Name") )
                    return false;
                else if ( !checkField("lastName", "Last Name") )
                    return false;		
                else if ( !checkField("email", "Email") )			
                    return false;		
                else if ( !checkEmail("email", "Email") )			
                    return false;		
                else			
                    return true;	
            } 	
        
            function checkField(fieldId, outputName) {		
                var element = document.getElementById(fieldId);		
                if (element.value == "") {
                    alert("The field '" + outputName + "' cannot be blank.");
                    element.focus();
                    return false;		
                } else {
                    return true;		
                }	
            } 	
        
            function checkEmail(fieldId, outputName) {
                var element = document.getElementById(fieldId);
                var returnString = true;
                if (element.value.indexOf("@") == -1) {
                    returnString = false;		
                } else if (element.value.indexOf("\'") != -1) {
                    returnString = false;		
                } else if (element.value.indexOf("\"") != -1) {
                    returnString = false;
                }
                if (!returnString) {
                    alert("The value in field '" + outputName + "' is invalid.");
                    element.focus();
                }		
                return returnString;
            }
        </script>
        
    </head>
    <body class="signup  yui-skin-sam">
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <table>	
                    <tr>		
                        <td>Email</td>		
                        <td colspan="2">
                            <t:inputText required="true" binding="#{SignUp_Backing.email}"/>
                        </td>	
                    </tr>	
                    <tr>		
                        <td>Passord</td>		
                        <td colspan="2">
                            <t:inputSecret required="true" binding="#{SignUp_Backing.password}"/>
                        </td>	
                    </tr>	                    
                    <tr>		
                        <td>Fornavn</td>		
                        <td colspan="2">
                            <t:inputText required="true" binding="#{SignUp_Backing.firstName}"/>
                        </td>	
                    </tr>	
                    <tr>		
                        <td>Etternavn</td>		
                        <td colspan="2">
                            <t:inputText required="true" binding="#{SignUp_Backing.lastName}"/>
                        </td>	
                    </tr>	
                    <tr>		
                        <td>Telefon</td>		
                        <td colspan="2">
                            <t:inputText required="true" binding="#{SignUp_Backing.phone}"/>
                        </td>	
                    </tr>
                    <tr>		
                        <td>Fødselsdato (yyyy-MM-dd)</td>		
                        <td>
                            <t:inputText id="dob" required="true"  binding="#{SignUp_Backing.dob}" >                  
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>	
                        <td>
                            <div id="examplecontainer">
                                <img src="../resources/img/components/icons/EN_flag.gif" id="show1up"/>
                              
                                <div id="cal2Container"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>		
                        <td>Våtdrakt størrelse</td>		                    
                        <td colspan="2">
                            <t:selectOneMenu required="true" binding="#{SignUp_Backing.wetSuitSize}" >
                                <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                                <f:selectItem itemLabel="XL" itemValue="XL"/>
                                <f:selectItem itemLabel="L" itemValue="L"/>
                                <f:selectItem itemLabel="M" itemValue="M"/>
                                <f:selectItem itemLabel="S" itemValue="S"/>
                                <f:selectItem itemLabel="XS" itemValue="XS"/>
                            </t:selectOneMenu>  
                        </td>	
                    </tr>	
                    <tr>		
                        <td>Sko størrelse</td>		                    
                        <td colspan="2">
                            <t:selectOneMenu required="true" binding="#{SignUp_Backing.shoeSize}" >
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
                        </td>	
                    </tr>	
                    <tr>		
                    <tr>		
                        <td>Hjelm størrelse</td>		                    
                        <td colspan="2">
                            <t:selectOneMenu required="true" binding="#{SignUp_Backing.helmetSize}" >
                                <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                                <f:selectItem itemLabel="XL" itemValue="XL"/>
                                <f:selectItem itemLabel="L" itemValue="L"/>
                                <f:selectItem itemLabel="M" itemValue="M"/>
                                <f:selectItem itemLabel="S" itemValue="S"/>
                                <f:selectItem itemLabel="XS" itemValue="XS"/>
                            </t:selectOneMenu>  
                        </td>	
                    </tr>                    
                    <tr>		
                        <td>Kursdato</td>		
                        <td colspan="2">			
                            <t:selectOneMenu required="true" value="#{SignUp_Backing.courseId}" >
                                <f:selectItems value="#{SignUp_Backing.coursesSelectItems}"/>
                            </t:selectOneMenu>  
                        </td>	
                    </tr>	
                </table>  
                <h:commandButton value="Meld meg på!" action="#{SignUp_Backing.signOn}" />                                                                
                <h:commandButton value="Avbryt" action="Cancel" />
            </h:form> 
        </f:view>       
    </body>
</html>
