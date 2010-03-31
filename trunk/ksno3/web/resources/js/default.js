//default.js

var framHeightCheckCount = 0;

$(document).ready(function(){
    setMainMenuItems();
    if(frameElement == undefined || frameElement.id != "content"){
        $("body").css("background-position","0px 158px");
        $(".topMenu").css("display","block");
    }else{
        $(".topMenu").css("display","none");
    }
    setFrameHeight();
    // check for what is/isn't already checked and match it on the fake ones
    $("input:checkbox").each( function() {
            (this.checked) ? $("#fake"+this.id).addClass('fakechecked') : $("#fake"+this.id).removeClass('fakechecked');
    });
    // function to 'check' the fake ones and their matching checkboxes
    $(".fakecheck").click(function(){
            ($(this).hasClass('fakechecked')) ? $(this).removeClass('fakechecked') : $(this).addClass('fakechecked');
            $(this.hash).trigger("click");
            return false;
    });    

});


function setFrameHeight(){
    try{
        if(framHeightCheckCount == 0){
            this.frameElement.style.height = 100;
        }
        framHeightCheckCount++;
        if(parseInt(this.frameElement.style.height) < parseInt(document.body.scrollHeight)){
            this.frameElement.style.height = document.body.scrollHeight;
        }
        if(framHeightCheckCount < 8){
            setTimeout("setFrameHeight()",250);
        }
    }catch(err){}
}

function setMainMenuItems(){
    if(this.frameElement != undefined && this.frameElement.id == "content"){
        var domElemMainMenu = this.frameElement.ownerDocument.getElementById("mainMenu");
        var domElemAnchors = (domElemMainMenu.querySelectorAll != undefined)?domElemMainMenu.querySelectorAll("a"):domElemMainMenu.getElementsByTagName("a");
        for(var i = 0; i< domElemAnchors.length; i++){
            var domElemAnchor = domElemAnchors[i];
            if(document.URL.toLowerCase().search(domElemAnchor.href.toLowerCase()) > -1){
                domElemAnchor.style.fontWeight = "bolder";
            }else if(document.URL.toLowerCase().search("article.jsp") > -1 && domElemAnchor.href.toLowerCase().search("articles.jsp") > -1){
                domElemAnchor.style.fontWeight = "bolder";
            }else if(document.URL.toLowerCase().search("articles.jsp") > -1 && domElemAnchor.href.toLowerCase().search("articles.jsp") > -1){
                domElemAnchor.style.fontWeight = "bolder";
            }else if(document.URL.toLowerCase().search("signupsummer.jsp") > -1 && domElemAnchor.href.toLowerCase().search("coursejaren.jsp") > -1){
                domElemAnchor.style.fontWeight = "bolder";
            }else if(document.URL.toLowerCase().search("coursehaukeliseter.jsp") > -1 && domElemAnchor.href.toLowerCase().search("courseshaukeliseter.jsp") > -1){
                domElemAnchor.style.fontWeight = "bolder";
            }else{
                domElemAnchor.style.fontWeight = "normal";
            }

        }
    }else{
//Seems like we have opened outside the iframe
    }
}