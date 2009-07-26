$(document).ready(function(){
    switchStylestyle("home");
    $("#content").load("Home.jsp");
    $("td.main a").click(function(){
        setContent(this.getAttribute("href"), this.getAttribute("rel"));
        $(this).css("font-weight","bold");
        return false;
    });
});

function setContent(url,styleName){
    $("td.main a").css("font-weight","normal");
    $("td.main a[rel='" + styleName + "']").css("font-weight","bold");
    $("#content").load(url,"",function(){
        switchStylestyle(styleName);
    });
}

function switchStylestyle(styleName)
{
    //alert(styleName);
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
