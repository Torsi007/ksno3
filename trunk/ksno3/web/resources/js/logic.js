function setBackgroundColor(color){
	rowElement = findElement(event.srcElement,'tr')
	rowElement.style.background = color;
}

function findElement(elem,tag){
	if(elem.tagName.toLowerCase() == tag){
		return elem
	}
	else{
		return		findElement(elem.parentElement,'tr');
	}
}

function openWindow(width,height,url,resize, scroll){
	var rs = 'no'
	var scroll = 'no'
	if(resize){
		rs = 'yes';
	}
	if(scroll){
		scroll = 'yes';
	}
	var arguments = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=" + scroll + ",resizable=" + rs + ",copyhistory=yes,width="+width+",height=" + height;
	window.open(url,"my_new_window",arguments)
}


function setLanguage(language) {
	document.all.actionForm.language.value = language;
	document.all.actionForm.submit();
}

function setContent(url) {
	document.getElementById("contentFrame").src = url;
}

function setThisContent(url) {
	location = url;
}

function changeMainMenu(id) {

	document.getElementById("menuId").value = id;
	setAnchors(id);

	if(id=='5'){
          document.getElementById("contentHeading").innerHTML = "<div class='links'><h1>Links</h1><p>Beneath you will find a selection of kite links.</p><p>If you want to add one of your own, please send us a mail</p><a href='mailto:info@kitesurfing.no' style='color:orange; font-size:10'>info@kitesurfing.no</a><hr/></div>";
	}
}

function setAnchors(id) {
	if (id.length == 1){ //temporary fix. does not support more than one level in menu
		if(document.getElementById("anchors"+id) != null) {
			document.getElementById("contentHeading").innerHTML = document.getElementById("anchors"+id).value;
		} else {
			document.getElementById("contentHeading").innerHTML = "&nbsp;";
		}
	}
}

function goTo(id, page) {//TO DO remove this
	document.all.actionForm.menuId.value = id;
	document.all.actionForm.contentPage.value = page;
	document.all.actionForm.submit();
}

function parentGoTo(id, page) {//TO DO remove this
	parent.document.all.actionForm.menuId.value = id;
	parent.document.all.actionForm.contentPage.value = page;
	parent.document.all.actionForm.submit();
}

function goAnchor(url) {
	temp = url + "?language=EN"
	document.getElementById("contentFrame").src = url;
}

function ksnoImgageBorder(img,anc){
  	this.height = document.body.clientHeight;
  	this.images = img;
  	this.captions= new Array();
  	for(i=0; i<anc.length;i++){
  		this.captions[i] = new caption(anc[i]);
  	}
	this.textHeight=19;
	this.imgBorderAndMargin=12;
	this.update();
}

function caption(anchor){
  	this.anchor = anchor;
  	this.haveText = false;
  	if(this.anchor.innerText.length > 1){
  		this.haveText = true;
  	}
}

ksnoImgageBorder.prototype.update = function(){
	this.height = document.body.clientHeight;
	var tempH=0;
	for(i=0;i<this.images.length;i++){
		tempH += parseInt(this.images[i].clientHeight) + this.imgBorderAndMargin;
		if(this.captions[i].haveText){
			tempH += this.textHeight;
		}
		if(tempH<this.height){
			this.images[i].style.display = 'block'
			this.captions[i].anchor.style.display = 'block'
		}
		else{
			this.images[i].style.display = 'none'
			this.captions[i].anchor.style.display = 'none'
		}
	}
}

function validate(){
    var formElement = event.srcElement;
    var missingRequired = validateRequiredElements(formElement, "input");
    /*if(!missingRequired){
      missingRequired = validateRequiredElements(formElement, "textarea");    
    }else{
        validateRequiredElements(formElement, "textarea");    
    }*/
    if(missingRequired){
        alert("Elementene merket gult er obligatoriske.");    
    }
    return !missingRequired;
}

function validateRequiredElements(form, tagName){
    var missingRequired = false;
    var formElements = form.getElementsByTagName(tagName);
    for(var i = 0; i<formElements.length; i++){
        var formElement = formElements[i];
        if(formElement.type != "hidden" && formElement.type != "submit"){          
          if((formElement.required ||formElement.parentElement.required) && (formElement.value == undefined || formElement.value == "")){
              formElement.style.background = "yellow";                    
              missingRequired = true;
          }else{
              formElement.style.background = "transparent";                    
          }            
        }
    }  
    return missingRequired;
}

function getBaseId(srcElem){

      alert(event.srcElement.id);
      debugger;
     /*id = src.id;
     lastColon = id.lastIndexOf(':');
     if (lastColon == -1) {
       basePath = "";
     } else {
          basePath = id.substring(0, lastColon + 1);*/

      return false;
               
                
    
    
}



