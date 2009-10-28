<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<title>kitesurfing.no</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" title="default" href="resources/css/main_default.css" />
<link rel="stylesheet" type="text/css" title="news" href="resources/css/main_news.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<script src="http://www.google.com/jsapi?key=ABQIAAAAXvZjzH-5KE_GOtuiRIcN6xRWocm2CbSUxy6tnc3IdZkGwKhZRxR9D3Ff24LqcYf7yiqC2PTSUCdCFQ" type="text/javascript"></script>
<script src="resources/js/main.js" type="text/javascript"></script>
</head>
<jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
<body>
    <f:view>
        <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
        <div id="mask"></div>
        <a style="display:none" href="#dialog" name="modal">Simple Modal Window</a>
        <!-- #customize your modal window here -->
        <div id="boxes">
            <div id="dialog" class="window">
                <a href="#" class="close">Close it</a>
            </div>
        </div>
        <div class="topMenu">
            <table>
                <tr>
                    <td><a href="Home.jsp" target="content"><img src="resources/img/logos/logo.jpg" alt="kitesurfing.no logo"/></a></td>
                    <td class="top">
                        <a href="secureA/AdminMain.jsp" target="_blank" style="width:40">Log in</a>
                    </td>
                </tr>
                <tr>
                    <td class="main">
                        <table id="mainMenu">
                            <tr>
                                <td style="width:58px;"><a style="font-weight:bolder" href="Home.jsp" target="content">Hjem</a></td>
                                <td style="width:116px"><a href="Articles.jsp" target="content">Artikler & video</a></td>
                                <td style="width:98px"><a href="CourseJaren.jsp" target="content" >Sommerkurs</a></td>
                                <td style="width:86px"><a href="CoursesHaukeliseter.jsp" target="content">Vinterkurs</a></td>
                                <td style="width:86px"><a href="aboutUs.jsp" target="content">Om oss</a></td>
                            </tr>
                        </table>
                    </td>
                    <td> <div style="position:absolute; z-index:8888; top:112; left:678" id="searchcontrol">&nbsp;</div></td>
                </tr>
            </table>
        </div>
        <iframe name="content" id="content" src="Home.jsp" style="width:940px" frameborder="0" scrolling="no"></iframe>
        <div class="footer">
            <p>Copyright &copy; 2008 Kitesurfing.no</p>
            <p>Call: 47753527 Mail: info@kitesurfing.no</p>
        </div>
    </f:view>
</body>
<jsp:include page="Ending.jsp" ></jsp:include>





