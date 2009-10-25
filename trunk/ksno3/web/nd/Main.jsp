<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<title>kitesurfing.no</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" title="default" href="css/main_default.css" />
<link rel="stylesheet" type="text/css" title="news" href="css/main_news.css" />
<script src="http://www.google.com/jsapi?key=ABQIAAAAXvZjzH-5KE_GOtuiRIcN6xRWocm2CbSUxy6tnc3IdZkGwKhZRxR9D3Ff24LqcYf7yiqC2PTSUCdCFQ" type="text/javascript"></script>
<script type="text/javascript">
    //<![CDATA[

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

    var viewport = {
        o: function() {
            if (self.innerHeight) {
                this.pageYOffset = self.pageYOffset;
                this.pageXOffset = self.pageXOffset;
                this.innerHeight = self.innerHeight;
                this.innerWidth = self.innerWidth;
            } else if (document.documentElement && document.documentElement.clientHeight) {
                this.pageYOffset = document.documentElement.scrollTop;
                this.pageXOffset = document.documentElement.scrollLeft;
                this.innerHeight = document.documentElement.clientHeight;
                this.innerWidth = document.documentElement.clientWidth;
            } else if (document.body) {
                this.pageYOffset = document.body.scrollTop;
                this.pageXOffset = document.body.scrollLeft;
                this.innerHeight = document.body.clientHeight;
                this.innerWidth = document.body.clientWidth;
            }
            return this;
        },
        init: function(el, w, h) {
            var imgW = (parseInt($(el).width()) > 50) ? $(el).width() : w;
            var imgH = (parseInt($(el).height()) > 50) ? $(el).height() : h;
            $(el).css("left",Math.round(viewport.o().innerWidth/2) + viewport.o().pageXOffset - Math.round(imgW/2));
            $(el).css("top",Math.round(viewport.o().innerHeight/2) + viewport.o().pageYOffset - Math.round(imgH/2));
            return parseInt($(el).width());
        }
    };

    function openModalVideo(url){
        var id = '#dialog';

        //Get the screen height and width
        var maskHeight = Math.max(document.body.scrollHeight, document.body.clientHeight);
        var maskWidth = Math.max(document.body.scrollWidth, document.body.clientWidth);


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
        viewport.init(id, videoWidth, videoHeight );
        //transition effect
        $(id).fadeIn(2000);

    }

    function openModalImage(image){
        //Get the A tag
        var url = image.attr("src");
        var imgHeight = image.height();
        var imgWidth = image.width();
        var factor = 1;
        try{
            if(url != undefined && url.indexOf("s288") > 0){
                url = url.replace(/s288/,"s800");
                factor = 800/288;
            }else if(url != undefined && url.indexOf("s400") > 0){
                url = url.replace(/s400/,"s800");
                factor = 800/400;
            }
        }catch(err){}
        imgHeight = Math.round(imgHeight * factor);
        imgWidth = Math.round(imgWidth * factor);
        var val ="<img src='"+ url +"'/>";
        var id = '#dialog';
        $(id).html(val);

        //Get the screen height and width
        var maskHeight = Math.max(document.body.scrollHeight, document.body.clientHeight);
        var maskWidth = Math.max(document.body.scrollWidth, document.body.clientWidth);

        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight,'left':'0','top':'0'});
        //transition effect
        $('#mask').fadeIn(1000);
        $('#mask').fadeTo("slow",0.8);

        //Get the window height and width
        //var winH = $(window).height();
        //var winW = $(window).width();

        viewport.init(id, imgWidth, imgHeight );
        $(id).fadeIn(2000);


        $(id).click(function(event){
            $('#mask, .window').hide();
        });


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
            $("#dialog").html("");
            $(this).hide();
            $('.window').hide();
        });
        var queryParams = $(this).attr("location").search;
        if(queryParams != undefined && queryParams.indexOf("content")> 0){
            var url = queryParams.substring(queryParams.indexOf("content=")+8);
            if(url != undefined && url != "" && url.toLowerCase().indexOf("jsp") > 0 || url.toLowerCase().indexOf("html") > 0){
                $('#content').attr('src',url);
            }
        }
    });

    google.load("search", "1");

    var app;
    function OnLoad() {
      app = new App();
    }


    function App() {
      // Create a search control
      var searchControl = new google.search.SearchControl();
      searchControl.setSearchStartingCallback(this, App.prototype.OnSearchStarting);
      // Add in a full set of searchers
      var siteSearch = new google.search.WebSearch();
      siteSearch.setSiteRestriction("kitesurfing.no");
      searchControl.addSearcher(siteSearch);
      //searchControl.addSearcher(new google.search.VideoSearch());
      //searchControl.addSearcher(new google.search.BlogSearch());

      // Set the Local Search center point
      //localSearch.setCenterPoint("New York, NY");

      // Tell the searcher to draw itself and tell it where to attach
      searchControl.draw(document.getElementById("searchcontrol"));

      // Execute an inital search
      //searchControl.execute("Google");
    }
    google.setOnLoadCallback(OnLoad);

App.prototype.OnSearchStarting = function(sc, searcher, query) {
  alert("The Query is: " + query);
}



    //]]>
</script>
<style>
    input.gsc-search-button  {color:red};
    div.gsc-clear-button {background-color:black}
    div.gsc-results {background-color:white}

    #mask {
        position:absolute;
        z-index:9000;
        background-color:#000;
        display:none;
    }

    #boxes .window {
        position:absolute;
        display:none;
        z-index:9999;
        padding:20px;
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
                    <td><a href="Home.jsp" target="content"><img src="img/logo.jpg" alt="kitesurfing.no logo"/></a></td>
                    <td class="top">
                        <a href="../secureA/AdminMain.jsp" target="_blank" style="width:40">Log in</a>
                    </td>
                </tr>
                <tr>
                    <td class="main">
                        <table id="mainMenu">
                            <tr>
                                <td style="width:58px;"><a style="font-weight:bolder" href="Home.jsp" target="content">Hjem</a></td>
                                <td style="width:80px"><a href="Articles.jsp" target="content">Publisert</a></td>
                                <td style="width:98px"><a href="CourseJaren.jsp" target="content" >Sommerkurs</a></td>
                                <td style="width:86px"><a href="CoursesHaukeliseter.jsp" target="content">Vinterkurs</a></td>
                                <td style="width:86px"><a href="aboutUs.jsp" target="content">Om oss</a></td>
                            </tr>
                        </table>
                    </td>
                    <td> <div style="position:absolute; z-index:100; top:10; left:400" id="searchcontrol">Loading...</div></td>
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





