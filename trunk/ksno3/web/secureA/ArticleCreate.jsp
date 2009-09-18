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
                <h1>Ny artikkel</h1>
                <p>Du er i ferd med å opprette en ny artikkel</p>
                <table width="100%">
                    <tr>
                        <td style="width:1">Navn</td>
                        <td style="width:1" required="true">
                            <t:inputText label="test" id="it1" required="true" binding="#{ArticleCreate_Backing.name}">
                            </t:inputText>
                        </td>
                        <td style="width:100%">&nbsp</td>                    
                    </tr>
                   <tr>
                       <td style="width:1">Category</td>
                       <td style="width:1" required="true">
                           <t:selectOneMenu binding="#{ArticleCreate_Backing.slctCategory}">
                               <f:selectItems value="#{ArticleCreate_Backing.categorySelectItems}"/>
                           </t:selectOneMenu>
                       </td>
                       <td style="width:100%">&nbsp</td>
                    </tr>
                    <tr>
                        <td colspan="3">Intro text (vil dukke opp på forsiden)</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <t:inputTextarea required="true"  binding="#{ArticleCreate_Backing.intro}"  id="myTextArea" rows="4" cols="40" style="width: 100%"/>
                        </td>
                    </tr>                    
                   <!--tr>
                        <td>Ekstra forfattereee</td>
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
                        <td></td>
                    </tr-->
                    <tr>
                        <td nowrap>Forsidebilde (minimum vidde 144px)</td>                        
                        <td required="true"><t:inputFileUpload id="avatarUpload1" required="true" value="#{ArticleCreate_Backing.upAvatar}" size="20" /></td>
                        <td><t:outputText binding="#{ArticleCreate_Backing.upAvatarResult}"/></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="color:red; font-weight: bolder"><t:outputText binding="#{ArticleCreate_Backing.errorMsg}"/></td>                        
                    </tr>                    
                </table>
                <h:commandButton value="Gå videre" action="#{ArticleCreate_Backing.createArticle}" />                                                
                <h:commandButton value="Lagre og avslutt" action="#{ArticleCreate_Backing.createIntro}" />   
            </h:form>
            <h:form>
                <h:commandButton value="Avbryt" action="Cancel" immediate="true" />                                                                
            </h:form>        
        </f:view>
    </body>
</html>
