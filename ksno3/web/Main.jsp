<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<title>kitesurfing.no</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" title="default" href="resources/css/main_default.css" />
<link rel="stylesheet" type="text/css" title="news" href="resources/css/main_news.css" />
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


        if ($.browser.mozilla) {
           // $('#searchcontrol').css('left','800');
        }
        if ($.browser.msie) {
           // $('#searchcontrol').css('left','790');
        }

            var windW = $(window).width();
            var contW = 940;
            var compW = 300;
            var w = Math.max(((windW - contW )/2), 0) + contW - compW;
            $('#searchcontrol').css('left',w);

        $(window).resize(function(){
            var windW = $(window).width();
            var contW = 940;
            var compW = 300;
            var w = Math.max(((windW - contW )/2), 0) + contW - compW;
            $('#searchcontrol').css('left',w);
        });





    });

    google.load("search", "1", {"nocss" : true});

    var app;
    function OnLoad() {
      app = new App();
    }


    function App() {
      // Create a search control
      var searchControl = new google.search.SearchControl();
      searchControl.setSearchStartingCallback(this, App.prototype.OnSearchStarting);
      searchControl.setSearchCompleteCallback(this, App.prototype.OnSearchComplete);

      // Add in a full set of searchers
      var siteSearch = new google.search.WebSearch();
      siteSearch.setSiteRestriction("kitesurfing.no");
        options = new google.search.SearcherOptions();
        options.setExpandMode(google.search.SearchControl.EXPAND_MODE_OPEN);

      searchControl.addSearcher(siteSearch, options);

      // Tell the searcher to draw itself and tell it where to attach
      searchControl.draw(document.getElementById("searchcontrol"));
      $(searchControl.input).css("width","100px");
      $(searchControl.input).parent().attr("align","right");
      $(".gsc-branding").remove();
      $(".gsc-search-button").attr("value","").attr("title","");
      $("td.gsc-clear-button").css("display","none");
      $("form.gsc-search-box").prepend("<div id='branding'></div>");
      google.search.Search.getBranding(document.getElementById("branding"));


      // Execute an inital search
      //searchControl.execute("Google");
    }
    google.setOnLoadCallback(OnLoad);

App.prototype.OnSearchStarting = function(sc, searcher, query) {
        //Get the screen height and width
        $(sc.input).css("width","100px");
        var maskHeight = Math.max(document.body.scrollHeight, document.body.clientHeight);
        var maskWidth = Math.max(document.body.scrollWidth, document.body.clientWidth);

}

App.prototype.OnSearchComplete = function(sc, searcher) {
        //Get the screen height and width
         $(".gs-webResult a").attr("target","content");
         $(".gsc-configLabelCell").html($("td.gsc-clear-button").html());
         $(".gsc-title").html("Resultater");
         $(sc.input).css("width","100px");
         $(".gsc-configLabelCell").click(function () {
            sc.clearAllResults();
        });




}



    //]]>
</script>
<style>

.gsc-control {
width:300px;
}
.gsc-control div {
position:static;
}
.gsc-control-cse {
font-family:Arial,sans-serif;
font-size:13px;
width:100%;
}
.gsc-control-cse div {
position:static;
}
form.gsc-search-box {
font-size:13px;
margin:0 0 4px;
width:100%;
}

table.gsc-search-box td {
vertical-align:middle;
}

td.gsc-search-button {
width:1%;
}
td.gsc-clear-button {
width:14px;
}
table.gsc-branding td, table.gsc-branding {
border:medium none;
margin:0;
padding:0;
}
table.gsc-branding {
border-spacing:0;
border-style:none;
border-width:0;
width:100%;
}
.gsc-branding-text {
color:#676767;
}
td.gsc-branding-text {
vertical-align:top;
}
td.gsc-branding-text div.gsc-branding-text {
font-size:11px;
margin-right:2px;
padding-bottom:2px;
text-align:right;
}
div.gsc-branding-youtube td.gsc-branding-text {
vertical-align:middle;
}

