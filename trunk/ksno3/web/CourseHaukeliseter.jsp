<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<html>
    <head>
        <title>kitesurfing.no - kurs vinter</title>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/default.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/courseHaukeliseter.css" />
        <script type="text/javascript" src="${request.contextPath}/resources/js/default.js"></script>
    </head>
    <jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
    <body class="signup">
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <table class="middleSection">
                    <tr>
                        <td class="leftSection">
                            <div>
                                <h1><h:outputText value="#{CourseHaukeliseter_Backing.course.name}"/></h1>
                                <h2><h:outputText value="#{CourseHaukeliseter_Backing.course.startDate} - #{CourseHaukeliseter_Backing.course.endDate}"/></h2>
                                <table cellpadding="0" cellspacing="0">
                                    <tr class="heading " >
                                        <td rowspan="2" style="width:120px;" ></td><td colspan="2" >DNT medlem</td><td rowspan="2" style="width:60px">Ikke DNT medlem</td>
                                    </tr>
                                    <tr class="heading ">
                                        <td style="width:60px" >Under 26</td><td  style="width:60px">Voksen</td>
                                    </tr>
                                    <tr style="height:24px;" >
                                        <td style="text-align:left" >Kun kurs</td><td >2050,-</td><td >2050,-</td><td >2050,-</td>
                                    </tr>
                                    <tr style="height:24px">
                                        <td style="width:120px;text-align:left">Kurs, middag og losji på stabbur</td><td > 2660,-</td><td>2835,-</td><td>3035,-</td>
                                    </tr>
                                    <tr style="height:24px">
                                        <td style="width:120px; text-align:left">Kurs, fullpensjon og fjellrom</td><td >3685,-</td><td>3685,-</td><td>3885,-</td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td class="middleSection"></td>
                        <td class="rightSection">
                            <div>
                                <h1>Les om tidligere vinterkurs!</h1>
                                <t:dataList value="#{CoursesWinter_Backing.courseArticles}" var="article">
                                    <t:htmlTag value="a">
                                        <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{article.prettyPrintId}" />
                                        <h:outputText value="#{article.name}" escape="false"/>
                                    </t:htmlTag>
                                </t:dataList>
                            </div>
                        </td>
                    </tr>
                </table>
                <table class="bottomSection">
                    <tr>
                        <td class="leftSection" valign="top">
                            <h1>Påmelding</h1>
                            <t:htmlTag value="iframe" >
                                <f:param name="src" value="#{ApplicationBean1.contextPath}/faces/SignUpHaukeliseter.jsp?courseId=#{CourseHaukeliseter_Backing.course.id}" />
                                <f:param name="scrolling" value="no" />
                                <f:param name="frameborder" value="0" />
                                <f:param name="height" value="350" />
                            </t:htmlTag>
                        </td>
                        <td class="rightSection">
                            <h1>Informasjon om påmelding og kurs</h1>
                            <t:htmlTag value="img" >
                                <f:param name="src" value="#{CourseHaukeliseter_Backing.course.courseResponsible.profilePicture}" />
                            </t:htmlTag>
                            <p>
                                Hei! Mitt navn er <t:outputText value="#{CourseHaukeliseter_Backing.course.courseResponsible.firstName}"/> og jeg er kursanvarlig på kurset du nå titter på.
                            </p>
                            <p>
                                Kurspåmelding og overnatting administreres av Haukeliseter Fjellstue. For å melde deg på et kurs kan du ringe resepsjonen på Haukeliseter (tlf 35062777), sende en forespørsel til <a href="mailto:info@haukeliseter.no">info@haukeliseter.no</a> eller bruke skjemaet til venstre.
                            </p>
                            <p>
                                Vær oppmerksom på at kurset kan være fullbooket! For mer info om ledige plasser, rom og forskjellige boalternativ, ring resepsjonen!
                            </p>
                            <p>
                                Vi håper du finner det du trenger av informasjon. Har du noen spørsmål send meg en mail på
                                <t:htmlTag value="a">
                                    <f:param name="href" value="mailto:#{CourseHaukeliseter_Backing.course.courseResponsible.userName}" />
                                    <h:outputText value="#{CourseHaukeliseter_Backing.course.courseResponsible.userName}" escape="false"/>
                                </t:htmlTag>
                                eller ring på <t:outputText value="#{CourseHaukeliseter_Backing.course.courseResponsible.phone}"/>
                            </p>
                         </td>
                    </tr>
                </table>
            </h:form>
        </f:view>
    </body>
    <jsp:include page="Ending.jsp" ></jsp:include>

