<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<f:view>
<title>kitesurfing.no -  <h:outputText value="#{Article_Backing.article.name}"/></title>
    <meta name="title" content="kitesurfing.no -  <h:outputText value="#{Article_Backing.article.name}"/>" />
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/article.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/default.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        window.top.setStyle("news");
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
<body>

    <h:form>
        <div class="topMenu">
            <table>
                <tr>
                    <td><a href="Main.jsp?content=Home.jsp"><img src="img/logo.jpg" alt="kitesurfing.no logo"/></a></td>
                </tr>
                <tr>
                    <td class="main">
                        <table id="mainMenu">
                            <tr>
                                <td style="width:58px;"><a style="font-weight:bolder" href="Main.jsp?content=Home.jsp">Hjem</a></td>
                                <td style="width:80px"><a href="Main.jsp?content=Articles.jsp" >Publisert</a></td>
                                <td style="width:98px"><a href="Main.jsp?content=CourseJaren.jsp"  >Sommerkurs</a></td>
                                <td style="width:86px"><a href="Main.jsp?content=CoursesHaukeliseter.jsp" >Vinterkurs</a></td>
                                <td style="width:86px"><a href="Main.jsp?content=aboutUs.jsp" >Om oss</a></td>
                            </tr>
                        </table>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        <table class="middleSection">
            <tr>
                <td class="leftSection">
                    <h1><h:outputText value="#{Article_Backing.article.name}"/></h1>
                    <h2><h:outputText value="#{Article_Backing.article.createdDate}"/>&nbsp;|&nbsp;<h:outputText value="#{Article_Backing.article.author.firstName} #{Article_Backing.article.author.lastName}"/></h2>
                </td>
                <td class="rightSection">
                    <a id="facebook" href="http://www.facebook.com/share.php?u=" target="_blank"><img id="iconFaceBook" src="http://b.static.ak.fbcdn.net/images/share/facebook_share_icon.gif?8:26981" alt="Del p� facebook" title="Del p� facebook" /></a>
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


