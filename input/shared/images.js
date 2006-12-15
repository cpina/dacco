
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
	var d = new Date();
	popWin=open('', 'photo'+(d.getTime()), attr);
        popWin.document.open("text/html","replace");
	popWin.document.write('<head><title>'+srcWord+'</title></head>');
	popWin.document.write('<body><div align=center>');
	popWin.document.write('<b>'+srcWord+'</b><br><br>');
  	popWin.document.write('<img src="'+photo+'"></br>');
	popWin.document.write('<a href='+flickrPage+'>Photo from Flickr!</a>');
  	popWin.document.write('</div></body></html>');
	}
