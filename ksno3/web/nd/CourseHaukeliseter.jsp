
<%-- 
    Document   : SignUp
    Created on : 07.okt.2008, 20:01:44
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   
<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/courseHaukeliseter.css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/default.js"></script>
        <script type="text/javascript" src="js/jquery.skinned-select.js"></script>
    </head>
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
                                        <td>Pris:</td><td class="right" align="right">1900</td><td>,-</td>
                                    </tr>
                                    <tr>
                                        <td>Neoprenleie:</td><td class="right" align="right">200</td><td>,-</td>
                                    </tr>
                                </table>
                             </div>
                        </td>
                        <td class="middleSection"></td>
                        <td class="rightSection">
                            <div>
                                <h1>Les om tidligere kurs!</h1>
                                <t:dataList value="#{CourseHaukeliseter_Backing.courseArticles}" var="article">
                                    <t:htmlTag value="a">
                                        <f:param name="href" value="../nd/Article.jsp?id=#{article.id}" />
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
                                <f:param name="src" value="../nd/SignUpHaukeliseter.jsp?courseId=#{CourseHaukeliseter_Backing.id}" />
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
                                <embed src="http://vimeo.com/moogaloop.swf?clip_id=1374480&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="533" height="300">
                            </p>
                        </td>
                    </tr>
                </table>
            </h:form>
        </f:view>       
    </body>
</html>
