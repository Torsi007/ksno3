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
                    <t:dataList value="#{Current_Backing.coverReferences}" var="bcr">
                        <tr>
                            <td>
                                <h:outputLink value="#{Current_Backing.articleUrl}" styleClass="active" onmouseout="setBackgroundColor('transparent')" onmouseover="setBackgroundColor('#666666')">
                                    <f:param name="id" value="#{bcr.article.id}"/>
                                    <h1>
                                        <h:outputText value="#{bcr.heading}"/>    
                                    </h1>
                                    <p>
                                        <b><h:outputText value="#{bcr.article.createdDate}"/></b>
                                        <h:outputText value="#{bcr.body}"/>    
                                    </p>
                                    
                                </h:outputLink> 
                            </td>
                            <td>
                                <img src="images/action/120x80/halne.jpg"/>
                            </td>                            
                        </tr>
                    </t:dataList>
                </table>
            </h:form> 
            <table cellpadding="0" cellspacing="0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                <tr >
                    <td>			
                        <h1>Vinterkurs</h1>			
                        <p>
                            <b>03.12.2006</b> 
                            Virker dette som en utilnærmelig drøm? Ikke nå lenger! Kitesurfing.no tilbyr i samarbeid med Haukelister Fjellstue kitekurs på Haukelifjell vinteren 2007. Les mer!
                        </p>		
                    </td>
                    <td>
                        <img src="images/action/120x80/halne.jpg"/>
                    </td>
                </tr>
                <tr>
                    <td>			
                        <h1>Digital storytelling</h1>			
                        <p>
                            <b>03.12.2006</b> 				
                            Martin, vår yngste instruktør studerer media på videregående. Et av de obligatoriske prosjektene gikk ut på å lage en såkalt Digital Storytelling. Gjett hva den handler om! Resultatet ble veldig bra synes vi, du kan se det her...   
                        </p>
                        <a href="video/bris_small.wmv">Video 768Kbs</a>
                        <a href="video/bris.wmv">Video 2000Kbs</a> 
                    </td>
                    <td>
                        <img src="images/riders/martin/120x80/martin.jpg"/>
                    </td>
                </tr>
                <tr>
                    <td>			
                        <h1>A perfect day...</h1>	
                        <p>
                            <b>16.07.2006</b>
                        Fredag 14 Juli ble en fantastisk dag på Sele. Kitere, bølgesurfere og windsurfere delte gemyttelig på bølgene...      </p>
                        <a href="slideshow.jsp?slideSet=slides04" target="_blank">Surfslideshow</a> 
                        <a href="slideshow.jsp?slideSet=slides05" target="_blank">Kiteslideshow</a>
                        <a href="slideshow.jsp?slideSet=slides06" target="_blank">Windsurfslideshow</a>
                        <a href="video/PerfectDay_small.wmv">Video 768Kbs</a> 
                        <a href="video/PerfectDay.wmv">Video 2000Kbs</a>
                    </td>
                    <td>
                        <img src="images/articles/PerfectDay2006/120x80/perfect_day.jpg"/>
                    </td>
                </tr>
            </table> 
        </f:view>        
    </body>
</html>		
