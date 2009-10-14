<jsp:include page="../nd/Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

        <title>kitesurfing.no - administrer tekster</title>
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
                <h:dataTable id="dt1" value="#{TextsMaintain_Backing.texts}" binding="#{TextsMaintain_Backing.data}" var="item" first="0" width="100%">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Navn" />
                        </f:facet> 
                        <h:outputText value="#{item.name}"></h:outputText>
                    </h:column>    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Forfatter" />
                        </f:facet> 
                        <h:outputText value="#{item.author.firstName}"></h:outputText>
                    </h:column>                      
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Overskrift" />
                        </f:facet> 
                        <h:outputText value="#{item.subject}"></h:outputText>
                    </h:column>      
                     <h:column>
                        <h:commandLink action="#{TextsMaintain_Backing.textUpdate}">
                            <h:outputText value="Endre"/>
                        </h:commandLink>
                    </h:column>  
                     <h:column>
                        <h:commandLink action="#{TextsMaintain_Backing.textDelete}">
                            <h:outputText value="Slett"/>
                        </h:commandLink>
                    </h:column>                    
                </h:dataTable>  
                <h:commandButton value="Opprett ny tekst" action="textCreate"/>   
                <h:commandButton value="Opprett ny mail tekst" action="emailCreate"/>                   
                <t:outputText styleClass="errorMsg" binding="#{TextsMaintain_Backing.errorMsg}"/>    
            </h:form>    
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>             
        </f:view>
    </body>
<jsp:include page="../nd/Ending.jsp" ></jsp:include>
