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
    </head>
    <body>
        <f:view>
            <h:form enctype="multipart/form-data">
                <t:inputText id="id" value="#{CreateArticle_Backing.article.id}"/>                
                <t:inputFileUpload id="fileupload" value="#{AddArticleImages_Backing.upFile}" size="20" /><p/>
                <h:commandButton value="Load the file" action="#{AddArticleImages_Backing.upload}" />
                <t:outputText binding="#{AddArticleImages_Backing.upLoadResult}" style="color:green;font-weight:bold"/>                
                <h:commandButton value="Gå videre" action="gotoUpdateArticle" />                                                                
            </h:form>        
        </f:view>
    </body>
</html>
