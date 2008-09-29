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
                <table>
                    <tr><td><t:inputFileUpload id="imgUpload1" value="#{AdminArticle_Backing.upImg1}" size="20" /></td><td><t:outputText binding="#{AdminArticle_Backing.upLoadImg1Result}"/></td></tr>
                    <tr><td><t:inputFileUpload id="imgUpload2" value="#{AdminArticle_Backing.upImg2}" size="20" /></td><td><t:outputText binding="#{AdminArticle_Backing.upLoadImg2Result}"/></td></tr>
                    <tr><td><t:inputFileUpload id="imgUpload3" value="#{AdminArticle_Backing.upImg3}" size="20" /></td><td><t:outputText binding="#{AdminArticle_Backing.upLoadImg3Result}"/></td></tr>
                    <tr><td><t:inputFileUpload id="imgUpload4" value="#{AdminArticle_Backing.upImg4}" size="20" /></td><td><t:outputText binding="#{AdminArticle_Backing.upLoadImg4Result}"/></td></tr>
                    <tr><td><t:inputFileUpload id="imgUpload5" value="#{AdminArticle_Backing.upImg5}" size="20" /></td><td><t:outputText binding="#{AdminArticle_Backing.upLoadImg5Result}"/></td></tr>
                    <tr><td><t:inputFileUpload id="imgUpload6" value="#{AdminArticle_Backing.upImg6}" size="20" /></td><td><t:outputText binding="#{AdminArticle_Backing.upLoadImg6Result}"/></td></tr>                
                    <tr><td colspan="2"><h:commandButton value="Fortsett" action="#{AdminArticle_Backing.uploadImages}" /></td></tr>
                    <tr><td colspan="2"><h:outputText rendered="#{AdminArticle_Backing.renderAddArticleImagesContinue}" value="Noen av filene ble ikke lastet (se meldinger over), Trykk 'Gå videre' om du vil ignorere dette, eller forsøk en gang til."/></td></tr>                    
                    <tr><td colspan="2"><h:commandButton value="Gå videre" rendered="#{AdminArticle_Backing.renderAddArticleImagesContinue}" action="go"/></td></tr>
                    <tr><td colspan="2"><h:commandButton value="Avbryt" rendered="#{AdminArticle_Backing.renderAddArticleImagesContinue}" action="nogo"/></td></tr>                    
                </table>
            </h:form>        
        </f:view>
    </body>
</html>
