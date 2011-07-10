<%
    String hrefTarget = "target='content'";
    String homeUrl = "hjem";
    String articlesAndVideosUrl = "artikler-og-videoer";
    String coursesSummerUrl = "kurs/sommer";
    String coursesWinterUrl = "kurs/vinter";
    String aboutUsUrl = "om-oss";
    String searchVisible = "display:block;";
    String cssVisibleStyle="";
    if(request.getParameter("fromMain").equalsIgnoreCase("false")){
        hrefTarget = "";
        homeUrl = request.getContextPath() + "/faces/Main.jsp?content=Home.jsp";
        articlesAndVideosUrl = request.getContextPath() + "/faces/Main.jsp?content=Articles.jsp";
        coursesSummerUrl = request.getContextPath() + "/faces/Main.jsp?content=CourseJaren.jsp";
        coursesWinterUrl = request.getContextPath() + "/faces/Main.jsp?content=CoursesHaukeliseter.jsp";
        aboutUsUrl = request.getContextPath() + "/faces/Main.jsp?content=aboutUs.jsp";
        searchVisible = "";
        cssVisibleStyle="style='display:none'";
    }
%>

<div class="topMenu" <%= cssVisibleStyle %>>
    <table>
        <tr>
            <td>
                <a href="<%= homeUrl %>" target="content">
                    <img src="${request.contextPath}/resources/img/logos/logo.jpg" alt="kitesurfing.no logo"/>
                </a>
            </td>
            <td class="top">
                <a href="faces/secureA/AdminMain.jsp" target="_blank" style="width:40">Log in</a>
                <a style="display:block;margin-top:16px" href="javascript:openTranslateMenu()">
                   <img src="${request.contextPath}/resources/img/translate.png"></img><span style="padding-left:6px; height:21px; cursor:hand">Translate</span>
                </a>
                <a style="display:block;margin-top:8px" href="http://www.facebook.com/kitesurfing.no"><img src="http://farm5.static.flickr.com/4010/4268836837_17495fbf65_o.gif"></img></a>
            </td>
        </tr>
        <tr>
            <td class="main">
                <table id="mainMenu">
                    <tr>
                        <td style="width:58px;">
                            <a <%= hrefTarget %> href="<%= homeUrl %>" style="font-weight:bolder">Hjem</a>
                        </td>
                        <td style="width:116px">
                            <a <%= hrefTarget %> href="<%= articlesAndVideosUrl %>">Artikler &amp; video</a>
                        <td style="width:98px">
                            <a <%= hrefTarget %> href="<%= coursesSummerUrl %>">Sommerkurs</a>
                        <td style="width:86px">
                            <a <%= hrefTarget %> href="<%= coursesWinterUrl %>">Vinterkurs</a>
                        </td>
                        <td style="width:86px">
                            <a <%= hrefTarget %> href="<%= aboutUsUrl %>">Om oss</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <div style="<%= searchVisible %> position:absolute; z-index:8888; top:112; left:678" id="searchcontrol">&nbsp;</div></td>
        </tr>
    </table>
    <div id="translateMenu" style="position:absolute; z-index:9999; display:none; background-color:white">
        <h3>Hi</h3>
        <p>
            We regret that our page is not available in English. However, you can try to translate our site to choose English in the drop down menu below. We can not guarantee perfect language, and layout of the site will possibly be impaired, but you will hopefully understand the most important. Need more details, please do not hesitate to contact us by mail or phone info@kitesurfing.no
        </p>
        <h3>Hola</h3>
        <p>
            Lamentamos que nuestro sitio está disponible en alemán. Sin embargo, usted puede tratar de traducir nuestro sitio web y elegir Inglés en el menú desplegable a continuación. No podemos garantizar el lenguaje perfecto, y el diseño del sitio, posiblemente se verá afectado, pero se espera que entender la más importante. ¿Necesita más información, por favor no dude en contactar con nosotros por correo info@kitesurfing.no
        </p>
        <div id="google_translate_element" class="google_translate_element" ></div>
            <script>
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({
                pageLanguage: 'no',
                includedLanguages: 'en,es',
                autoDisplay: false
              }, 'google_translate_element');

            }
            </script>
            <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>'
        </div>
    </div>
</div>