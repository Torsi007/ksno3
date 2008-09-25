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
        <script src="../tinymce/jscripts/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script type="text/javascript">
            tinyMCE.init({
                mode : "textareas",
                theme : "simple",
                width : "640",
                height : "480",
                    plugins : "preview, emotions, iespell, print, fullscreen, zoom, advhr, directionality, searchreplace, insertdatetime,  anchor, newdocument, separator,  cut, copy, paste,  forecolor, backcolor, charmap, visualaid",
                    theme_advanced_buttons3_add : "preview, emotions, iespell, print, fullscreen, zoom, advhr, ltr,rtl, search,replace,insertdate,inserttime, anchor, newdocument, separator,  cut, copy, paste, forecolor, backcolor, charmap, visualaid",
                    plugin_preview_width : "500",
                    plugin_preview_height : "600",
                    fullscreen_settings : {
                        theme_advanced_path_location : "top"
                     },
                    extended_valid_elements : "hr[class|width|size|noshade]",
                    plugin_insertdate_dateFormat : "%Y-%m-%d",
                    plugin_insertdate_timeFormat : "%H:%M:%S"
                
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
                <t:inputTextarea binding="#{UpdateArticle_Backing.body}" id="myTextArea" rows="10" cols="50" style="width: 100%"/>
                <t:dataList value="#{UpdateArticle_Backing.article.images}" var="img">
                    <t:graphicImage url="#{img.name}" height="80"/>
                </t:dataList>
            </h:form>        
        </f:view>
    </body>
</html>
