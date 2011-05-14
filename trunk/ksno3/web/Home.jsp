<jsp:include page="Heading.jsp" />
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<title>Kitesurfing.no</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/home.css" />
<script type="text/javascript" src="resources/js/default.js"></script>
<script type="text/javascript" src="resources/js/easySlider.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        if(window.top.setStyle){
            window.top.setStyle("default");
        }

        $('a[name=modal]').click(function(e) {
            e.preventDefault();
            var url = $(this).attr('href');
            //window.parent.$('a[name=modal]').click();
            window.parent.openModalVideo(url);
        });

        if($("#summerCourseList tr").size() > 6){
            $("#moreSummerCourses").css('display','block');
            $("#summerCourseList tr:eq(4)").css('display','none');
        }
        if($("#summerCourseList tr").size() == 2){
            $("#summerCoursesSetUpLater").css('display','block');
        }
        if($("#winterCourseList tr").size() > 6){
            $("#moreWinterCourses").css('display','block');
            $("#winterCourseList tr:eq(4)").css('display','none');
        }
        if($("#winterCourseList tr").size() == 2){
            $("#winterCoursesSetUpLater").css('display','block');
        }

			$("#slider").easySlider({
				auto: true,
				continuous: true,
                                speed: 		1200,
                                pause:			3000,
                                controlsShow:		false
			});

    });
</script>

