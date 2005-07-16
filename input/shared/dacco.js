/***********************************************
* Switch Content script- (c) Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for use
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

var enablepersist="on" //Enable saving state of content structure? (on/off)

if (document.getElementById){
document.write('<style type="text/css">')
document.write('.switchcontent{display:none;}')
document.write('</style>')
}

function getElementbyClass(classname){
ccollect=new Array()
var inc=0
var alltags = document.getElementsByTagName("span")
for (i=0; i<alltags.length; i++){
if (alltags[i].className==classname)
ccollect[inc++]=alltags[i]
}
}

function contractcontent(omit){
var inc=0
while (ccollect[inc]){
if (ccollect[inc].id!=omit)
ccollect[inc].style.display="none"
inc++
}
}

function expandcontent(cid){
if (typeof ccollect!="undefined"){
contractcontent(cid)
document.getElementById(cid).style.display=(document.getElementById(cid).style.display!="block")? "block" : "none"
selectedItem=cid+"|"+document.getElementById(cid).style.display
}
}

function revivecontent(){
selectedItem=getselectedItem()
selectedComponents=selectedItem.split("|")
contractcontent(selectedComponents[0])
document.getElementById(selectedComponents[0]).style.display=selectedComponents[1]
}

function get_cookie(Name) { 
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { 
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function getselectedItem(){
if (get_cookie(window.location.pathname) != ""){
selectedItem=get_cookie(window.location.pathname)
return selectedItem
}
else
return ""
}

function saveswitchstate(){
if (typeof selectedItem!="undefined")
document.cookie=window.location.pathname+"="+selectedItem
}

function do_onload(){
getElementbyClass("switchcontent")
//if (enablepersist=="on" && getselectedItem()!="")
//revivecontent()
}

function flickr(photo,srcWord,flickrPage){
        var width = 600;
        var height = 500;
	if(window.innerWidth){
	LeftPosition =(window.innerWidth-width)/2;
	TopPosition =((window.innerHeight-height)/4)-50;
			}
	else{
	LeftPosition =(parseInt(window.screen.width)-	width)/2;
	TopPosition=((parseInt(window.screen.height)-height)/2)-50;
			}
	attr = 'resizable=no,scrollbars=yes,width=' + width + ',height=' +
	height + ',screenX=300,screenY=200,left=' + LeftPosition + ',top=' +
	TopPosition + '';
	Date d = new Date();
	popWin=open('', 'photo'+(d.getTime()), attr);
        popWin.document.open("text/html","replace");
	popWin.document.write('<head><title>'+srcWord+'</title></head>');
	popWin.document.write('<body><div align=center>');
	popWin.document.write('<b>'+srcWord+'</b><br><br>');
  	popWin.document.write('<img src="'+photo+'"></br>');
	popWin.document.write('<a href='+flickrPage+'>Photo from Flickr!</a>');
  	popWin.document.write('</div></body></html>');
	}



if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload

if (enablepersist=="on" && document.getElementById)
window.onunload=saveswitchstate