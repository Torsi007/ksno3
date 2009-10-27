<jsp:include page="../Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>      


        <title>kitesurfing.no - bilder</title>
    </head>
    <body>
        <f:view>
            <h:form>        
                <table>
                    <t:dataList value="#{ArticleModify.images}" var="img">
                        <tr><td><t:graphicImage url="#{img.name}" height="80"/></td><td>..<t:outputText value="#{img.name}"/></td></tr>
                    </t:dataList>                    
                </table>
            </h:form>        
        </f:view>
<jsp:include page="../Ending.jsp" ></jsp:include>

