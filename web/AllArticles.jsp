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
    <body class="current" >
        <f:view>
            <h:form>
                    <t:dataList value="#{Current_Backing.articles}" var="article">
                        <div>
                            <h1><h:outputText value="#{article.name}"/></h1>
                            <f:verbatim><h:outputText escape="false" value="#{article.body}"/></f:verbatim>
                            <hr>
                        </div>
                    </t:dataList>
                </table>
            </h:form> 
        </f:view>        
    </body>
</html>		
