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
        <script type="text/javascript">
            function render(){
                var rh = document.getElementById("form:renderHidden");
                var hp = document.getElementById("hiddenPanel");
                if(rh.value == "true"){
                    hp.style.display = "block";
                    
                }else{
                    hp.style.display = "none";
                }
                
            }
        </script>
    </head>
    <body onload="render()">
        <f:view>
            <h:form enctype="multipart/form-data" id="form">
                <h1>Legg til bilder</h1>
                <table>
                    <tr><td><t:inputFileUpload value="#{ArticleImagesUpdate_Backing.upImg1}" size="20" /></td><td><t:outputText binding="#{ArticleImagesUpdate_Backing.upLoadImg1Result}"/></td></tr>
                    <tr><td><t:inputFileUpload value="#{ArticleImagesUpdate_Backing.upImg2}" size="20" /></td><td><t:outputText binding="#{ArticleImagesUpdate_Backing.upLoadImg2Result}"/></td></tr>
                    <tr><td><t:inputFileUpload value="#{ArticleImagesUpdate_Backing.upImg3}" size="20" /></td><td><t:outputText binding="#{ArticleImagesUpdate_Backing.upLoadImg3Result}"/></td></tr>
                    <tr><td><t:inputFileUpload value="#{ArticleImagesUpdate_Backing.upImg4}" size="20" /></td><td><t:outputText binding="#{ArticleImagesUpdate_Backing.upLoadImg4Result}"/></td></tr>
                    <tr><td><t:inputFileUpload value="#{ArticleImagesUpdate_Backing.upImg5}" size="20" /></td><td><t:outputText binding="#{ArticleImagesUpdate_Backing.upLoadImg5Result}"/></td></tr>
                    <tr><td><t:inputFileUpload value="#{ArticleImagesUpdate_Backing.upImg6}" size="20" /></td><td><t:outputText binding="#{ArticleImagesUpdate_Backing.upLoadImg6Result}"/></td></tr>                
                    <tr><td><h:commandButton value="Last opp bilder" action="#{ArticleImagesUpdate_Backing.uploadImages}" /></td><td>Trykk også på knappen om du ønsker å gå videre uten å laste opp bilder</td></tr>
                    <tr><td colspan="2"><h:commandButton value="Avbryt" action="#{ArticleImagesUpdate_Backing.cancel}"/></td></tr>
                </table>
                <t:inputHidden value="false" binding="#{ArticleImagesUpdate_Backing.renderHidden}" id="renderHidden"/>
                <div id="hiddenPanel" style="display:none">
                    <t:outputText binding="#{ArticleImagesUpdate_Backing.uploadFailedText}"/>                    
                    <h:commandButton value="Fortsett" action="#{ArticleImagesUpdate_Backing.saveArticle}"/>
                </div>  
            </h:form>        
        </f:view>
    </body>
</html>
