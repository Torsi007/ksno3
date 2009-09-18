<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<html>
    <head>
        <title>kitesurfing.no</title>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" title="default" href="css/main_default.css" />
        <link rel="stylesheet" type="text/css" title="news" href="css/main_news.css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript">
            function setStyle(styleName)
            {
                $("link[@rel*=style][title]").each(function(i)
                {
                    this.disabled = true;
                    if (this.getAttribute("title") == styleName){
                        this.disabled = false;
                    }
                });
            }
        </script>
    </head>
    <body>
        <f:view>
            <div class="topMenu">
                <table>
                    <tr>
                        <td></td>
                        <td class="top">
                            <a href="../secureA/AdminMain.jsp" target="_blank" style="width:40">Log in</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="main">
                            <table id="mainMenu">
                                <tr>
                                    <td style="width:58px;"><a style="font-weight:bolder" href="Home.jsp" target="content">Home</a></td>
                                    <td style="width:50"><a href="Articles.jsp" target="content">News</a></td>
                                    <td style="width:112"><a href="CourseJaren.jsp" target="content" >Courses J&aelig;ren</a></td>
                                    <td style="width:152"><a href="http://www.vg.no" >Courses Haukeliseter</a></td>
                                    <td style="width:86"><a href="aboutUs.html" target="content">About us</a></td>
                                </tr>
                            </table>
                        </td>
                        <td></td>
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
</html>





