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
                <a style="display:block;margin-top:46px" href="http://www.facebook.com/kitesurfing.no"><img src="http://farm5.static.flickr.com/4010/4268836837_17495fbf65_o.gif"></img></a>
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
</div>