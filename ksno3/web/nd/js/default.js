$(document).ready(function(){
    setFrameHeight();
    setMainMenuItems();
});


function setFrameHeight(){
    this.frameElement.style.height = 1;
    this.frameElement.style.height = document.body.scrollHeight;
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
            }else{
                domElemAnchor.style.fontWeight = "normal";
            }

        }
    }else{
//Seems like we have opened outside the iframe
    }
}
