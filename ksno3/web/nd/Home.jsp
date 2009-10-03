<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<html>
    <head>
        <title>kitesurfing.no</title>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/home.css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/default.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                window.top.setStyle("default");
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
                <table class="middleSection">
                    <tr>
                        <td class="leftSection" >
                            <div>
                                <font style="font-size:36px; line-height:35px; margin-bottom:20px">Hei, vi er Kitesurfing.no</font>
                                <font style="font-size:25px; line-height: 25px;">Vi kj&oslash;rer kitekurs<br/>p&aring; J&aelig;ren og<br/> Haukelister</font>
                                <jsp:include page="Button.jsp" >
                                    <jsp:param name="title" value="L&aelig;r Mer" />
                                    <jsp:param name="link" value="aboutUs.html"/>
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
                                        <f:param name="href" value="../nd/#{Current_Backing.articleUrl}?id=#{headline.id}" />
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
                                                <h:outputText value="Watch [#{video.duration}]" />
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
                                        <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                        <h:outputText value="#{article.name}"/>
                                    </t:htmlTag>
                                    <h:outputText value="#{article.createdDate}">
                                        <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                    </h:outputText>
                                    &nbsp;|&nbsp;
                                    <h:outputText value="#{article.intro}" escape="false"/>
                                    <t:htmlTag value="a">
                                        <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
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
                                                <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                                <h:outputText value="#{article.name}"/>
                                            </t:htmlTag>
                                        </td>
                                    </tr>
                                </t:dataList>
                                <tr>
                                    <td colspan="3" class="footer" align="right"><a href="Articles.jsp">Alle artikler -&gt;</a></td>
                                </tr>
                            </table>
                            
                        </td>
                        <td class="rightSection">
                            <h1>Aktiviteter</h1>
                            <div class="courseList">
                                <h1><a href="CourseJaren.jsp">Kurs J&aelig;ren</a></h1>
                                <table>
                                    <t:dataList value="#{CoursesSummer_Backing.fourNextCourses}" var="course">
                                        <tr>
                                            <td style="width:73px; white-space: nowrap">
                                                <h:outputText value="#{course.startDate}">
                                                    <f:convertDateTime dateStyle="short" pattern="dd.MM"/>
                                                </h:outputText>
                                                -
                                                <h:outputText value="#{course.endDate}">
                                                    <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                                </h:outputText>
                                            </td>
                                            <td style="width:8px;">&nbsp;|&nbsp;</td>
                                            <td style="width:106px"><h:outputText value="#{course.name}"/></td>
                                            <td>
                                                <h:outputLink value="SignUpSummer.jsp" styleClass="button">
                                                    <f:param name="id" value="#{course.id}"/>
                                                    <h:outputText value="Go"/>
                                                </h:outputLink>
                                            </td>
                                        </tr>
                                    </t:dataList>
                                    <t:htmlTag value="tr" rendered="#{CoursesSummer_Backing.noCourses}">
                                        <t:htmlTag value="td">
                                            <f:param name="colspan" value="4"/>
                                            <h:outputText value="Settes opp senere"/>
                                        </t:htmlTag>
                                    </t:htmlTag>
                                    <t:htmlTag value="tr" rendered="#{CoursesSummer_Backing.moreThanFourCourses}">
                                        <t:htmlTag value="td">
                                            <f:param name="colspan" value="4"/>
                                            <t:htmlTag value="a">
                                                <f:param name="href" value="CourseJaren.jsp"/>
                                                <h:outputText value="Mer..."/>
                                            </t:htmlTag>
                                        </t:htmlTag>
                                    </t:htmlTag>
                                </table>
                                <h1><a href="CoursesHaukeliseter.jsp">Kurs Haukeliseter</a></h1>
                                <table>
                                    <t:dataList value="#{CoursesWinter_Backing.fourNextCourses}" var="course">
                                        <tr>
                                            <td style="width:73px; white-space: nowrap">
                                                <h:outputText value="#{course.startDate}">
                                                    <f:convertDateTime dateStyle="short" pattern="dd.MM"/>
                                                </h:outputText>
                                                -
                                                <h:outputText value="#{course.endDate}">
                                                    <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                                </h:outputText>
                                            </td>
                                            <td style="width:8px;">&nbsp;|&nbsp;</td>
                                            <td style="width:106px"><h:outputText value="#{course.name}"/></td>
                                            <td>
                                                <h:outputLink value="SignUpSummer.jsp" styleClass="button">
                                                    <f:param name="id" value="#{course.id}"/>
                                                    <h:outputText value="Go"/>
                                                </h:outputLink>
                                            </td>
                                        </tr>
                                    </t:dataList>
                                    <t:htmlTag value="tr" rendered="#{CoursesWinter_Backing.noCourses}">
                                        <t:htmlTag value="td">
                                            <f:param name="colspan" value="4"/>
                                            <h:outputText value="Settes opp senere"/>
                                        </t:htmlTag>
                                    </t:htmlTag>
                                    <t:htmlTag value="tr" rendered="#{CoursesWinter_Backing.moreThanFourCourses}">
                                        <t:htmlTag value="td">
                                            <f:param name="colspan" value="4"/>
                                            <t:htmlTag value="a">
                                                <f:param name="href" value="CoursesHaukeliseter.jsp"/>
                                                <h:outputText value="Mer..."/>
                                            </t:htmlTag>
                                        </t:htmlTag>
                                    </t:htmlTag>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightSection" style="height:1px">
                            <div class="weLike">
                                <h1>We like</h1>
                                <img src="http://lh5.ggpht.com/_lkZPRU-HBNM/SrULQXemmyI/AAAAAAAAAjA/WLnYaocLse4/s800/Untitled-1.gif" alt="Urge"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </h:form>
        </f:view>
    </body>
</html>

