<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<f:view>
<title>kitesurfing.no -  <h:outputText value="#{Article_Backing.article.name}"/></title>
<meta name="title" content="kitesurfing.no -  <h:outputText value="#{Article_Backing.article.name}"/>" />
<meta name="description" content="kitesurfing.no - <h:outputText value="#{Article_Backing.article.intro}"/>" />
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/article.css" />
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/default.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        if(window.top.setStyle){
            window.top.setStyle("news");
        }

        $(".bottomSection img").click(function(e) {
            window.parent.openModalImage($(this));
        });
        $('#facebook').click(function(e) {
            e.preventDefault();
            u=location.href;
            t=document.title;
            window.open('http://www.facebook.com/sharer.php?u=' +encodeURIComponent(u)+'&t='+ encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');
        });
    });



</script>
    <meta name="description" content="description " />
    <link rel="image_src" href="<h:outputText value="#{Article_Backing.article.avatarUrl}"/>" />
</head>
<jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
<body>

    <h:form>
        <jsp:include page="Menu.jsp" >
            <jsp:param name="fromMain" value="false"/>
        </jsp:include>
        <table class="middleSection">
            <tr>
                <td class="leftSection">
                    <h1><h:outputText value="#{Article_Backing.article.name}"/></h1>
                    <h2><h:outputText value="#{Article_Backing.article.createdDate}"/>&nbsp;|&nbsp;<h:outputText value="#{Article_Backing.article.author.firstName} #{Article_Backing.article.author.lastName}"/></h2>
                </td>
                <td class="rightSection">
                    <a id="facebook" href="http://www.facebook.com/share.php?u=" target="_blank"><img id="iconFaceBook" src="http://b.static.ak.fbcdn.net/images/share/facebook_share_icon.gif?8:26981" alt="Del på facebook" title="Del på facebook" /></a>
                </td>
            </tr>
        </table>
        <table class="bottomSection" >
            <tr>
                <td id="bottomSection">
                    <f:verbatim>
                        <h:outputText rendered="#{Article_Backing.article.body != null}" escape="false" value="#{Article_Backing.article.body}"/>
                        <h:outputText rendered="#{Article_Backing.article.body == null}" escape="false" value="#{Article_Backing.article.intro}"/>
                    </f:verbatim>
                </td>
            </tr>
        </table>
    </h:form>

</body>
</f:view>
<jsp:include page="Ending.jsp" ></jsp:include>



