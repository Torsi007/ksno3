<jsp:include page="Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<title>kitesurfing.no</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/aboutUs.css" />
<script type="text/javascript" src="resources/js/default.js"></script>
<meta name="description" content="Kitesurfing.no er en etablert kiteskole som ønsker å tilby en sikker, morsom og spennende opplevelse til deg som ønsker å mestre kitesurfing!" />
</head>
<jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
<body>
    <f:view>
        <h:form>
            <jsp:include page="Menu.jsp" >
                <jsp:param name="fromMain" value="false"/>
            </jsp:include>
            <table class="middleSection">
                <tr>
                    <td class="leftSection" >
                        <div>
                            <font style="font-size: 18px;">
                                Kitesurfing.no</font> har kj&oslash;rt kitekurs p&aring; J&aelig;ren
                            siden 2001 og var en av de f&oslash;rste kiteskolene i
                            Norge. Siden da har vi opparbeidet oss mye
                            erfaring noe som gj&oslash;r oss til en av de beste
                            kursbedriftene i landet.
                            <br>
                            V&aring;r forretning fokuserer prim&aelig;rt p&aring; kursaktiviteter
                            noe som gj&oslash;r oss veldig fleksible. Vi skreddersyr og
                            tilrettelegger våre kurs slik at vi kan im&oslash;tekomme
                            v&aring;re kunders behov og forventninger samtidig som vi
                            ivaretar det som betyr mest: <font style="font-size: 18px;">Sikkerhet og moro!</font>
                        </div>
                    </td>
                    <td class="rightSection">
                        <font style="font-size: 18px; margin: 0px 20px 8px 220px; display:block">KSNO er en etablert kiteskole som
                            &oslash;nsker &aring; tilby en sikker, morsom og
                            spennende opplevelse til deg som
                            &oslash;nsker &aring; mestre kitesurfing!
                        </font>
                    </td>
                </tr>
            </table>
            <table class="bottomSection">
                <tr>
                    <td class="leftSection" rowspan="2">
                        <h1>Instruktørene</h1>
                        <t:dataList value="#{AboutUs_Backing.instructors}" var="instructor">
                            <t:graphicImage url="#{instructor.profilePicture}" alt="#{instructor.firstName} #{instructor.lastName}"/>
                            <t:htmlTag value="h2">
                                <h:outputText value="#{instructor.firstName} #{instructor.lastName}"/>
                            </t:htmlTag>
                            <t:htmlTag value="p">
                                <h:outputText value="#{instructor.aboutMe.body}"/>
                            </t:htmlTag>
                        </t:dataList>
                    </td>
                    <td class="rightSection">
                        <h1>Video</h1>
                        <p>Se v&aring;r promoteringsvideo hvor vi presenterer v&aring;rt vinteropplegg p&aring; Haukeliser.</p>
                <embed src="http://vimeo.com/moogaloop.swf?clip_id=1374480&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="533" height="300">
                    </td>
                    </tr>
            </table>
        </h:form>
    </f:view>
</body>
<jsp:include page="Ending.jsp" ></jsp:include>


