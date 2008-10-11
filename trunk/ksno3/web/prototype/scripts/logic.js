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
	var temp = url.substring(0,url.length - 4)
	l = '../imageBorder.jsp?imageBorder=' + temp;
	window.parent.document.getElementById("imageCollection").src = l;
}

function changeMainMenu(id, url) {
	var oldId = document.getElementById("menuId").value;

	var temp = url.substring(3,url.length);
	var imageBorder = temp.substring(0,temp.length - 4);
	document.getElementById("imageBorder").value = imageBorder;
	//removes active-class on sub-menu, if it exists
	if ( document.getElementById("subMenu"+oldId.substr(0,1)) != null ) {
		document.getElementById("subMenu"+oldId.substr(0,1)).className = "passive";
	}

	//setting sub-menu active-class, if it exists
	if ( document.getElementById("subMenu"+id) != null ) {
		document.getElementById("subMenu"+id).className = "active";
	} else { //no sub-menu, change content
		setContent(url);
		document.getElementById("contentPage").value = temp;
	}
	document.getElementById("menuId").value = id;
	document.all.actionForm.menuId.value = id;
	setAnchors(id);

	if(id=='5'){
        	document.getElementById("contentHeading").innerHTML = "<div class='links'><h1>Linker</h1><p>Nedenfor f�lger et utvalg kite linker.</p><p>Send oss en mail om du har en link du mener b�r legges til</p><a href='mailto:info@kitesurfing.no' style='color:orange; font-size:10'>info@kitesurfing.no</a><hr/></div>";
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

