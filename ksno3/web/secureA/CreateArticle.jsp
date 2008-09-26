<%-- 
    Document   : CreateArticle
    Created on : 16.sep.2008, 18:59:01
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
        <title>Ny article</title>
    </head>
    <body>
        <f:view>
            <h:form>
                <h1>Ny artikkel</h1>
                <p>Du er i ferd med å opprette en ny artikkel</p>
                <table>
                    <tr>
                        <td>Navn</td>
                        <td>
                            <t:inputText id="it1" required="true" binding="#{AdminArticle_Backing.name}"/>                        
                        </td>
                        <td/>
                    </tr>
                    <tr>
                        <td>Intro text (vil dukke opp på forsiden)</td>
                        <td>
                            <t:inputText required="true" binding="#{AdminArticle_Backing.intro}"/>                        
                        </td>
                        <td/>
                    </tr>                    
                   <tr>
                        <td>Eskstra forfattere</td>
                        <td>
                            Trenger en dropdown liste her for å kunne velge en eller flere forfattere                        
                        </td>
                        <td>Du vil automatisk bli satt opp som en av forfatterene</td>
                    </tr>                    
                   <tr>
                        <td>Kategorier</td>
                        <td>
                            Trenger noen checkboxer her for å kunne sette kategorier, eks Utsyr : Reise : Sport info : Teknikk osv...                        
                        </td>
                        <td>Du vil automatisk bli satt opp som en av forfatterene</td>
                    </tr>                                        
                </table>
                <h:commandButton value="Gå videre" action="#{AdminArticle_Backing.createArticle}" />                                                
            </h:form>        
        </f:view>
    </body>
</html>
