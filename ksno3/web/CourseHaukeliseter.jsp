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
                                <table>
                                    <tr>
                                        <td>Antall plasser:</td><td class="right" align="right"><h:outputText value="#{CourseHaukeliseter_Backing.course.maxSize}"/></td><td></td>
                                    </tr>
                                    <tr>
                                        <td>Ledige plasser:</td><td class="right" align="right"><h:outputText value="#{CourseHaukeliseter_Backing.course.availableSeats}"/></td><td></td>
                                    </tr>
                                    <tr>
                                        <td>Pris:</td><td class="right" align="right">1950</td><td>,-</td>
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
                                        <f:param name="href" value="#{Current_Backing.contextPath}/artikkel#{article.prettyPrintId}" />
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
                            <h1>Hei</h1>
                            <t:htmlTag value="img" >
                                <f:param name="src" value="#{CourseHaukeliseter_Backing.course.courseResponsible.profilePicture}" />
                            </t:htmlTag>
                            <p>
                                Mitt navn er <t:outputText value="#{CourseHaukeliseter_Backing.course.courseResponsible.firstName}"/> og jeg er kursanvarlig på kurset du nå titter på. Vi håper du finner det du trenger av informasjon. Har du noen spørsmål send meg en mail på
                                <t:htmlTag value="a">
                                    <f:param name="href" value="#{CourseHaukeliseter_Backing.course.courseResponsible.userName}" />
                                    <h:outputText value="#{CourseHaukeliseter_Backing.course.courseResponsible.userName}" escape="false"/>
                                </t:htmlTag>
                                eller ring på <t:outputText value="#{CourseHaukeliseter_Backing.course.courseResponsible.phone}"/>
                            </p>
                            <h1>Deltagere</h1>
                            <table>
                                <tr>
                                    <td>
                                        <h2>Påmeldte</h2>
                                        <t:dataList value="#{CourseHaukeliseter_Backing.course.participations}" var="participation">
                                            <t:htmlTag value="span" rendered="#{!participation.onWaitList}">
                                                <t:outputText value="#{participation.participant.firstName} #{participation.participant.lastName}"/>
                                            </t:htmlTag>
                                        </t:dataList>
                                    </td>
                                    <td>
                                        <h2>Venteliste</h2>
                                        <t:dataList value="#{CourseHaukeliseter_Backing.course.participations}" var="participation">
                                            <t:htmlTag value="span" rendered="#{participation.onWaitList}">
                                                <t:outputText value="#{participation.participant.firstName} #{participation.participant.lastName}"/>
                                            </t:htmlTag>
                                        </t:dataList>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table>
            </h:form>
        </f:view>
    </body>
    <jsp:include page="Ending.jsp" ></jsp:include>

