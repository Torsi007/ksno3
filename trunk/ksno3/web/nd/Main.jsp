<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<title>kitesurfing.no</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" title="default" href="css/main_default.css" />
<link rel="stylesheet" type="text/css" title="news" href="css/main_news.css" />
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

    function openModalVideo(url){
        //Get the A tag
        var id = '#dialog';

        //Get the screen height and width
        var maskHeight = document.body.scrollHeight;
        var maskWidth = document.body.scrollWidth;

        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight,'left':'0','top':'0'});
        //transition effect
        $('#mask').fadeIn(1000);
        $('#mask').fadeTo("slow",0.8);

        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
        var videoWidth = '650';

        var videoHeight = '505';

        var val ="<object width='"+videoWidth+"' height='"+videoHeight+"'><param name='movie' value='"+url+"'></param><param name='allowFullScreen' value='true'></param><param name='allowscriptaccess' value='always'></param><embed src='"+url+"' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true' width='"+videoWidth+"' height='"+videoHeight+"'></embed></object>";
        $(id).html(val);

        //Set the popup window to center
        $(id).css('top',  (winH/2)-(videoHeight/2));
        $(id).css('left', (winW/2)-(videoWidth/2));

        //transition effect
        $(id).fadeIn(2000);

    }

    function getPos(img, imgs){


    }

    function openModalImage(url){
        //Get the A tag
        var id = '#dialog';
        try{
            if(url != undefined && url.indexOf("s288")){
                url = url.replace(/s288/,"s800");
                url = url.replace(/s400/,"s800");
            }
        }catch(err){}

        //Get the screen height and width
        var maskHeight = document.body.scrollHeight;
        var maskWidth = document.body.scrollWidth;

        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight,'left':'0','top':'0'});
        //transition effect
        $('#mask').fadeIn(1000);
        $('#mask').fadeTo("slow",0.8);

        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();

        var val ="<img src='"+ url +"'/>";
        $(id).html(val);


        var videoHeight = 800;
        var videoWidth = 600;
        if(jQuery.browser.msie){
            videoHeight = $(id).height();
            videoWidth = $(id).width();
        }else{
            videoHeight = $(id).children(0).get(0).naturalHeight;
            videoWidth = $(id).children(0).get(0).naturalWidth;
        }
        //Set the popup window to center
        $(id).css('top',  (winH/2)-(videoHeight/2));
        $(id).css('left', (winW/2)-(videoWidth/2));

        $(id).click(function(event){
            $('#mask, .window').hide();
        });

        //transition effect
        $(id).fadeIn(2000);

    }



    $(document).ready(function(){
        //select all the a tag with name equal to modal
        //if close button is clicked
        $('.window .close').click(function (e) {
            //Cancel the link behavior
            e.preventDefault();
            $('#mask, .window').hide();
        });

        //if mask is clicked
        $('#mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });
    });
</script>
<style>

    #mask {
        position:absolute;
        z-index:9000;
        background-color:#000;
        display:none;
    }

    #boxes .window {
        position:absolute;
        width:440px;
        height:200px;
        display:none;
        z-index:9999;
        padding:20px;
    }


    /* Customize your modal window here, you can add background image too */
    #boxes #dialog {
        width:375px;
        height:203px;
    }
</style>
</head>
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
                    <td></td>
                    <td class="top">
                        <a href="../secureA/AdminMain.jsp" target="_blank" style="width:40">Log in</a>
                    </td>
                </tr>
                <tr>
                    <td class="main">
                        <table id="mainMenu">
                            <tr>
                                <td style="width:58px;"><a style="font-weight:bolder" href="Home.jsp" target="content">Hjem</a></td>
                                <td style="width:70px"><a href="Articles.jsp" target="content">Nyheter</a></td>
                                <td style="width:98px"><a href="CourseJaren.jsp" target="content" >Sommerkurs</a></td>
                                <td style="width:86px"><a href="CoursesHaukeliseter.jsp" target="content">Vinterkurs</a></td>
                                <td style="width:86px"><a href="aboutUs.jsp" target="content">Om oss</a></td>
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
<jsp:include page="Ending.jsp" ></jsp:include>






