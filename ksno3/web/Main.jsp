<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
    <head>
        <title>kitesurfing.no</title>
        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="resources/css/default.css" />
        <link rel="stylesheet" type="text/css" title="default" href="resources/css/main_default.css" />
        <link rel="stylesheet" type="text/css" title="news" href="resources/css/main_news.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/main.css" />
        <script src="http://www.google.com/jsapi?key=ABQIAAAAXvZjzH-5KE_GOtuiRIcN6xRWocm2CbSUxy6tnc3IdZkGwKhZRxR9D3Ff24LqcYf7yiqC2PTSUCdCFQ" type="text/javascript"></script>
        <script src="resources/js/main.js" type="text/javascript"></script>
        <meta name="google-site-verification" content="-ZwDt6i3xUhafWDy__ad3m49lV0uWnB6mLanDlhAe9w" />
        <meta name="description" content="Lære å kite? Vi holder kitekurs på Jæren og Haukeliseter. kitesurfing.no er en etablert kiteskole som ønsker å tilby en sikker, morsom og spennende opplevelse til deg som ønsker å mestre kitesurfing!" />
    </head>
    <jsp:include page="GoogleAnalytics.jsp"></jsp:include>
    <body>
        <div class="topMenu">
            <table>
                <tr>
                    <td>
                        <a href="hjem" target="content">
                            <img src="resources/img/logos/logo.jpg" alt="kitesurfing.no logo"/>
                        </a>
                    </td>
                    <td class="top">
                        <a href="faces/secureA/AdminMain.jsp" target="_blank" style="width:40">Log in</a>
                    </td>
                </tr>
                <tr>
                    <td class="main">
                        <table id="mainMenu">
                            <tr>
                                <td style="width:58px;">
                                    <a target="content" href="hjem" style="font-weight:bolder">Hjem</a>
                                </td>
                                <td style="width:116px">
                                    <a target="content" href="artikler-og-videoer">Artikler &amp; video</a>
                                <td style="width:98px">
                                    <a target="content" href="kurs/sommer">Sommerkurs</a>
                                <td style="width:86px">
                                    <a target="content" href="kurs/vinter">Vinterkurs</a>
                                </td>
                                <td style="width:86px">
                                    <a target="content" href="om-oss">Om oss</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td> <div style="position:absolute; z-index:8888; top:112; left:678" id="searchcontrol">&nbsp;</div></td>
                </tr>
            </table>
        </div>
        <iframe name="content" id="content" src="hjem" style="width:940px" frameborder="0" scrolling="no"></iframe>
        <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
        <div id="mask"></div>
        <a style="display:none" href="#dialog" name="modal">Simple Modal Window</a>
        <!-- #customize your modal window here -->
        <div id="boxes">
            <div id="dialog" class="window">
                <a href="#" class="close">Close it</a>
            </div>
        </div>

        <div class="footer">
            <p>Copyright &copy; 2008 Kitesurfing.no</p>
            <p>Call: 47753527 Mail: info@kitesurfing.no</p>
        </div>
    </body>
</html>





