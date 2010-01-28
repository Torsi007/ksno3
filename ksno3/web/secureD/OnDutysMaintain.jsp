<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      
        <title>kitesurfing.no - Videoer</title>
    </head>
    <body>
        <f:view>
            <h:form>
                <h:dataTable id="dt1" value="#{OnDutysMaintain_Backing.onDutys}" binding="#{VideosMaintain_Backing.data}" var="item" first="0" width="100%">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Fra" />
                        </f:facet> 
                        <h:outputText value="#{item.fromDate}">
                            <f:converter converterId="CalendarConverter"/>
                        </h:outputText>
                    </h:column>                    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Instruktør" />
                        </f:facet> 
                        <h:outputText value="#{item.instructor.firstName}"></h:outputText>
                    </h:column>
                </h:dataTable>  
                <t:outputText styleClass="errorMsg" binding="#{OnDutysMaintain_Backing.errorMsg}"/>
            </h:form> 
        </f:view>
    </body>
<jsp:include page="../Ending.jsp" ></jsp:include>

