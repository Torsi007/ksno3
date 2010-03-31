<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

        <link type="text/css" href="../resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
        <link type="text/css" href="../resources/css/admin.css" rel="stylesheet" />
        <script type="text/javascript" src="../resources/js/jquery-ui.custom.js"></script>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
        <title>Kitesurfing.no - legg til kursdeltager</title>
    </head>
    <body>
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <t:outputText styleClass="errorMsg" binding="#{EventAddParticipant_Backing.errorMsg}"/>
                <table style="border-collapse:collapse" cellpadding="0" cellspacing="0">	
                    <tr>		
                        <td required="true" format="email" colspan="2">
                            <span>Email</span>
                            <t:inputText binding="#{EventAddParticipant_Backing.email}" />
                        </td>	
                    </tr>	
                    <tr>		
                        <td required="true">
                            <span>Fornavn</span>		
                            <t:inputText binding="#{EventAddParticipant_Backing.firstName}"/>
                        </td>	
                        <td required="true">
                            <span>Etternavn</span>                            
                            <t:inputText binding="#{EventAddParticipant_Backing.lastName}"/>
                        </td>                        
                    </tr>
                    <tr>		
                        <td format="phone">
                            <span>Telefon</span>
                            <t:inputText binding="#{EventAddParticipant_Backing.phone}"/>
                        </td>	
                        <td>
                            <span>Hjelm størrelse</span>    
                            <t:selectOneMenu required="true" binding="#{EventAddParticipant_Backing.helmetSize}" >
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
                    <t:htmlTag value="tr" rendered="#{EventAddParticipant_Backing.summerEvent}">
                        <td>
                            <t:outputText value="#{EventAddParticipant_Backing.summerEvent}"/>
                            <span>Våtdrakt størrelse</span>
                            <t:selectOneMenu required="true" binding="#{EventAddParticipant_Backing.wetSuitSize}" >
                                <f:selectItem itemLabel="-" itemValue="empty"/>
                                <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                                <f:selectItem itemLabel="XL" itemValue="XL"/>
                                <f:selectItem itemLabel="L" itemValue="L"/>
                                <f:selectItem itemLabel="M" itemValue="M"/>
                                <f:selectItem itemLabel="S" itemValue="S"/>
                                <f:selectItem itemLabel="XS" itemValue="XS"/>
                            </t:selectOneMenu>
                        </td>
                        <td>
                            <span>Sko størrelse</span>
                            <t:selectOneMenu required="true" binding="#{EventAddParticipant_Backing.shoeSize}" >
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
                    </t:htmlTag>
                    </tr>
                    <t:htmlTag value="tr" rendered="#{EventAddParticipant_Backing.summerEvent}">
                        <td colspan="2">
                            Er interessert i å delta 3. dag (ikke bindende)<t:selectBooleanCheckbox id="thirdDay" binding="#{EventAddParticipant_Backing.thirdDay}"/>
                        </td>
                    </t:htmlTag>
                     <tr>		
                        <td colspan="2">
                            <span>Kommentar</span>
                            <t:inputTextarea rows="3" binding="#{EventAddParticipant_Backing.comment}"/>
                        </td>	
                    </tr>  
                    <tr>		
                        <td colspan="2" height="30" align="right">
                            <t:commandLink id="sbm" styleClass="fg-button ui-state-default ui-corner-all" value="Legg til deltager" action="#{EventAddParticipant_Backing.addParticipant}" />
                            <t:commandLink id="cancel" onmousedown="disableValidate()" styleClass="fg-button ui-state-default ui-corner-all" value="Legg til deltager" value="Avbryt" action="cancel" immediate="true"  />
                        </td>
                     </tr>
                </table>  
            </h:form>
        </f:view>       
    </body>
<jsp:include page="../Ending.jsp" ></jsp:include>

