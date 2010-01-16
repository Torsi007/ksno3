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
        <jsp:include page="Menu.jsp" >
            <jsp:param name="fromMain" value="true"/>
        </jsp:include>
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





