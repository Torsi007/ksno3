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
        <title>Nytt kurs</title>
    </head>
    <body>
        <f:view>
            <h:form enctype="multipart/form-data">
                <h1>Nytt kurs</h1>
                <p>Du er i ferd med å opprette et nytt kurs</p>
                <table>
                    <tr>
                        <td>Start Dato</td>
                        <td>
                            <t:inputText required="true" binding="#{BeginnerCourseCreate_Backing.startDate}">   
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>
                        <td/>
                    </tr>
                    <tr>
                        <td>Slutt Dato</td>
                        <td>
                            <t:inputText required="true" binding="#{BeginnerCourseCreate_Backing.endDate}">   
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>
                        <td/>
                    </tr>                    
                    <tr>
                        <td>Kommentar</td>
                        <td>
                            <t:inputText id="it1" binding="#{BeginnerCourseCreate_Backing.comment}" />                        
                        </td>
                        <td/>
                    </tr> 
                    <tr>
                        <td>Ant plasser</td>
                        <td>
                            <t:inputText id="it2" required="true" binding="#{BeginnerCourseCreate_Backing.maxSize}" />                        
                        </td>
                        <td/>
                    </tr>  
                    <tr>
                        <td>Lokasjon</td>
                        <td>
                            <t:selectOneMenu required="true" binding="#{BeginnerCourseCreate_Backing.location}" >
                                <f:selectItem itemLabel="Haukeli" itemValue="Haukeli"/>
                                <f:selectItem itemLabel="Jæren" itemValue="Jæren"/>                                
                            </t:selectOneMenu>    
                        </td>
                        <td/>
                    </tr>  
                    
                </table>
                <h:commandButton value="Lagre og avslutt" action="#{BeginnerCourseCreate_Backing.createCourse}" />                                                                
                <h:commandButton value="Avbryt" action="Cancel" />                                                                
            </h:form>        
        </f:view>
    </body>
</html>
