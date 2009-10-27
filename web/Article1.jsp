<%--
    Document   : Current
    Created on : 15.sep.2008, 19:41:14
    Author     : halsnehauge
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <h:form>
        <table class="middleSection">
            <tr>
                <td>
                    <div>
                        <font style="font-size:20px; margin: 0px 0px 10px 0px;"><h:outputText value="#{Article_Backing.article.name}"/></font>
                        <font style="font-size:11px; line-height: 11px;"><h:outputText value="#{Article_Backing.article.createdDate}"/></font>
                    </div>
                </td>
            </tr>
        </table>
        <table class="bottomSection">
            <tr>
                <td>
                    <f:verbatim>
                        <h:outputText rendered="#{Article_Backing.article.body != null}" escape="false" value="#{Article_Backing.article.body}"/>
                        <h:outputText rendered="#{Article_Backing.article.body == null}" escape="false" value="#{Article_Backing.article.intro}"/>
                    </f:verbatim>
                </td>
            </tr>
        </table>
    </h:form>
</f:view>



