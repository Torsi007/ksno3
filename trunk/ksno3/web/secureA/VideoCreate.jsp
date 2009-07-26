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
        <title>Ny text</title>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
    </head>
    <body>
        <f:view>
            <h:form id="text" onsubmit="return validate()">
                <h1>Nytt kurs</h1>
                <p>Du er i ferd med å opprette en ny video</p>
                <table>
                    <tr>
                        <td>Navn</td>
                        <td required="true">
                            <t:inputText id="it1" binding="#{VideoCreate_Backing.name}" />
                        </td>
                        <td/>
                    </tr> 
                    <tr>
                        <td>Url</td>
                        <td required="true">
                            <t:inputText id="it2" binding="#{VideoCreate_Backing.url}" />
                        </td>
                        <td/>
                    </tr>
                </table>
                <h:commandButton value="Lagre og avslutt" action="#{VideoCreate_Backing.createVideo}" />
                <t:outputText binding="#{VideoCreate_Backing.errorMsg}"/>
            </h:form>  
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>
        </f:view>
    </body>
</html>
