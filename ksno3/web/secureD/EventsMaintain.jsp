<%-- 
    Document   : AdminArticles
    Created on : 28.sep.2008, 13:19:26
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function toStartPage(){
                var currentLocation = window.location.href;
                var rootLocation = currentLocation.substring(0,currentLocation.indexOf("/faces/"));
                window.location = rootLocation;
            }
        
        </script>
    </head>
    <body>
        <f:view>
            <h:form>
                <h:dataTable id="dt1" value="#{EventsMaintain_Backing.events}" binding="#{EventsMaintain_Backing.data}" var="item" first="0" width="100%">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Start dato" />
                        </f:facet> 
                        <h:outputText value="#{item.startDate}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Slutt dato" />
                        </f:facet> 
                        <h:outputText value="#{item.endDate}"></h:outputText>
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
                        <h:outputText value="#{item.responsible.firstName}"></h:outputText>
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
                        <h:selectBooleanCheckbox value="#{item.open}"/>
                    </h:column> 
                     <h:column>
                        <h:commandLink action="#{EventsMaintain_Backing.eventUpdate}">
                            <h:outputText value="Endre"/>
                        </h:commandLink>
                    </h:column>  
                     <h:column>
                        <h:commandLink action="#{EventsMaintain_Backing.eventDelete}">
                            <h:outputText value="Slett"/>
                        </h:commandLink>
                    </h:column>                    
                </h:dataTable>  
                <h:commandButton value="Opprett nytt kurs" action="courseCreate"/>   
                <t:outputText styleClass="errorMsg" binding="#{EventsMaintain_Backing.errorMsg}"/>    
                <h:commandButton value="Lagre" action="#{EventsMaintain_Backing.eventsUpdate}"/>                
            </h:form>    
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>             
        </f:view>
    </body>
</html>
