<%-- 
    Document   : Current
    Created on : 15.sep.2008, 19:41:14
    Author     : halsnehauge
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%--
    This file is an entry point for JavaServer Faces application.
--%>


<html>	
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
    <script src="resources/js/logic.js" type="text/javascript"></script>	
    <script src="resources/js/layout.js" type="text/javascript"></script>	
    <body class="article" >
        <f:view>
            <h:form>
                <t:dataList value="#{Article_Backing.article.sections}" var="section">
                    <div>
                        <h1><h:outputText value="#{section.heading}"/></h1>
                        <p>
                            <div class="imageContainer">
                                <img alt="Hardangervidda 2004" src="images/action/hardangervidda.jpg" style="display:block"/>
                            </div>
                        </p>
                        <p>
                            <h:outputText value="#{section.body}"/>            
                        </p>
                    </div>
                </t:dataList>
                
            </h:form> 
        </f:view>        
    </body>
</html>	









