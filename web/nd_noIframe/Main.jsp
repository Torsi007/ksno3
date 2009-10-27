<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<html>
    <head>
        <title>Kitesurfing.no</title>
        <link rel="stylesheet" type="text/css" href="default.css" />
        <link rel="stylesheet" type="text/css" title="home" href="home.css" />
        <link rel="stylesheet" type="text/css" title="aboutUs" href="aboutUs.css" />
        <link rel="stylesheet" type="text/css" title="article1" href="../resources/css/article1.css" />
        <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript" src="main.js"></script>
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
                            <table>
                                <tr>
                                    <td style="width:50px;"><a rel="home" style="font-weight:bolder" href="Home.jsp">Home</a></td>
                                    <td style="width:42"><a href="http://www.vg.no" >News</a></td>
                                    <td style="width:104"><a href="http://www.vg.no" >Courses J&aelig;ren</a></td>
                                    <td style="width:144"><a href="http://www.vg.no" >Courses Haukeliseter</a></td>
                                    <td style="width:80"><a rel="aboutUs" href="aboutUs.html" >About us</a></td>
                                </tr>
                            </table>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div id="content">
            </div>
            <div class="footer">
                <p>Copyright &copy; 2008 Kitesurfing.no</p>
                <p>Call: 47753527 Mail: info@kitesurfing.no</p>
            </div>
        </f:view>
    </body>
</html>





