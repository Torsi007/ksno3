<%-- 
    Document   : CreateArticle
    Created on : 16.sep.2008, 18:59:01
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oppdater text</title>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
    </head>
    <body class="yui-skin-sam">
        <f:view>
            <h:form id="course" onsubmit="return validate()">
                <h1>Oppdater tekst</h1>
                <table style="width:100%">
                    <tr>
                        <td>Navn</td>
                        <td>
                            <t:outputText id="it1" value="#{TextModify.name}" />                        
                        </td>
                        <td/>
                    </tr> 
                    <tr>
                        <td>Overskrift</td>
                        <td required="true">
                            <t:inputText id="it2" value="#{TextModify.subject}" />                        
                        </td>
                        <td/>
                    </tr>  
                    <tr>
                        <td>To mottakere</td>
                        <td required="true">
                            <t:inputText id="it3" value="#{TextModify.toRecipients}" />                        
                        </td>
                        <td>Mottaker(e), om flere komma separert</td>
                    </tr>  
                    <tr>
                        <td>CC mottakere</td>
                        <td>
                            <t:inputText id="it4" value="#{TextModify.ccRecipients}" />                        
                        </td>
                        <td>Mottaker(e), om flere komma separert</td>
                    </tr>                    
                     <tr>
                        <td colspan="3">Text</td>
                    </tr>                       
                     <tr>
                        <td colspan="3">
                            <t:inputTextarea required="true" value="#{TextModify.body}"  rows="15" cols="40" style="width: 100%"/> 
                        </td>
                    </tr>    
                </table>                
                <h:commandButton value="Lagre og avslutt" action="#{EmailUpdate_Backing.update}" />                                                                
                <t:outputText binding="#{EmailUpdate_Backing.errorMsg}"/>
            </h:form>  
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>
        </f:view>
    </body>
</html>
