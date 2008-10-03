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
        <title>Create article</title>
        <script src="../resources/js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script type="text/javascript">
            tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

		// Theme options
		theme_advanced_buttons1 : "bold,formatselect,|,sub,sup,|,charmap,|,fullscreen",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview",
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
    </script>       
    </head>
    <body>
        <f:view>
            <h:form>
                <h1>Oppdater artikkel</h1>
                <p>Gratulerer, du er nå klar til å legge inn tekst og bilder</p>
                <p>Feltet nedenfor er en forholdsvis rik editor, skriv in og formatter etter eget ønske.</p>                
                <p>Tilgjengelige bilder vises i tabellen under...</p>                
                <t:inputTextarea binding="#{ArticleUpdate_Backing.body}" id="myTextArea" rows="20" cols="80" style="width: 100%"/>
                <p>Tilgjengelige bilder vises i tabellen under, lim inn url fra nadre kolonne</p>                
                <table>
                    <t:dataList value="#{ArticleModify.images}" var="img">
                        <tr><td><t:graphicImage url="#{img.name}" height="80"/></td><td>..<t:outputText value="#{img.name}"/></td></tr>
                    </t:dataList>                    
                </table>
                <h:commandButton value="Legg til flere bilder" action="articleImagesUpdate" />
                <h:commandButton value="Endre intro" action="articleMasterUpdate" />                
                <h:commandButton value="Fullfør" action="#{ArticleUpdate_Backing.saveArticle}" />                                                                
            </h:form>        
        </f:view>
    </body>
</html>


