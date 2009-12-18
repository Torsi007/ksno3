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

function openModalVideo(url, flashDivs){
    fd = flashDivs;
    var id = '#dialog';

    //Get the screen height and width
    var maskHeight = Math.max(document.body.scrollHeight, document.body.clientHeight);
    var maskWidth = Math.max(document.body.scrollWidth, document.body.clientWidth);


    //Set height and width to mask to fill up the whole screen
    $('#mask').css({
        'width':maskWidth,
        'height':maskHeight,
        'left':'0',
        'top':'0'
    });
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

function openModalImage(image, flashDivs){
    fd = flashDivs;
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
    $('#mask').css({
        'width':maskWidth,
        'height':maskHeight,
        'left':'0',
        'top':'0'
    });
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

var fd;

function openModalImageOnUrl(url, height, width, flashDivs){
    //Get the A tag
    fd = flashDivs;
    fd.css("display","none");
    var url = url;
    var imgHeight = height;
    var imgWidth = width;
    var factor = 1;
    var val ="<img src='"+ url +"'/>";
    var id = '#dialog';
    $(id).html(val);

    //Get the screen height and width
    var maskHeight = Math.max(document.body.scrollHeight, document.body.clientHeight);
    var maskWidth = Math.max(document.body.scrollWidth, document.body.clientWidth);

    //Set height and width to mask to fill up the whole screen
    $('#mask').css({
        'width':maskWidth,
        'height':maskHeight,
        'left':'0',
        'top':'0'
    });
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
        if(fd != undefined){
            fd.css("display","block");
        }
        fd = null;
        
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

google.load("search", "1", {
    "nocss" : true
});

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
