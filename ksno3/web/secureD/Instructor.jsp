<%-- 
    Document   : CreateArticle
    Created on : 16.sep.2008, 18:59:01
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oppdater instruktørdata</title>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
        <script src="../resources/js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script type="text/javascript">

        
        function validate_local(){
            var textarea = tinyMCE.get(event.srcElement.id + ':myTextArea'); 
            if ( (textarea.getContent()=="") || (textarea.getContent()==null) ) {
                    alert("Felt kan ikke være tomt");
                    textarea.focus();
                    return false; 
            }else{
                return validate();
            }             
        }

    </script>               
    </head>
    <body>
        <f:view>
            <h:form enctype="multipart/form-data" onsubmit="return validate_local()">
                <h1>Instruktørprofil</h1>
                <table width="100%">
                    <tr>
                        <td style="width:1">Fornavn</td>
                        <td style="width:1" required="true">
                            <t:inputText label="test" id="firstName" required="true" value="#{Instructor_Backing.instructor.firstName}">
                            </t:inputText>
                        </td>
                        <td style="width:100%">&nbsp</td>                    
                    </tr>
                    <tr>
                        <td style="width:1">Etternavn</td>
                        <td style="width:1" required="true">
                            <t:inputText label="test" id="lastName" required="true" value="#{Instructor_Backing.instructor.lastName}">
                            </t:inputText>
                        </td>
                        <td style="width:100%">&nbsp</td>
                    </tr>
                    <tr>
                        <td style="width:1">Kontonummer</td>
                        <td style="width:1" required="true">
                            <t:inputText label="test" id="account" required="true" value="#{Instructor_Backing.instructor.accountNumber}">
                            </t:inputText>
                        </td>
                        <td style="width:100%">&nbsp</td>
                    </tr>
                    <tr>
                        <td style="width:1">Eksisterende text (dukker opp i about us)</td>
                        <td style="width:1" required="true">
                            <t:outputText value="#{Instructor_Backing.instructor.aboutMe.body}"></t:outputText>
                        </td>
                        <td style="width:100%">&nbsp</td>
                    </tr>
                    <tr>
                        <td style="width:1">Tekst (dukker opp i about us)</td>
                        <td style="width:1" required="true">
                            <t:inputTextarea rows="4" id="aboutMe" required="true" binding="#{Instructor_Backing.txtAreaAboutMe}"></t:inputTextarea>
                        </td>
                        <td style="width:100%">&nbsp</td>
                    </tr>
                    <tr>
                        <td style="width:1" nowrap>Portrett bilde (100x120px)</td>
                        <td colspan="2"><t:graphicImage url="#{Instructor_Backing.instructor.profilePicture}"/></td>
                    </tr>
                    <tr>
                        <td nowrap>Endre</td>
                        <td required="true"><t:inputFileUpload id="portraitUpload" value="#{Instructor_Backing.upPortrait}" size="20" /></td>
                        <td><t:outputText binding="#{Instructor_Backing.upPortraitResult}"/></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="color:red; font-weight: bolder"><t:outputText binding="#{Instructor_Backing.errorMsg}"/></td>
                    </tr>

                </table>
                <h:commandButton value="Lagre og avslutt" action="#{Instructor_Backing.store}" />
            </h:form>
            <h:form>
                <h:commandButton value="Avbryt" action="Cancel" immediate="true" />                                                                
            </h:form>        
        </f:view>
    </body>
</html>
