<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<title>kitesurfing.no - nyheter</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/article.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/default.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        window.top.setStyle("news");
        $('img').click(function(e) {

            window.parent.openModalImage($(this));
        });
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
                            <h1><h:outputText value="#{Article_Backing.article.name}"/></h1>
                            <h2><h:outputText value="#{Article_Backing.article.createdDate}"/>&nbsp;|&nbsp;<h:outputText value="#{Article_Backing.article.author.firstName} #{Article_Backing.article.author.lastName}"/></h2>
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
</body>
<jsp:include page="Ending.jsp" ></jsp:include>



