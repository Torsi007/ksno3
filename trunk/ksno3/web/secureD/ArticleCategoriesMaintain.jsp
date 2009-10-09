<%-- 
    Document   : AdminArticles
    Created on : 28.sep.2008, 13:19:26
    Author     : halsnehauge
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrer artikler</title>

    </head>
    <body>
        <f:view>
            <h:form>
                <H1>Administrer kategorier</H1>
                <h:dataTable id="dt1" value="#{ArticleCategoryMaintain_Backing.articleCategorys}" binding="#{ArticleCategoryMaintain_Backing.data}" var="item" first="0" width="10">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Kategori" />
                        </f:facet> 
                        <h:inputText value="#{item.name}"></h:inputText>
                    </h:column>    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Beskrivelse" />
                        </f:facet> 
                        <h:inputText value="#{item.description}"></h:inputText>
                    </h:column>
                    <h:column>
                        <h:commandLink action="#{ArticleCategoryMaintain_Backing.articleCategoryDelete}">
                            <h:outputText value="Slett"/>
                        </h:commandLink>
                    </h:column>
                 </h:dataTable>
                <hr/>
                <table>
                    <tr>
                        <td>
                            <t:inputText binding="#{ArticleCategoryMaintain_Backing.newName}"></t:inputText>
                        </td>
                        <td>
                            <t:inputText binding="#{ArticleCategoryMaintain_Backing.newDescription}"></t:inputText>
                        </td>
                        <td>
                            <t:commandButton value="Opprett ny" action="#{ArticleCategoryMaintain_Backing.articleCategoryCreate}"/>
                        </td>
                    </tr>
                </table>
                <t:commandButton value="Lagre" action="#{ArticleCategoryMaintain_Backing.articleCategorysUpdate}"/>
                <t:outputText styleClass="errorMsg" binding="#{ArticleCategoryMaintain_Backing.errorMsg}"/>
            </h:form>    
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>             
        </f:view>
    </body>
</html>
