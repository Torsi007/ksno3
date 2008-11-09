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
        <script src="../resources/js/logic.js" type="text/javascript"></script>
    </head>
    <body>
        <f:view>
            <h:form onsubmit="return validate()">
                <h1>Nytt kurs</h1>
                <p>Du er i ferd med å opprette et nytt kurs</p>
                <table>
                    <tr>
                        <td>Start Dato</td>
                        <td required="true">
                            <t:inputText binding="#{BeginnerCourseCreate_Backing.startDate}">   
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>
                        <td>Format: yyyy-MM-dd</td>
                    </tr>
                    <tr>
                        <td>Slutt Dato</td>
                        <td required="true">
                            <t:inputText binding="#{BeginnerCourseCreate_Backing.endDate}">   
                                <f:convertDateTime pattern="yyyy-MM-dd"/>
                            </t:inputText>
                        </td>
                        <td>Format: yyyy-MM-dd</td>
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
                        <td required="true">
                            <t:inputText id="it2" binding="#{BeginnerCourseCreate_Backing.maxSize}" />                        
                        </td>
                        <td/>
                    </tr>  
                    <tr>
                        <td>Åpent kurs</td>
                        <td>                    
                            <t:selectBooleanCheckbox binding="#{BeginnerCourseCreate_Backing.open}"/>
                        </td>
                        <td/>   
                    </tr> 
                    
                     <tr>
                        <td>Ansvarlig</td>
                        <td>
                            
                            <t:selectOneMenu value="#{BeginnerCourseCreate_Backing.responsibleId}" >
                                <f:selectItems value="#{BeginnerCourseCreate_Backing.instructorSelectItems}"/>
                            </t:selectOneMenu> 

                        </td>
                        <td/>
                    </tr>    
                    
                    <tr>
                        <td>Lokasjon</td>
                        <td>
                            <t:selectOneMenu binding="#{BeginnerCourseCreate_Backing.location}" >
                                <f:selectItem itemLabel="Haukeli" itemValue="Haukeli"/>
                                <f:selectItem itemLabel="Jæren" itemValue="Jæren"/>                                
                            </t:selectOneMenu>    
                        </td>
                        <td/>
                    </tr>  
                    
                </table>
                <h:commandButton value="Lagre og avslutt" action="#{BeginnerCourseCreate_Backing.createCourse}" />                                                                
                <t:outputText binding="#{BeginnerCourseCreate_Backing.errorMsg}"/>
            </h:form>  
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>
        </f:view>
    </body>
</html>
