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
                <h:dataTable id="dt1" value="#{AdminArticle_Backing.articles}" var="item" first="0" width="100%">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Name" />
                        </f:facet> 
                        <h:outputText value="#{item.name}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Created date" />
                        </f:facet> 
                        <h:outputText value="#{item.createdDate}"></h:outputText>
                    </h:column>                    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Author" />
                        </f:facet> 
                        <h:outputText value="#{item.author.firstName} #{item.author.lastName}"></h:outputText>
                    </h:column>                                        
                    <h:column>
                        <h:commandLink action="#{AdminArticle_Backing.selectEditArticle}">
                            <h:outputText value="Modify"/>
                        </h:commandLink>
                    </h:column>                                                            
                </h:dataTable>                
                <h:commandButton value="Lag ny artikkel" action="CreateArticle" /> 
                <input type="button" value="Tilbake til hovedsiden" onclick="toStartPage()"/>
            </h:form>        
        </f:view>
    </body>
</html>
