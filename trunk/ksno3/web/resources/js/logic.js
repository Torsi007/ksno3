var backgroundColor = 'transparent';

function setBackgroundColor(color){
    backgroundColor = color;
}

function setBackground(event){
    var srcEl = event.srcElement? event.srcElement : event.target;
	rowElement = findElement(srcEl,'tr')
	rowElement.style.background = backgroundColor;
}

function findElement(elem,tag){
	if(elem.tagName.toLowerCase() == tag){
		return elem
	}
	else{
        var parent = elem.parentElement;
        if(parent == undefined){
            parent = elem.parentNode;
        }
		return		findElement(parent,'tr');
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
    var validated = validateRequiredElements(formElement, "input");
    if(validated){
      validated = validateRequiredElements(formElement, "select");
    }else{
        validateRequiredElements(formElement, "select");
    }
    if(!validated){
        alert("De merkede elementene er obligatoriske.");
        return  validated;
    }

    validated = validateFormatFields(formElement);



    return validated;
}

function validateFormatFields(form){
    var hasCorrectFormat = true;
    var formElements = form.getElementsByTagName("input");
    for(var i = 0; i<formElements.length; i++){
        var formElement = formElements[i];

        if(formElement.type != "hidden" && formElement.type != "submit"){
          if(hasFormat(formElement, "email")){
              if(!validateEmail(formElement)){
                  return false;

              }
          }
          if(hasFormat(formElement, "phone")){
              if(!validatePhone(formElement)){
                  return false;

              }
          }
        }
    }
    return hasCorrectFormat;
}

function validatePhone(elem){
    var str = elem.value;
    if(str != undefined && str != ""){

        if(!checkInternationalPhone(str)){
          elem.style.background = "orange";
           elem.focus();
           alert("Ugyldig telefonnummer. Det må være på format ########. Mellomrom er tillat, og man kan også ha retningsnummer på format +##");
           return false;
        }


    }
              elem.style.background = "white";
              return true;

}

function isRequired(field){

    return field.required ||field.parentElement.required;
}

function validateRequiredElements(form, tagName){
    var allRequired = true;
    var formElements = form.getElementsByTagName(tagName);
    for(var i = 0; i<formElements.length; i++){
        var formElement = formElements[i];
        if(tagName.toLowerCase() == "select"){
            if(isRequired(formElement) && (formElement.value == undefined || formElement.value == "" || formElement.value == "empty" || formElement.value == "Empty")){
                formElement.style.background = "orange";
                allRequired = false;
            }else{
               formElement.style.background = "white";
            }
        }else{
          if(formElement.type != "hidden" && formElement.type != "submit"){
            if(isRequired(formElement) && (formElement.value == undefined || formElement.value == "")){
                formElement.style.background = "orange";
                allRequired = false;
            }else{
                formElement.style.background = "white";
            }
          }
        }

    }
    return allRequired;
}

function hasFormat(field, format){
    var fieldFormat = (field.format != undefined)?field.format:field.parentElement.format;
    var returnVal =false;
    if(fieldFormat != undefined){
        fieldFormat = fieldFormat.toLowerCase();
        returnVal = fieldFormat.indexOf(format.toLowerCase()) > -1

    }
    return returnVal;
}

// Declaring required variables
var digits = "0123456789";
// non-digit characters which are allowed in phone numbers
var phoneNumberDelimiters = " ";
// characters which are allowed in international phone numbers
// (a leading + is OK)
var validWorldPhoneChars = phoneNumberDelimiters + "+";
// Minimum no of digits in an international phone no.
var minDigitsInIPhoneNumber = 8;

function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
function trim(s)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not a whitespace, append to returnString.
    for (i = 0; i < s.length; i++)
    {
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (c != " ") returnString += c;
    }
    return returnString;
}
function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkInternationalPhone(strPhone){
strPhone=trim(strPhone)
if(strPhone.indexOf("+")>1) return false
s=stripCharsInBag(strPhone,validWorldPhoneChars);
return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}






function validateEmail(elem) {
    var str = elem.value;
    if(str != undefined && str != ""){
        var at="@"
        var dot="."
        var lat=str.indexOf(at)
        var lstr=str.length
        var ldot=str.indexOf(dot)
        if (str.indexOf(at)==-1){
           alert("Invalid E-mail, it must contain the @ character");
           elem.style.background = "orange";
           elem.focus();
           return false
        }

        if (str.indexOf(at)==0 || str.indexOf(at)==lstr){
           alert("Invalid E-mail");
                      elem.style.background = "orange";
           elem.focus();
           return false
        }

        if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
            alert("Invalid E-mail");
                       elem.style.background = "orange";
           elem.focus();
            return false
        }

         if (str.indexOf(at,(lat+1))!=-1){
            alert("Invalid E-mail");
                       elem.style.background = "orange";
           elem.focus();
            return false
         }

         if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
            alert("Invalid E-mail");
                       elem.style.background = "orange";
           elem.focus();
            return false
         }

         if (str.indexOf(dot,(lat+2))==-1){
            alert("Invalid E-mail");
                       elem.style.background = "orange";
           elem.focus();
            return false
         }

         if (str.indexOf(" ")!=-1){
            alert("Invalid E-mail");
                       elem.style.background = "orange";
           elem.focus();
            return false
         }


    }
           elem.style.background = "white";

         return true
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



