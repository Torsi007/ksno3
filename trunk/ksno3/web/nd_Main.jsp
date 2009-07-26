<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<html>
    <head>
        <title>Kitesurfing.no</title>
        <link rel="stylesheet" type="text/css" href="nd_style.css" />
        <link rel="stylesheet" type="text/css" title="home" href="home.css" />
        <link rel="stylesheet" type="text/css" title="aboutUs" href="aboutUs.css" />
        <script type="text/javascript" src="jquery-1.3.2.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                switchStylestyle("home");
                $("#content").load("home.html");
                $("td.main a").click(function(){
                    setContent(this.getAttribute("href"));
                    switchStylestyle(this.getAttribute("rel"));
                    return false;
                });
            });

            function setContent(url){
                $("#content").load(url);
            }

            function switchStylestyle(styleName)
            {
                $("link[@rel*=style][title]").each(function(i)
                {
                    this.disabled = true;
                    if (this.getAttribute("title") == styleName){
                        //alert("enable " + this.getAttribute("href"));
                        this.disabled = false;
                    }else{
                        //alert("disable " + this.getAttribute("href"));
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
                            <a href="http://www.vg.no" style="width:40">Newsletter</a>
                            |
                            <a href="http://www.vg.no" style="width:40">Log in</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="main">
                            <table>
                                <tr>
                                    <td style="width:50px;"><a rel="home" style="font-weight:bolder" href="home.html">Home</a></td>
                                    <td style="width:40"><a href="http://www.vg.no" >News</a></td>
                                    <td style="width:110"><a href="http://www.vg.no" >Courses J&aelig;ren</a></td>
                                    <td style="width:140"><a href="http://www.vg.no" >Courses Haukeliseter</a></td>
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





