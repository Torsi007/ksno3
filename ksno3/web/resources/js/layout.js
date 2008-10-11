
function slideProjector(obj,ownCall){
	this.slideShowSpeed = 5000;
	this.crossFadeDuration = 2000;
	this.pics = new Array();
	this.links = new Array();
	this.target = obj;
	this.currentPicture = 0;
	this.ownCall = ownCall;
}

slideProjector.prototype.setSpeed = function(speed){
	this.slideShowSpeed =  speed
}

slideProjector.prototype.setFade = function(duration){
	this.crossFadeDuration = duration;
}

slideProjector.prototype.loadPictures = function(){
	for(var i=0; i<arguments.length; i++){
	   this.pics[i] = arguments[i]
	}
}

slideProjector.prototype.loadLinks = function(){
	for(var i=0; i<arguments.length; i++){
	   this.links[i] = arguments[i]
	}
}

slideProjector.prototype.run = function(){
  this.target.style.filter="blendTrans(duration=this.crossFadeDuration)"
  this.target.filters.blendTrans.Apply()
	this.target.src = this.pics[this.currentPicture];
	link = this.links[this.currentPicture];
	if(link){
		this.target.onclick = function(){window.open(link)};
	}
	this.target.filters.blendTrans.Play()
   	this.currentPicture = (this.currentPicture + 1) % this.pics.length;
   	if (this.currentPicture < this.pics.length){
	   setTimeout(this.ownCall, this.slideShowSpeed)
	}
}

function expandCollapse(e){
	var currentRow = event.srcElement.parentElement.parentElement;
	var contentCell = currentRow.cells.length - 2
	if(currentRow.isCollapsed){
		currentRow.cells[contentCell].children[0].style.overflow = 'visible'
		event.srcElement.parentElement.children[0].style.display = 'none';
		event.srcElement.parentElement.children[1].style.display = 'none';
		event.srcElement.parentElement.children[2].style.display = 'none';
		event.srcElement.parentElement.children[3].style.display = 'inline';
		currentRow.isCollapsed = false;
	}
	else if(!currentRow.isCollapsed){
		currentRow.cells[contentCell].children[0].style.overflow = 'hidden'
		event.srcElement.parentElement.children[0].style.display = 'inline';
		event.srcElement.parentElement.children[1].style.display = 'inline';
		event.srcElement.parentElement.children[2].style.display = 'none';
		event.srcElement.parentElement.children[3].style.display = 'none';
		currentRow.isCollapsed = true;
	}
}

function updateLinksTable(){
	tblRows = document.getElementById("linksTable").rows
	for(i=0;i<tblRows.length;i++){
		if(tblRows[i].cells[1]){
			if(Boolean(tblRows[i].isCollapsed)){
				if((tblRows[i].cells[1].children[0].scrollHeight - 1) > tblRows[i].cells[1].children[0].clientHeight){
					tblRows[i].cells[2].children[0].style.display = 'inline';
					tblRows[i].cells[2].children[1].style.display = 'inline';
					tblRows[i].cells[2].children[2].style.display = 'none';
					tblRows[i].cells[2].children[3].style.display = 'none';
				}
				else{
					tblRows[i].cells[2].children[0].style.display = 'none';
					tblRows[i].cells[2].children[1].style.display = 'none';
					tblRows[i].cells[2].children[2].style.display = 'inline';
					tblRows[i].cells[2].children[3].style.display = 'none';
				}
			}
		}
	}
}