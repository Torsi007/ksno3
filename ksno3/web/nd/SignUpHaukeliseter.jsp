
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
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/signUpHaukeliseter.css" />
        <link rel="stylesheet" type="text/css" href="css/skinned-select.css"/>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/default.js"></script>
        <script src="js/logic.js" type="text/javascript"></script>

        <script src="resources/js/logic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                setHiddenFieldsFromRequestParams();
            });

            function setHiddenFieldsFromRequestParams(){
                if(this.location.search != undefined && this.location.search.indexOf("?")>-1 ){
                    var cid = this.location.search.split('=')[1];
                    var courseSelector = document.getElementById("signup:courses");

                    for(var i = 0; i < courseSelector.length; i++){
                        var option = courseSelector.options[i];
                        if(option.value == cid){
                            courseSelector.selectedIndex = i;
                            break;
                        }

                    }
                }
                //coursesChangeHandler();
             
            }
            
            function coursesChangeHandler(){
                var domElemSelect = document.getElementById("signup:courses");
                var selectedValue = domElemSelect.options[domElemSelect.selectedIndex].value;
                var strAwailableSeats = document.getElementById("signup:courseFreeSeats").innerHTML;
                if(strAwailableSeats != undefined){
                    var courseAvailableSeatsEntries = strAwailableSeats.split("~");
                    for(var i = 0; i<courseAvailableSeatsEntries.length; i++){
                        var courseAvailableSeatsEntry = courseAvailableSeatsEntries[i];
                        var courseId = courseAvailableSeatsEntry.split(":")[0];
                        if(courseId == selectedValue){
                            var awailSeats = courseAvailableSeatsEntry.split(":")[1];
                            if(parseInt(awailSeats)> 0){
                                document.getElementById("awailSeatsInfo").innerHTML  = awailSeats + " ledige plasser";    
                            }else{
                                document.getElementById("awailSeatsInfo").innerHTML  = "Dette kurset er fullt. Om du ønsker kan du sette deg på reservelisten (fortsett påmeldingen), vi vil da kontakte deg om noen skulle melde seg av. Et annet alternativ er å velge et annet kurs.";
                            }
                            
                            break;
                        }
                    }
                    
                }
                
            }
                                   
            
        </script>
        <script type="text/javascript" src="js/jquery.skinned-select.js"></script>
    </head>
    <body>
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                Kurset kan muligens være fullt...
                <table style="width:1px;">
                    <tr>		
                        <td required="true" format="email" colspan="2">
                            <span>Email</span>
                            <t:inputText binding="#{SignUpWinter_Backing.email}" style="width:100%"/>
                        </td>	
                    </tr>	
                    <tr>		
                        <td required="true">
                            <span>Fornavn</span>		
                            <t:inputText binding="#{SignUpWinter_Backing.firstName}"/>
                        </td>	
                        <td required="true">
                            <span>Etternavn</span>                            
                            <t:inputText binding="#{SignUpWinter_Backing.lastName}"/>
                        </td>                        
                    </tr>	
                    <tr>		
                        <td required="true" format="phone">
                            <span>Telefon</span>
                            <t:inputText binding="#{SignUpWinter_Backing.phone}"/>
                        </td>	
                        <td>
                            <span>Hjelm størrelse</span>
                            <div class="my-skinnable-select">
                                <t:selectOneMenu required="true" binding="#{SignUpWinter_Backing.helmetSize}" >
                                    <f:selectItem itemLabel="--" itemValue="empty"/>
                                    <f:selectItem itemLabel="Tar med selv!" itemValue="Tar med selv"/>
                                    <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                                    <f:selectItem itemLabel="XL" itemValue="XL"/>
                                    <f:selectItem itemLabel="L" itemValue="L"/>
                                    <f:selectItem itemLabel="M" itemValue="M"/>
                                    <f:selectItem itemLabel="S" itemValue="S"/>
                                    <f:selectItem itemLabel="XS" itemValue="XS"/>
                                </t:selectOneMenu>
                            </div>
                        </td>	
                    </tr>
                     <tr>		
                        <td colspan="2">
                            <span>Kommentar</span>
                            <t:inputTextarea  style="width:100%" rows="3" binding="#{SignUpWinter_Backing.comment}"/>
                        </td>	
                    </tr>                  
                    <tr>		
                        <td colspan="2">
                            <span>Kurs</span>
                            <div class="my-skinnable-select">
                            <t:selectOneMenu id="courses" binding="#{SignUpWinter_Backing.coursesSelect}" >
                                <f:selectItems value="#{SignUpWinter_Backing.coursesSelectItems}"/>
                            </t:selectOneMenu>
                            </div>
                            <t:outputText style="display:none" id="courseFreeSeats" value="#{SignUpWinter_Backing.courseAwailableSeats}"/>
                        </td>	
                    </tr>
                    <tr>		
                        <td required="true" colspan="2">
                            <span  id="awailSeatsInfo"/>
                        </td>	
                    </tr>                     
                    <tr style="display:none">		
                        <td colspan="2" valign="bottom">
                            <h:commandButton id="sbm" value="Meld meg på!" action="#{SignUpWinter_Backing.signOn}" />
                        </td>	
                     </tr>                    
                </table>  
            </h:form>
            <table style="padding:0; margin:0; border-collapse: collapse;">
                <tr>
                    <td>
                        <jsp:include page="Button.jsp" >
                            <jsp:param name="title" value="Meld meg på" />
                            <jsp:param name="link" value="javascript:document.getElementById('signup:sbm').click()"/>
                            <jsp:param name="width" value="306"/>
                        </jsp:include>
                    </td>
                </tr>
            </table>
            <t:outputText styleClass="errorMsg" binding="#{SignUpWinter_Backing.errorMsg}"/>
        </f:view>       
    </body>
</html>
