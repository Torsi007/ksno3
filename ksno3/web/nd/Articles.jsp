<jsp:include page="Heading.jsp" ></jsp:include>


<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<title>kitesurfing.no - nyheter</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/articles.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/default.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        window.top.setStyle("news");
    });
</script>
</head>
<body>
    <f:view>
        <h:form>
            <table class="middleSection">
                <tr>
                    <td>
                        <div>
                            <h1>Nyheter</h1>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="bottomSection">
                <t:dataList value="#{Current_Backing.articles}" var="article">
                    <tr>
                        <td>
                            <h1>
                                <t:htmlTag value="a">
                                    <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                    <h:outputText value="#{article.name}"/>
                                </t:htmlTag>
                            </h1>
                            <h:outputText value="#{article.createdDate}"/> | <f:verbatim><h:outputText escape="false" value="#{article.intro}"/></f:verbatim>&nbsp;
                            <t:htmlTag value="a">
                                <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                <h:outputText escape="true" value="Read More ->"/>
                            </t:htmlTag>
                        </td>
                        <td>
                            <t:graphicImage url="#{article.avatarUrl}"/>
                        </td>
                    </tr>
                </t:dataList>
            </table>
        </h:form>
    </f:view>
</body>
<jsp:include page="Ending.jsp" ></jsp:include>

