<jsp:include page="Heading.jsp" ></jsp:include>


<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<title>kitesurfing.no - nyheter</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/articles.css" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/default.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        window.top.setStyle("news");
        $('a[name=modal]').click(function(e) {
            e.preventDefault();
            var url = $(this).attr('href');
            //window.parent.$('a[name=modal]').click();
            window.parent.openModalVideo(url);
        });
    });
</script>
</head>
<body>
    <f:view>
        <h:form>
            <div class="topMenu">
                <table>
                    <tr>
                        <td><a href="Main.jsp?content=Home.jsp"><img src="resources/img/logos/logo.jpg" alt="kitesurfing.no logo"/></a></td>
                    </tr>
                    <tr>
                        <td class="main">
                            <table id="mainMenu">
                                <tr>
                                    <td style="width:58px;"><a href="Main.jsp?content=Home.jsp">Hjem</a></td>
                                    <td style="width:80px"><a style="font-weight:bolder" href="Main.jsp?content=Articles.jsp" >Publisert</a></td>
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
                        <div>
                            <h1>Artikler</h1>
                        </div>
                    </td>
                    <td class="rightSection">
                        <div>
                            <h1>Videoer</h1>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="bottomSection">
                <tr>
                    <td class="leftSection">
                        <table>
                            <t:dataList value="#{Current_Backing.articles}" var="article">
                                <tr>
                                    <td style="width:400">
                                        <h1>
                                            <t:htmlTag value="a">
                                                <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                                <h:outputText value="#{article.name}"/>
                                            </t:htmlTag>
                                        </h1>
                                        <h:outputText value="#{article.createdDate}"><f:convertDateTime pattern="yyyy-MM-dd"/></h:outputText> | <f:verbatim><h:outputText escape="false" value="#{article.intro}"/></f:verbatim>&nbsp;
                                        <t:htmlTag value="a">
                                            <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                            <h:outputText escape="true" value="Les mer ->"/>
                                        </t:htmlTag>
                                    </td>
                                    <td class="image">
                                        <t:graphicImage url="#{article.avatarUrl}"/>
                                    </td>
                                </tr>
                            </t:dataList>
                        </table>
                    </td>
                    <td class="rightSection">
                        <table class="videoList">
                            <t:dataList value="#{Current_Backing.videos}" var="video">
                                <tr>
                                    <td style="width:214">
                                        <t:htmlTag value="h1" style="margin:0">
                                            <t:htmlTag value="a">
                                                <f:param name="name" value="modal" />
                                                <f:param name="href" value="#{video.url}" />
                                                <h:outputText value="#{video.name}" />
                                            </t:htmlTag>
                                        </t:htmlTag>
                                        <t:htmlTag value="p">
                                            <h:outputText value="#{video.createdDate}"><f:converter converterId="CalendarConverter"/></h:outputText> | <h:outputText value="#{video.description}" />
                                        </t:htmlTag>
                                        <t:htmlTag value="a">
                                            <f:param name="name" value="modal" />
                                            <f:param name="href" value="#{video.url}" />
                                            <h:outputText value="Vis [#{video.duration}]" />
                                        </t:htmlTag>
                                    </td>
                                    <td>
                                        <t:htmlTag value="a">
                                            <f:param name="name" value="modal" />
                                            <f:param name="href" value="#{video.url}" />
                                            <t:htmlTag value="img">
                                                <f:param name="src" value="#{video.thumbnail}" />
                                            </t:htmlTag>
                                        </t:htmlTag>
                                    </td>
                                </tr>
                            </t:dataList>
                        </table>
                    </td>

                </tr>
            </table>
        </h:form>
    </f:view>
</body>
<jsp:include page="Ending.jsp" ></jsp:include>

