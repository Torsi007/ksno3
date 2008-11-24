
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
        <script src="resources/js/logic.js" type="text/javascript"></script>
        <style type="text/css">
            input {margin-right:4}
            select {margin-right:4}          
        </style>    
        <script type="text/javascript">
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
                coursesChangeHandler();
             
            }
            
            function goBack(){
               window.location = 'courses_winter.jsp#when';
            }
            
            function coursesChangeHandler(){
                var domElemSelect = document.getElementById("signup:courses");
                var selectedValue = domElemSelect.options[domElemSelect.selectedIndex].value;
                var strAwailableSeats = document.getElementById("signup:courseFreeSeats").value;
                if(strAwailableSeats != undefined){
                    var courseAvailableSeatsEntries = strAwailableSeats.split("~");
                    for(var i = 0; i<courseAvailableSeatsEntries.length; i++){
                        var courseAvailableSeatsEntry = courseAvailableSeatsEntries[i];
                        var courseId = courseAvailableSeatsEntry.split(":")[0];
                        if(courseId == selectedValue){
                            var awailSeats = courseAvailableSeatsEntry.split(":")[1];
                            if(parseInt(awailSeats)> 0){
                                document.getElementById("awailSeatsInfo").innerHTML  = awailSeats + "Ledige plasser";    
                            }else{
                                document.getElementById("awailSeatsInfo").innerHTML  = "Dette kurset er fullt. Om du ønsker kan du sette deg på reservelisten (fortsett påmeldingen), vi vil da kontakte deg om noen skulle melde seg av. Et annet alternativ er å velge et annet kurs.";
                            }
                            
                            break;
                        }
                    }
                    
                }
                
            }
                            
            
        </script>
       
    </head>
    <body class="signup" onload="setHiddenFieldsFromRequestParams()">
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <table style="border-collapse:collapse" cellpadding="0" cellspacing="0">	
                    <tr>		
                        <td required="true" format="email" colspan="2">
                            <span style="display:block; margin-top:8">Email</span>
                            <t:inputText style="width:100%;" binding="#{SignUpWinter_Backing.email}" />
                        </td>	
                    </tr>	
                    <tr>		
                        <td required="true">
                            <span style="display:block; margin-top:8">Fornavn</span>		
                            <t:inputText style="width:98" binding="#{SignUpWinter_Backing.firstName}"/>
                        </td>	
                        <td required="true">
                            <span style="display:block; margin-top:8">Etternavn</span>                            
                            <t:inputText style="width:98" binding="#{SignUpWinter_Backing.lastName}"/>
                        </td>                        
                    </tr>	
                    <tr>		
                        <td required="true" format="phone">
                            <span style="display:block; margin-top:8">Telefon</span>
                            <t:inputText style="width:98" binding="#{SignUpWinter_Backing.phone}"/>
                        </td>	
                        <td>
                            <span style="display:block; margin-top:8">Hjelm størrelse</span>    
                            <t:selectOneMenu style="width:98" required="true" binding="#{SignUpWinter_Backing.helmetSize}" >
                                <f:selectItem itemLabel="Tar med selv!" itemValue="empty"/>                                
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
                        <td colspan="2">
                            <span style="display:block; margin-top:8">Kommentar</span>
                            <t:inputTextarea  style="width:100%" rows="3" binding="#{SignUpWinter_Backing.comment}"/>
                        </td>	
                    </tr>                  
                    <tr>		
                        <td colspan="2">
                            <span style="display:block; margin-top:8">Kursdato</span>
                            <t:selectOneMenu id="courses" style="width:200" binding="#{SignUpWinter_Backing.coursesSelect}" onchange="coursesChangeHandler()">
                                <f:selectItems value="#{SignUpWinter_Backing.coursesSelectItems}"/>
                            </t:selectOneMenu>  
                            <t:inputHidden id="courseFreeSeats" value="#{SignUpWinter_Backing.courseAwailableSeats}"/>
                        </td>	
                    </tr>
                    <tr>		
                        <td required="true" colspan="2">
                            <span style="width:200" id="awailSeatsInfo"/>
                        </td>	
                    </tr>                    
                    <tr style="display:none">		
                        <td colspan="2" valign="bottom">
                            <h:commandButton id="sbm" style="width:98" value="Meld meg på!" action="#{SignUpWinter_Backing.signOn}" />
                        </td>	
                     </tr>                    
                </table>  

            </h:form>
                <table style="border-collapse:collapse" cellpadding="0" cellspacing="0">
                    <tr>		
                        <td valign="bottom">
                            <input onclick="document.getElementById('signup:sbm').click()" type="submit" value="Meld meg på!" style="width:98" /> 
                        </td>	
                        <td valign="bottom">
                            <input onclick="goBack()" type="submit" value="Avbryt!" style="width:98" /> 
                        </td>	
                    </tr>                    
                </table>  
                <t:outputText styleClass="errorMsg" binding="#{SignUpWinter_Backing.errorMsg}"/>
        </f:view>       
    </body>
</html>