td.gsc-branding-img {
vertical-align:bottom;
width:65px;
}
div.gsc-branding-youtube td.gsc-branding-img-noclear {
width:55px;
}
div.gsc-branding-youtube td.gsc-branding-img {
width:69px;
}
table.gsc-branding-vertical td.gsc-branding-text div.gsc-branding-text {
margin-right:0;
text-align:center;
}
table.gsc-branding-vertical td.gsc-branding-img-noclear {
text-align:center;
}
div.gsc-branding-img, div.gsc-branding-img-noclear, img.gsc-branding-img, img.gsc-branding-img-noclear {
padding-top:1px;
}
img.gsc-branding-img, img.gsc-branding-img-noclear {
border:medium none;
display:inline;
margin:0;
padding-bottom:0;
padding-left:0;
padding-right:0;
}
a.gsc-branding-clickable {
cursor:pointer;
}

div.gsc-clear-button {
background-image:url(http://www.google.com/uds/css/clear.gif);
background-position:center center;
background-repeat:no-repeat;
cursor:pointer;
display:inline;
margin-left:4px;
margin-right:4px;
padding-left:10px;
text-align:right;
}

.gsc-keeper {
background-image:url(http://www.google.com/uds/css/blue_check.gif);
background-position:1px 3px;
background-repeat:no-repeat;
color:#3366CC;
cursor:pointer;
font-size:13px;
font-weight:normal;
padding-left:16px;
text-decoration:underline;
}
.gsc-resultsHeader {
border-bottom:1px solid #E9E9E9;
clear:both;
margin-bottom:4px;
width:100%;
}
.gsc-resultsHeader td.gsc-twiddleRegionCell {
width:75%;
}
.gsc-resultsHeader td.gsc-configLabelCell {
text-align:right;
width:75%;
}
.gsc-resultsHeader .gsc-twiddle {
background-position:0 2px;
background-repeat:no-repeat;
cursor:pointer;
display:inline;
margin-top:4px;
}


.gsc-resultsHeader .gsc-stats {
color:#676767;
display:inline;
font-size:11px;
font-weight:normal;
}
.gsc-resultsHeader td.gsc-twiddle-opened .gsc-stats {
display:none;
}
.gsc-results-selector {
display:inline;
}
.gsc-resultsHeader td.gsc-twiddle-closed .gsc-results-selector {
display:none;
}
.gsc-result-selector {
background-position:left center;
background-repeat:no-repeat;
cursor:pointer;
display:inline;
font-size:13px;
padding-left:13px;
}

.gsc-resultsHeader .gsc-configLabel {
color:#676767;
cursor:pointer;
display:inline;
font-size:11px;
}
.gsc-resultsHeader td.gsc-configLabelCell span.gsc-twiddle-closed {
background-image:url(http://www.google.com/uds/css/settings.gif);
background-position:center center;
background-repeat:no-repeat;
padding-right:12px;
}
.gsc-tabsArea {
clear:both;
margin-top:6px;
}
.gsc-tabsArea .gs-spacer {
font-size:1px;
margin-right:0;
overflow:hidden;
}
.gsc-tabsArea .gs-spacer-opera {
margin-right:0;
}
.gsc-tabsAreaInvisible {
display:none;
}
.gsc-tabHeader {
cursor:pointer;
display:inline;
margin-right:2px;
padding-left:6px;
padding-right:6px;
}
.gsc-tabHeader.gsc-tabhActive {
border-left:1px solid #E9E9E9;
border-right:1px solid #E9E9E9;
border-top:2px solid #FF9900;
color:black;
}
.gsc-tabHeader.gsc-tabhInactive {
-moz-background-clip:border;
-moz-background-inline-policy:continuous;
-moz-background-origin:padding;
background:#E9E9E9 none repeat scroll 0 0;
border-left:1px solid #E9E9E9;
border-right:1px solid #E9E9E9;
border-top:2px solid #E9E9E9;
color:#676767;
}
.gsc-tabData.gsc-tabdActive {
display:block;
}
.gsc-tabData.gsc-tabdInactive {
display:none;
}
.gsc-tabData .gsc-resultsHeader .gsc-title {
display:none;
}
.gsc-tabData .gsc-resultsHeader .gsc-stats {
display:none;
}
.gsc-tabData .gsc-resultsHeader .gsc-results-selector {
display:none;
}

.gsc-result {
margin-bottom:10px;
}

.gsc-result div.gs-watermark {
display:none;
}
.gsc-results .gsc-result img.gs-ad-marker {
display:none;
}
.gsc-wrapper {
display:block;
position:relative;
}
.gsc-adBlock {
-moz-background-clip:border;
-moz-background-inline-policy:continuous;
-moz-background-origin:padding;
background:#FFF8DD none repeat scroll 0 0;
display:block;
margin-bottom:4px;
margin-top:6px;
padding-bottom:2px;
position:relative;
}
.gsc-adBlock h2 {
color:#676767;
float:right;
font-size:0.9em;
font-weight:normal;
margin:3px 5px 0;
}
.gsc-adBlock .gsc-ad {
padding-left:8px;
padding-right:3px;
padding-top:5px;
}
.gsc-adBlock .gsc-ad a {
color:#0000CC;
font-weight:bolder;
line-height:1.4em;
}
.gsc-adBlock .gsc-ad cite {
color:green;
font-style:normal;
}
.gsc-adBlock .gsc-ad span {
padding-left:8px;
}
.gsc-adBlockInvisible {
display:none;
}
.gsc-adBlockVertical {
border-left:1px solid #C9D7F1;
display:block;
float:right;
position:relative;
width:30%;
}
.gsc-thinWrapper {
float:left;
overflow:hidden;
width:69%;
}
.gsc-adBlockVerticalInvisible {
display:none;
}
.gsc-adBlockVertical h2 {
color:#676767;
font-size:0.9em;
font-weight:normal;
margin-top:6px;
text-align:center;
}
.gsc-adBlockVertical .gsc-ad {
padding-left:8px;
padding-top:5px;
}
.gsc-adBlockVertical .gsc-ad a {
color:#0000CC;
font-weight:bolder;
line-height:1.4em;
}
.gsc-adBlockVertical .gsc-ad cite {
color:green;
display:block;
font-style:normal;
}
.gsc-adBlockVertical .gsc-ad span {
}
.gsc-ad-preview {
background-image:url(http://www.google.com/images/preview.gif);
}
div.gsc-config {
border:1px solid #E9E9E9;
margin-bottom:10px;
margin-top:0;
padding:2px 6px 6px;
}
form.gsc-config {
margin-bottom:0;
}
.gsc-configSetting {
margin-top:6px;
}
.gsc-configSetting_Label {
color:#676767;
}
.gsc-configSettingInput {
border:1px solid #E9E9E9;
color:#676767;
width:75%;
}
.gsc-configSettingCheckbox {
color:#676767;
margin-right:6px;
}
.gsc-configSettingCheckboxLabel {
color:#676767;
display:inline;
}
div.gsc-configSettingSubmit {
margin-top:8px;
text-align:right;
}
input.gsc-configSettingSubmit {
cursor:pointer;
display:inline;
font-size:11px;
}
.gsc-webResult:after {
clear:both;
content:".";
display:block;
height:0;
visibility:hidden;
}
.gsc-webResult {
}
.gs-web-image-box {
border:1px solid #BBBBBB;
float:left;
margin-right:5px;
padding:3px;
}
.gs-web-image-box img.gs-image {
border:1px solid #999999;
}
div.gs-action {
display:inline;
margin-right:0.6em;
}
div.gs-action a.gs-action {
color:#7777CC;
}
div.gs-action.cart a.gs-action, div.gs-action.star a.gs-action, div.gs-action.share a.gs-action, div.gs-action.rss a.gs-action, div.gs-action.facebook a.gs-action, div.gs-action.digg a.gs-action, div.gs-action.twitter a.gs-action, div.gs-action.email a.gs-action, div.gs-action.mobile a.gs-action, div.gs-action.generic a.gs-action, div.gs-action.link a.gs-action {
-moz-background-clip:border;
-moz-background-inline-policy:continuous;
-moz-background-origin:padding;
background:transparent url(http://www.google.com/uds/css/action_icons_sprite.png) no-repeat scroll 0 0;
padding-left:18px;
}
div.gs-action.cart a.gs-action {
background-position:0 0;
}
div.gs-action.star a.gs-action {
background-position:-16px -34px;
}
div.gs-action.rss a.gs-action {
background-position:-48px -98px;
}
div.gs-action.facebook a.gs-action {
background-position:-64px -130px;
}
div.gs-action.twitter a.gs-action {
background-position:-96px -194px;
}
div.gs-action.email a.gs-action {
background-position:-112px -224px;
}
div.gs-action.mobile a.gs-action {
background-position:-131px -257px;
}
div.gs-action.share a.gs-action {
background-position:-32px -64px;
}
div.gs-action.digg a.gs-action {
background-position:-79px -162px;
}
div.gs-action.generic a.gs-action {
background-position:-144px -290px;
}
div.gs-action.link a.gs-action {
background-position:-159px -321px;
}
.gsc-imageResult {
float:left;
margin-bottom:1em;
margin-right:20px;
}
.gs-imageResult {
overflow:hidden;
width:114px;
}
.gs-imageResult .gs-image-box {
height:86px;
position:relative;
}
.gs-imageResult .gs-image-box img.gs-image {
bottom:0;
position:absolute;
}
.gs-imageResult .gs-text-box {
height:4em;
overflow:hidden;
text-align:center;
}
.gs-imageResult .gs-snippet {
cursor:pointer;
line-height:1em;
overflow:hidden;
white-space:nowrap;
}
.gs-imageResult .gs-visibleUrl {
cursor:pointer;
height:1.3em;
line-height:1.3em;
overflow:hidden;
}
.gs-imageResult .gs-size {
color:#6F6F6F;
}
.gsc-videoResult .gs-videoResult .gs-title {
height:1.3em;
line-height:1.3em;
overflow:hidden;
}
.gsc-videoResult .gs-videoResult .gs-snippet {
line-height:1.3em;
max-height:2.6em;
overflow:hidden;
}
.gsc-imageResult .gsc-trailing-more-results {
clear:both;
}
.gsc-results .gsc-trailing-more-results {
margin-bottom:10px;
}

.gsc-imageResult .gsc-cursor-box {
clear:both;
}
.gsc-results .gsc-cursor-box .gsc-trailing-more-results {
display:inline;
margin-bottom:0;
}
.gsc-results .gsc-cursor {
display:inline;
}
.gsc-results .gsc-cursor-box {
margin-bottom:10px;
}


.gs-divider {
color:#676767;
padding-bottom:8px;
text-align:center;
}

.gs-relativePublishedDate, .gs-publishedDate {
color:#6F6F6F;
text-decoration:none;
}
.gs-result a.gs-clusterUrl, .gs-result .gs-clusterUrl {
color:#008000;
cursor:pointer;
text-decoration:underline;
}
.gs-newsResult .gs-publisher {
color:#6F6F6F;
display:inline;
text-decoration:none;
}
.gs-newsResult .gs-relativePublishedDate, .gs-newsResult .gs-publishedDate {
display:inline;
margin-left:4px;
}
.gs-blogResult .gs-relativePublishedDate, .gs-newsResult .gs-relativePublishedDate {
display:none;
}
.gsc-blogResult .gs-blogResult .gs-publishedDate, .gsc-newsResult .gs-newsResult .gs-publishedDate {
display:none;
}
.gsc-blogResult .gs-blogResult .gs-relativePublishedDate, .gsc-newsResult .gs-newsResult .gs-relativePublishedDate {
display:inline;
}
.gs-newsResult .gs-location {
color:#6F6F6F;
display:inline;
text-decoration:none;
}
.gs-promotion {
padding-top:5px;
}
.gs-promotion a {
font-size:14px;
font-weight:bold;
}
.gs-promotion-image {
margin-right:10px;
}
.gs-promotion-image-td {
vertical-align:top;
}
.gs-promotion table {
border:0 none;
border-spacing:0;
margin:0;
padding:0;
}
.gs-promotion table a {
font-size:13px;
font-weight:normal;
padding-right:5px;
}
.gs-result img.gs-image {
border:1px solid #0000CC;
vertical-align:middle;
}
.gs-result div.gs-phone {
}
.gs-result .gs-directions, .gs-result .gs-directions * {
color:#7777CC;
cursor:pointer;
font-weight:normal;
text-decoration:underline;
}
.gs-secondary-link, .gs-secondary-link * {
color:#7777CC;
cursor:pointer;
font-weight:normal;
text-decoration:underline;
}
.gs-result .gs-directions-to-from {
display:none;
margin-top:4px;
}
.gs-result .gs-directions-to-from .gs-label {
display:inline;
margin-right:4px;
}
.gs-result .gs-directions-to-from div.gs-secondary-link {
display:inline;
}
.gs-result .gs-directions-to-from .gs-spacer {
display:inline;
margin-left:3px;
margin-right:3px;
}
.gs-videoResult a.gs-publisher, .gs-videoResult .gs-publisher {
color:#008000;
text-decoration:none;
}
.gs-result a {
cursor:pointer;
}
.gs-result .gs-address {
}

.gs-no-results-result .gs-snippet, .gs-error-result .gs-snippet {
background-color:#FFF4C2;
border:1px solid #FFCC33;
margin:5px;
padding:5px;
}
.gs-result .gs-watermark {
color:#7777CC;
font-size:10px;
}
div.gs-results-attribution {
margin-bottom:4px;
text-align:center;
}
div.gs-results-attribution, div.gs-results-attribution * {
color:#676767;
font-size:10px;
text-decoration:none;
}
div.gs-results-attribution a {
color:#0000CC;
cursor:pointer;
}
div.gs-results-attribution a:hover {
text-decoration:underline;
}
.gs-result .gs-metadata {
color:#676767;
}
.gs-localAd img.gs-ad-marker, .gs-webAd img.gs-ad-marker {
padding-left:4px;
}
.gs-webResult div.gs-visibleUrl-long {
display:none;
overflow:hidden;
width:100%;
}
.gs-localAd div.gs-address * {
color:#676767;
}
.gs-localAd div.gs-street {
display:inline;
}
div.gs-city {
display:inline;
}
div.gs-region {
display:inline;
}
div.gs-country {
display:none;
}
div.gs-infoWindow * {
font-size:11px;
}
.gs-videoResult * {
font-size:13px;
}
.gs-videoResult td div.gs-image-box {
height:78px;
width:110px;
}
.gs-videoResult td div.gs-text-box {
margin-left:4px;
vertical-align:top;
}
div.gs-book-image-box td, .gs-bookResult td {
vertical-align:top;
}
div.gs-book-image-box, div.gs-book-image-box div {
position:static;
text-align:start;
}
div.gs-book-image-box {
height:90px;
width:75px;
}
.gs-bookResult td div.gs-text-box {
margin-left:4px;
vertical-align:top;
}
div.gs-book-image-box img {
border:medium none;
border-spacing:0;
}
div.gs-book-image-box div.gs-row-1 {
line-height:7px;
}
div.gs-book-image-box img.gs-pages {
height:7px;
width:45px;
}
div.gs-book-image-box img.gs-page-edge {
height:7px;
width:11px;
}
div.gs-book-image-box div.gs-row-2 {
}
div.gs-book-image-box img.gs-image {
border:1px solid #A0A0A0;
height:80px;
}
.gs-bookResult .gs-author {
color:#6F6F6F;
display:inline;
}
.gs-bookResult .gs-publishedDate {
display:inline;
}
.gs-bookResult .gs-pageCount {
color:#6F6F6F;
display:inline;
margin-left:4px;
}
.gs-bookResult .gs-id {
}
.gs-patentResult td {
vertical-align:top;
}
.gs-patentResult .gs-patent-number, .gs-patentResult .gs-publishedDate, .gs-patentResult .gs-author {
display:inline;
}
.gs-patentResult .gs-image-box {
padding-right:8px;
}
.gs-patentResult img.gs-image {
border:1px solid #7777CC;
}
.gsc-resultsbox-invisible {
display:none;
}
.gsc-results {
padding-bottom:2px;
width:99%;
}


input.gsc-search-button {
    width:26px; margin:0px; padding:0px; background-color:#fff;
    background-image:url(http://farm3.static.flickr.com/2627/4047251646_fc87fa221a_o.gif);
    background-position:0px -1px;
}

input.gsc-input {
width:80px; margin:0px; padding:0px;
border-style:solid;
border-width:1px;
border-color: #636262;
border-right-width: 0px;

}

table.gsc-search-box td.gsc-input {
padding:0px;
}

    div.gsc-resultsRoot {background-color:white; font-size: 12px; padding:4px;}
    div.gsc-branding-text {display:none}

.gsc-resultsbox-visible {
display:block;
border-style:solid;
border-width:1px;
border-color: #636262;

}

.gsc-result .gs-title {
height:1.4em;
overflow:hidden;
color:#505050;
}


.gs-result a.gs-visibleUrl, .gs-result .gs-visibleUrl {
color:#7DB639;
text-decoration:none;
}

.gs-result a.gs-visibleUrl:hover, .gs-result .gs-visibleUrl:hover {
text-decoration:underline;
}

.gs-result .gs-snippet {
    color:#030303;
}

.gs-result .gs-title, .gs-result .gs-title * {
color:#505050;
text-decoration:underline;
}

.gsc-results .gsc-trailing-more-results, .gsc-results .gsc-trailing-more-results * {
color:#505050;
text-decoration:underline;
}

.gsc-results .gsc-cursor-box .gsc-cursor-page {
color:#505050;
cursor:pointer;
display:inline;
margin-right:8px;
text-decoration:underline;
}
.gsc-results .gsc-cursor-box .gsc-cursor-current-page {
color:#7DB639;
font-weight:bold;
text-decoration:none;
}

.gsc-one-result-active .gsc-one-result {
    display:none;
background-image:url(http://www.google.com/uds/css/one-complex-light-blue.gif);
}
.gsc-more-results-active .gsc-more-results {
        display:none;
background-image:url(http://www.google.com/uds/css/more-complex-light-blue.gif);
}
.gsc-all-results-active .gsc-all-results {
        display:none;
background-image:url(http://www.google.com/uds/css/all-complex-light-blue.gif);
}

.gsc-one-result {
            display:none;
background-image:url(http://www.google.com/uds/css/one-complex-dark.gif);
}
.gsc-more-results {
            display:none;
background-image:url(http://www.google.com/uds/css/more-complex-dark.gif);
}
.gsc-all-results {
            display:none;
background-image:url(http://www.google.com/uds/css/all-complex-dark.gif);
padding-right:1px;
}

.gsc-resultsHeader td.gsc-twiddle-closed div.gsc-twiddle {
/*background-image:url(http://www.google.com/uds/css/arrow_close.gif);*/
}
.gsc-resultsHeader td.gsc-twiddle-opened div.gsc-twiddle {
/*background-image:url(http://www.google.com/uds/css/arrow_open.gif);*/
}

.gsc-resultsHeader .gsc-title {
color:#050505;
display:inline;
margin-right:10px;
padding-left:0px;
}

td.gsc-branding-img-noclear {
vertical-align:bottom;
width:51px;
text-align:right;
float:right;
}



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

    table.gsc-search-box {
    border-spacing:0;
    border-style:none;
    border-width:0;
    margin-bottom:2px;
    width:60px;
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
                    <td> <div style="position:absolute; z-index:9999; top:112; left:678" id="searchcontrol">&nbsp;</div></td>
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





