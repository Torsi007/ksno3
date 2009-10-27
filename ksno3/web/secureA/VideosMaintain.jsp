<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      
        <title>kitesurfing.no - Videoer</title>
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
                <h:dataTable id="dt1" value="#{VideosMaintain_Backing.videos}" binding="#{VideosMaintain_Backing.data}" var="item" first="0" width="100%">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Tittel" />
                        </f:facet> 
                        <h:outputText value="#{item.name}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Opprettet" />
                        </f:facet> 
                        <h:outputText value="#{item.createdDate}">
                            <f:converter converterId="CalendarConverter"/>
                        </h:outputText>
                    </h:column>                    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Forfatter" />
                        </f:facet> 
                        <h:outputText value="#{item.owner.firstName} #{item.owner.lastName}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Category" />
                        </f:facet>
                        <t:selectOneMenu value="#{item.category}" converter="CategoryConverter">
                            <f:selectItems value="#{VideosMaintain_Backing.categorySelectItems}"/>
                       </t:selectOneMenu>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Thumbnail" />
                        </f:facet>
                        <t:htmlTag value="img" style="height:40px">
                            <f:param name="src" value="#{item.thumbnail}"/>

                        </t:htmlTag>
                    </h:column>
                     <h:column>
                        <h:commandLink action="#{VideosMaintain_Backing.videoDelete}">
                            <h:outputText value="Slett"/>
                        </h:commandLink>
                    </h:column>
                </h:dataTable>  
                <input type="button" value="Tilbake til hovedsiden" onclick="toStartPage()"/>
                <h:commandButton value="Opprett ny" action="videoCreate"/>
                <t:commandButton value="Lagre" visibleOnUserRole="admin,internal" action="#{VideosMaintain_Backing.videosUpdate}"/>
                <t:outputText styleClass="errorMsg" binding="#{VideosMaintain_Backing.errorMsg}"/>
            </h:form> 
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>            
        </f:view>
    </body>
<jsp:include page="../Ending.jsp" ></jsp:include>

