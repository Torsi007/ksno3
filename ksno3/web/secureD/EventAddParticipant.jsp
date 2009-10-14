<jsp:include page="../nd/Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

        <link rel="stylesheet" type="text/css" href="../resources/css/style.css"/> 
        <script src="../resources/js/logic.js" type="text/javascript"></script>
        <style type="text/css">
            input {margin-right:4}
            select {margin-right:4}          
        </style>                
        <title>Kitesurfing.no - legg til kursdeltager</title>
    </head>
    <body>
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <table style="border-collapse:collapse" cellpadding="0" cellspacing="0">	
                    <tr>		
                        <td required="true" format="email" colspan="2">
                            <span style="display:block; margin-top:8">Email</span>
                            <t:inputText style="width:100%;" binding="#{EventAddParticipant_Backing.email}" />
                        </td>	
                    </tr>	
                    <tr>		
                        <td required="true">
                            <span style="display:block; margin-top:8">Fornavn</span>		
                            <t:inputText style="width:98" binding="#{EventAddParticipant_Backing.firstName}"/>
                        </td>	
                        <td required="true">
                            <span style="display:block; margin-top:8">Etternavn</span>                            
                            <t:inputText style="width:98" binding="#{EventAddParticipant_Backing.lastName}"/>
                        </td>                        
                    </tr>	
                    <tr>		
                        <td required="true" format="phone">
                            <span style="display:block; margin-top:8">Telefon</span>
                            <t:inputText style="width:98" binding="#{EventAddParticipant_Backing.phone}"/>
                        </td>	
                        <td>
                            <span style="display:block; margin-top:8">Hjelm størrelse</span>    
                            <t:selectOneMenu style="width:98" required="true" binding="#{EventAddParticipant_Backing.helmetSize}" >
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
                        <td required="true">
                            <span style="display:block; margin-top:8">Våtdrakt størrelse</span>                            
                            <t:selectOneMenu  style="width:98" required="true" binding="#{EventAddParticipant_Backing.wetSuitSize}" >
                                <f:selectItem itemLabel="-" itemValue="empty"/>
                                <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                                <f:selectItem itemLabel="XL" itemValue="XL"/>
                                <f:selectItem itemLabel="L" itemValue="L"/>
                                <f:selectItem itemLabel="M" itemValue="M"/>
                                <f:selectItem itemLabel="S" itemValue="S"/>
                                <f:selectItem itemLabel="XS" itemValue="XS"/>
                            </t:selectOneMenu>  
                        </td>	
                        <td required="true" align="right">
                            <span style="display:block; margin-top:8">Sko størrelse</span>                            
                            <t:selectOneMenu style="width:98" required="true" binding="#{EventAddParticipant_Backing.shoeSize}" >
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
                        </td>	
                    </tr>                    
                     <tr>		
                        <td colspan="2">
                            <span style="display:block; margin-top:8">Kommentar</span>
                            <t:inputTextarea  style="width:100%" rows="3" binding="#{EventAddParticipant_Backing.comment}"/>
                        </td>	
                    </tr>  
                    <tr style="display:none">		
                        <td colspan="2" valign="bottom">
                            <h:commandButton id="sbm" style="width:98" value="Legg til deltager" action="#{EventAddParticipant_Backing.addParticipant}" />
                        </td>	
                     </tr>
                </table>  
            </h:form>
            <h:form><h:commandButton id="cancel" style="width:98" value="Avbryt" action="cancel" immediate="true" /></h:form>
                <table style="border-collapse:collapse" cellpadding="0" cellspacing="0">
                    <tr>		
                        <td valign="bottom">
                            <input onclick="document.getElementById('signup:sbm').click()" type="submit" value="Legg til deltager" style="width:98" /> 
                        </td>	
                    </tr>                    
                </table>  
                <t:outputText styleClass="errorMsg" binding="#{EventAddParticipant_Backing.errorMsg}"/>
        </f:view>       
    </body>
<jsp:include page="../nd/Ending.jsp" ></jsp:include>

