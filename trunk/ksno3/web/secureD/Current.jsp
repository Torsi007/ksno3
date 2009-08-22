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
                <table cellpadding="0" cellspacing="0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <t:dataList value="#{Current_Backing.articles}" var="article">
                        
                        <t:htmlTag styleClass="active" value="tr" rendered="#{article.body != null}" >
                            <f:param name="onclick" value="setThisContent('#{Current_Backing.articleUrl}?id=#{article.id}')" />
                            <f:param name="onmouseout" value="setBackgroundColor('transparent'); setBackground(event)" />
                            <f:param name="onmouseover" value="setBackgroundColor('#666666'); setBackground(event)" />
                            <td>
                                    <h1>
                                        <h:outputText value="#{article.name}"/>    
                                    </h1>
                                    <b><h:outputText value="#{article.createdDate}"/></b>
                                    <h:outputText value="#{article.intro}" escape="false"/>    
                            </td>
                            <td>
                                <t:graphicImage url="#{article.avatarUrl}"/>
                            </td>                            
                        </t:htmlTag>
                        <t:htmlTag value="tr" rendered="#{article.body == null}">
                            <td>
                                <h1>
                                    <h:outputText value="#{article.name}"/>    
                                </h1>
                                    <b><h:outputText value="#{article.createdDate}"/></b>
                                    <h:outputText value="#{article.intro}" escape="false"/>    
                            </td>
                            <td>
                                <t:graphicImage url="#{article.avatarUrl}"/>
                            </td>                            
                        </t:htmlTag>                        
                    </t:dataList>
                </table>
            </h:form> 
        </f:view>        
    </body>
</html>		