</head>
<jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
<body>
    <f:view>
        <h:form>
            <table class="middleSection">
                <tr>
                    <td class="leftSection" >
                        <div>
                            <font style="font-size:36px; line-height:35px; margin-bottom:20px">Hei, vi er Kitesurfing.no</font>
                            <font style="font-size:25px; line-height: 25px;">Vi kj&oslash;rer kitekurs<br/>p&aring; J&aelig;ren og<br/> Haukeliseter</font>
                                <jsp:include page="Button.jsp" >
                                    <jsp:param name="title" value="Les mer" />
                                    <jsp:param name="link" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLAboutUs}"/>
                                </jsp:include>
                        </div>
                    </td>
                    <td class="middleSection"></td>
                    <td class="rightSection">
                        <div>
                            <t:dataList value="#{Current_Backing.headlines}" var="headline">
                                <t:htmlTag value="h1" rendered="#{headline.sameAsPrevCat != true}">
                                    <h:outputText value="#{headline.category.name}"/>
                                </t:htmlTag>
                                <t:htmlTag value="a">
                                    <f:param name="href" value="#{Current_Backing.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{headline.prettyPrintId}" />
                                    <h:outputText value="#{headline.name}" escape="false"/>
                                </t:htmlTag>
                            </t:dataList>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="bottomSection">
                <tr>
                    <td class="leftSection" rowspan="2" valign="top">
                        <h1>Video og tips</h1>
                        <table class="videoList">
                            <t:dataList value="#{Current_Backing.firstThreeVideos}" var="video">
                                <tr>
                                    <td>
                                        <t:htmlTag value="img">
                                            <f:param name="src" value="#{video.thumbnail}" />
                                        </t:htmlTag>
                                    </td>
                                    <td>
                                        <h1>Video</h1>
                                        <t:htmlTag value="span">
                                            <h:outputText value="#{video.name}" />
                                        </t:htmlTag>
                                        <t:htmlTag value="a">
                                            <f:param name="name" value="modal" />
                                            <f:param name="href" value="#{video.url}" />
                                            <h:outputText value="Vis [#{video.duration}]" />
                                        </t:htmlTag>
                                    </td>
                                </tr>
                            </t:dataList>
                        </table>
                    </td>
                    <td class="middleSection" rowspan="2">
                        <h1>Siste nyheter</h1>
                        <div class="expandedNews">
                            <t:dataList value="#{Current_Backing.firstTwoArticles}" var="article">
                                <t:htmlTag value="h1">
                                    <t:htmlTag value="a">
                                        <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{article.prettyPrintId}" />
                                        <h:outputText value="#{article.name}"/>
                                    </t:htmlTag>
                                </t:htmlTag>
                                <h:outputText value="#{article.createdDate}">
                                    <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                </h:outputText>
                                &nbsp;|&nbsp;
                                <h:outputText value="#{article.intro}" escape="false"/>
                                <t:htmlTag value="a">
                                    <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{article.prettyPrintId}"/>
                                    <h:outputText value="Les mer -&gt;" escape="false"/>
                                </t:htmlTag>
                                <hr/>
                            </t:dataList>
                        </div>
                        <table class="newsList">
                            <t:dataList value="#{Current_Backing.articlesFromThreeToTen}" var="article">
                                <tr>
                                    <td class="date"><span>
                                            <h:outputText value="#{article.createdDate}">
                                                <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                            </h:outputText>
                                        </span></td>
                                    <td class="separator">|</td>
                                    <td>
                                        <t:htmlTag value="a">
                                            <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{article.prettyPrintId}" />
                                            <h:outputText value="#{article.name}"/>
                                        </t:htmlTag>
                                    </td>
                                </tr>
                            </t:dataList>
                            <tr>
                                <td colspan="3" class="footer" align="right">
                                    <t:htmlTag value="a">
                                        <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}" />
                                        <h:outputText value="Alle artikler -&gt;" escape="false"/>
                                    </t:htmlTag>
                                </td>
                            </tr>
                        </table>

                    </td>
                    <td class="rightSection">
                        <h1>Aktiviteter</h1>
                        <div class="courseList">
                            <h1>
                                <t:htmlTag value="a">
                                    <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseSummer}" />
                                    <h:outputText value="Sommerkurs" escape="false"/>
                                </t:htmlTag>
                            </h1>
                            <table id="summerCourseList">
                                <t:dataList value="#{CoursesSummer_Backing.eightNextCourses}" var="course">
                                    <tr>
                                        <td style="width:90px; white-space: nowrap">
                                            <h:outputText value="#{course.startDate}">
                                                <f:converter converterId="DateConverterPtrnddDotMM"/>
                                            </h:outputText>
                                            -
                                            <h:outputText value="#{course.endDate}">
                                                <f:converter converterId="DateConverterPtrnddDotMMDotyy"/>
                                            </h:outputText>
                                        </td>
                                        <td style="width:8px;"><span style="display:block; margin:0 2;">|</span></td>
                                        <td style="width:106px"><h:outputText value="#{course.name}"/></td>
                                        <td>
                                            <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseSummer}#{course.prettyPrintId}" styleClass="button">
                                                <h:outputText value="Go"/>
                                            </h:outputLink>
                                        </td>
                                    </tr>
                                </t:dataList>
                                <tr style="display:none" id="summerCoursesSetUpLater">
                                    <td colspan="4">Settes opp senere</td>
                                </tr>
                                <tr style="display:none" id="moreSummerCourses">
                                    <td colspan="4">
                                        <a href="kurs/vinter">Mer--></a>
                                    </td>
                                </tr>
                            </table>
                            <h1>
                                <t:htmlTag value="a">
                                    <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseWinter}" />
                                    <h:outputText value="Vinterkurs" escape="false"/>
                                </t:htmlTag>
                            </h1>
                            <table id="winterCourseList">
                                <t:dataList value="#{CoursesWinter_Backing.eightNextCourses}" var="course">
                                    <tr>
                                        <td style="width:90px; white-space: nowrap">
                                            <h:outputText value="#{course.startDate}">
                                                <f:converter converterId="DateConverterPtrnddDotMM"/>
                                            </h:outputText>
                                            -
                                            <h:outputText value="#{course.endDate}">
                                                <f:converter converterId="DateConverterPtrnddDotMMDotyy"/>
                                            </h:outputText>
                                        </td>
                                        <td style="width:8px;"><span style="display:block; margin:0 2;">|</span></td>
                                        <td style="width:106px"><h:outputText value="#{course.maxSize <= course.numberOfParticipants ? ' - Fullt' : course.name}"/></td>
                                        <td>
                                            <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseWinter}#{course.prettyPrintId}" styleClass="button" rendered="#{course.maxSize <= course.numberOfParticipants ? 'false' : 'true'}">
                                                <h:outputText value="Go"/>
                                            </h:outputLink>
                                        </td>
                                    </tr>
                                </t:dataList>
                                <tr style="display:none" id="winterCoursesSetUpLater">
                                    <td colspan="4">Settes opp senere</td>
                                </tr>
                                <tr style="display:none" id="moreWinterCourses">
                                    <td colspan="4">
                                        <a href="kurs/vinter">Mer--></a>
                                    </td>
                                </tr>
                            </table>
                            <!--Sjekkes inn når vi får en side med info
                            <h1><a href="CoursesHaukeliseter.jsp">Teambuilding & eventer</a></h1>
                            <table style="width:205px">
                                <tr>
                                    <td style"width:100%">
                                        Mer info her...
                                    </td>
                                    <td style="width:1px"><a href="SignUpSummer.jsp?id=87" class="button">Go</a></td>
                                </tr>
                            </table>
                            -->
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="rightSection" style="height:40px">
                        <div class="weLike">
                            <h1>We like</h1>
                            <div id="slider">
                                <ul>
                                    <li><a href="http://www.haukeliseter.no" target="_blank"><img src="http://farm6.static.flickr.com/5107/5620735755_378214539f_m_d.jpg" alt="Haukeliseter fjellstue" /></a></li>
                                    <li><a href="http://www.splitboard.no" target="_blank"><img src="http://farm6.static.flickr.com/5024/5621317644_ed1ab0caea_m_d.jpg" alt="Snoweb" /></a></li>
                                    <li><a href="http://www.bergans.no" target="_blank"><img src="http://farm3.static.flickr.com/2643/4191602466_9f89d4472e_o.gif" alt="Bergans" /></a></li>
                                </ul>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </h:form>
    </f:view>
</body>
<jsp:include page="Ending.jsp" ></jsp:include>

