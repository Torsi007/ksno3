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
        <title>Ny article</title>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
        <script src="../resources/js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script type="text/javascript">
            tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

		// Theme options
		theme_advanced_buttons1 : "bold,formatselect,|,sub,sup,|,charmap,|,fullscreen",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,blockquote,|,undo,redo,|,link,unlink,cleanup,help,code,|,insertdate,inserttime,preview",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,

		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
                
	});
        
        
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
                        <td style="width:1">Fornavn</td>
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
                        <td colspan="3">
                            <t:inputTextarea required="true"  binding="#{Instructor_Backing.aboutMe}"  id="myTextArea" rows="4" cols="40" style="width: 100%"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:1" nowrap>Portrett bilde (minimum vidde 144px)</td>
                        <td colspan="2"><t:graphicImage url="#{Instructor_Backing.instructor.profilePicture}"/></td>
                    </tr>
                    <tr>
                        <td nowrap>Endre)</td>
                        <td required="true"><t:inputFileUpload id="portraitUpload" required="true" value="#{Instructor_Backing.upPortrait}" size="20" /></td>
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
