<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="minFrequency"/>
<xsl:param name="speaker"/>

	<xsl:output method="html" version="1.0" encoding="ISO-8859-1" omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
	<!--XSL Stylesheet for generating Datasheet-->
	<xsl:template match="dictionary">
		<html>
			<head>
				<title>
					Catalan/English Dictionary
				</title>
				<LINK REL="stylesheet" TYPE="text/css" HREF="sample.css"/>
				<script type="text/javascript"><![CDATA[

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
var alltags=document.all? document.all : document.getElementsByTagName("*")
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
if (enablepersist=="on" && getselectedItem()!="")
revivecontent()
}


if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload

if (enablepersist=="on" && document.getElementById)
window.onunload=saveswitchstate
]]></script>
			</head>
			<body>
				<xsl:apply-templates/>
				<a href="http://sourceforge.net/projects/dacco">
					<img border="0" src="http://sourceforge.net/sflogo.php?group_id=80666&amp;type=1" alt="SourceForge"/>
				</a>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<a href="http://www.verbix.com/webverbix/index.asp">
					<img src="http://www.verbix.com/imag/button_webverbix.gif" width="88" height="31" alt="Conjugations by Verbix" border="0"/>
				</a>
				<hr>(c) 2003 - 2004 dacco project - under the LGPL license</hr>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Entry">
		<xsl:if test="@frequency > $minFrequency">
			<xsl:element name="a">
				<xsl:attribute name="name"><xsl:value-of select="text()"/></xsl:attribute>
			</xsl:element>
			<span class="entry">
				<xsl:element name="a">
					<xsl:attribute name="href">http://www.ibiblio.org/dacco/Sounds/English/<xsl:value-of select='translate(text()," _-.!?()&apos;","")'/>.wav</xsl:attribute>
					<xsl:value-of select="text()"/>
				</xsl:element>
				<xsl:text> </xsl:text>
				<xsl:if test="@frequency>164000000">
					<img src="images/star.gif" width="5" height="5" align="middle" alt="*"/>
				</xsl:if>
				<xsl:if test="@frequency>73400000">
					<img src="images/star.gif" width="5" height="5" align="middle" alt="*"/>
				</xsl:if>
				<xsl:if test="@frequency>36600000">
					<img src="images/star.gif" width="5" height="5" align="middle" alt="*"/>
				</xsl:if>
				<xsl:if test="@frequency>10200000">
					<img src="images/star.gif" width="5" height="5" align="middle" alt="*"/>
				</xsl:if>
				<xsl:if test="@frequency>14300">
					<img src="images/star.gif" width="5" height="5" align="middle" alt="*"/>
				</xsl:if>
				<!--		<xsl:value-of select="text()"/> -->
				<xsl:if test="engacro">
				(<xsl:value-of select="engacro"/>)
			</xsl:if>
			</span>
			<xsl:apply-templates select="nouns | verbs | adverbs | adjectives | conjunctions | prepositions | pronouns | abbreviations | exclamations | acronyms | expressions"/>
			<xsl:apply-templates select="phrasalverbs"/>
			<p/>
			<xsl:text disable-output-escaping="yes">
</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catnote">
         <xsl:if test="$speaker='cat'">
		<div class="note">nota: <xsl:value-of select="." disable-output-escaping="yes"/>
		</div>
         </xsl:if>
	</xsl:template>
	<xsl:template match="engnote">
          <xsl:if test="$speaker='eng'">
            <div class="note">nb: <xsl:value-of select="." disable-output-escaping="yes"/>
	    </div>
          </xsl:if>
	</xsl:template>
	<xsl:template match="catexamp">
		<xsl:text> - </xsl:text>
		<span class="examp">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<xsl:template match="engexamp">
		<br/>
		<span class="examp">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<xsl:template match="verbs">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> v </span>
			<xsl:element name="a">
				<xsl:variable name="lookup">
					<xsl:if test="contains(../text(),' ')">
						<xsl:value-of select="substring-before(../text(),' ')"/>
					</xsl:if>
					<xsl:if test="not(contains(../text(),' '))">
						<xsl:value-of select="../text()"/>
					</xsl:if>
				</xsl:variable>
				<xsl:attribute name="href"><xsl:text disable-output-escaping="yes">http://www.verbix.com/webverbix/go.asp?T1=</xsl:text><xsl:value-of select="$lookup"/><xsl:text disable-output-escaping="yes">&amp;D1=20&amp;H1=120</xsl:text></xsl:attribute>
				<xsl:attribute name="target">	verbix</xsl:attribute>
				<span class="conj">conj</span>
			</xsl:element>
			<xsl:if test="count(past) >0 or count(participle) >0 or count(gerund) >0"> (</xsl:if>
			<xsl:if test="count(past) > 0">
				<span class="past"/>
				<i>
					<xsl:value-of select="past"/>
				</i>
				<xsl:if test="count(participle) > 0">
					<xsl:text/>
					<span class="participle">
						<i>/</i>
					</span>
				</xsl:if>
			</xsl:if>
			<xsl:if test="count(participle) > 0">
				<span class="participle"/>
				<i>
					<xsl:value-of select="participle"/>
				</i>
				<xsl:if test="count(gerund) > 0">
					<xsl:text/>
					<span class="gerund">
						<i>/</i>
					</span>
				</xsl:if>
			</xsl:if>
			<xsl:if test="count(gerund) > 0">
				<span class="gerund"/>
				<i>
					<xsl:value-of select="gerund"/>
				</i>
			</xsl:if>
			<xsl:if test="count(past) >0 or count(participle) >0 or count(gerund) >0">)
</xsl:if>
			<xsl:apply-templates select="translations"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="adverbs">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> adv </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="nouns">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> n </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="adjectives">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> adj </span>
			<xsl:if test="text()">
				<span class="phr">
					<xsl:value-of select="text()"/>
				</span>
				<br/>
			</xsl:if>
			<xsl:apply-templates select="translations"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="conjunctions">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> conj </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="acronyms">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> acr </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="prepositions">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> prep </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="pronouns">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> pron </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="abbreviations">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> abrev </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="exclamations">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> interj </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="phrasalverbs">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="phr">
				<img src="images/arrow.gif" alt=">"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="text()"/>
			</span>
			<br/>
			<span class="pos"> v.c. </span>
			<xsl:apply-templates select="translations"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="expressions">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> expr </span>
			<span class="phr">
				<xsl:value-of select="text()"/>
			</span>
			<br/>
			<xsl:apply-templates select="translations"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="translations">
		<xsl:apply-templates select="translation"/>
	</xsl:template>
	<xsl:template match="participle"/>
	<xsl:template match="past"/>
	
        <xsl:template match="translation" name="translation">
		<xsl:param name="hideCount"/>
		<xsl:text>    </xsl:text>
		<xsl:if test="last()>1 and $hideCount!='true'">
			<xsl:if test="position()=1"/>
			<b>
				<xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text>
			</b>
		</xsl:if>
                <xsl:if test="@beforenoun='true'">
			<span class="beforenoun"><xsl:text>(before noun) </xsl:text></span>
		</xsl:if>  
                <xsl:if test="@sourceplural">
			<span class="sourceplural"><xsl:value-of select="@sourceplural"/></span>
		</xsl:if>
                <xsl:if test="@capitalized">
			<span class="capitalized"><xsl:value-of select="@capitalized"/></span>
		</xsl:if>
		<xsl:if test="@local='us'">
			<span class="local"> (Am) </span>
		</xsl:if>
		<xsl:if test="@local='gb'">
			<span class="local"> (Br) </span>
		</xsl:if>
		<xsl:if test="@local='au'">
			<span class="local"> (Aus) </span>
		</xsl:if>
		<xsl:if test="@register='vulgar'">
			<span class="register"> (vulg) </span>
		</xsl:if>
		<xsl:if test="@register='slang'">
			<span class="register"> (argot) </span>
		</xsl:if>
		<xsl:if test="@register='colloquial'">
			<span class="register"> (col.loq) </span>
		</xsl:if>
		<xsl:if test="@register='offensive'">
			<span class="register"> (ofensiu) </span>
		</xsl:if>
		<xsl:if test="@register='dialectal'">
			<span class="register"> (dialecte) </span>
		</xsl:if>
		<xsl:if test="@register='dialectal-Cockney'">
			<span class="register"> (dialecte) </span>
		</xsl:if>
		<xsl:if test="@register='dialectal-cockney'">
			<span class="register"> (dialecte) </span>
		</xsl:if>
		<xsl:if test="@register='humorous'">
			<span class="register"> (hum.) </span>
		</xsl:if>
		<xsl:if test="@register='formal'">
			<span class="register"> (formal) </span>
		</xsl:if>
		<xsl:if test="@register='derogatory'">
			<span class="register"> (despect.) </span>
		</xsl:if>
		<xsl:if test="@register='dated'">
			<span class="register"> (passat de moda) </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Computers') or contains(@catagory,'computers') ">
			<span class="category">[INFORM] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Language') or contains(@catagory,'language') ">
			<span class="category">[LING] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Body') or contains(@catagory,'body') ">
			<span class="category">[ANAT] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Sports') or contains(@catagory,'sports') ">
			<span class="category">[ESPORT] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Animal') or contains(@catagory,'animal') ">
			<span class="category">[ZOOL] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Transport') or contains(@catagory,'transport') ">
			<span class="category">[TRANSP] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Medical') or contains(@catagory,'medical') ">
			<span class="category">[MED] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Financial') or contains(@catagory,'financial') ">
			<span class="category">[FIN] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Religious') or contains(@catagory,'religious') ">
			<span class="category">[RELIG] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Food') or contains(@catagory,'food') ">
			<span class="category">[ALIM] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Clothes') or contains(@catagory,'clothes') ">
			<span class="category">[ROBA] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Work') or contains(@catagory,'work') ">
			<span class="category">[TREB] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Country') or contains(@catagory,'country') or contains(@catagory,'city') or contains(@catagory,'City') or contains(@catagory,'river') ">
			<span class="category">[GEOG] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Politics') or contains(@catagory,'politics') ">
			<span class="category">[POLIT] </span>
		</xsl:if>
		<xsl:if test="contains(@catagory,'Weather') or contains(@catagory,'weather') ">
			<span class="category">[METEOR] </span>
		</xsl:if>
                <xsl:if test="contains(@catagory,'insect') or contains(@catagory,'insect') ">
			<span class="category">[INSECTE] </span>
		</xsl:if>
                    <xsl:if test="contains(@catagory,'agriculture') or contains(@catagory,'agriculture') ">
			<span class="category">[AGRIC] </span>
		</xsl:if>
                 <xsl:if test="contains(@catagory,'music') or contains(@catagory,'music') ">
			<span class="category">[MÚSICA] </span>
		</xsl:if>
		<xsl:for-each select="translation">
			<xsl:call-template name="translation">
				<xsl:with-param name="hideCount" select="'true'"/>
			</xsl:call-template>
		</xsl:for-each>
		<span class="translation">
			<xsl:value-of select="text()"/>
		</span>
		<xsl:if test="catacro">
				(<xsl:value-of select="catacro"/>)
			</xsl:if>
		<xsl:if test="@termcat='true'">
			<img src="images/tcat.gif" alt="[Termcat]" width="10" height="10"/>
		</xsl:if>
		<xsl:if test="@approval='true'">
			<xsl:element name="a">
				<xsl:attribute name="href"><xsl:text>http://dacco.sourceforge.net/forums/viewtopic.php?t=</xsl:text><xsl:value-of select="@topic"/></xsl:attribute>
				<!-- <a href="http://dacco.sourceforge.net/forums/viewforum.php?f=2"> -->
				<img src="images/approval.gif" alt="[approval]" width="10" height="10" border="0"/>
			</xsl:element>
			<!-- </a> -->
		</xsl:if>
		<xsl:if test="example">
			<xsl:variable name="id" select="generate-id()"/>
			<span class="etoggle" style="cursor:hand; cursor:pointer">
				<xsl:attribute name="onClick">expandcontent('<xsl:value-of select="$id"/>')</xsl:attribute> +</span>
			<div class="switchcontent">
				<xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
				<xsl:for-each select="example">
					<xsl:value-of select="." disable-output-escaping="yes"/>
					<br/>
				</xsl:for-each>
				<br/>
			</div>
		</xsl:if>
		<xsl:if test="count(plural) > 0">
			<br/>
			<span class="plural">
				<i>pl. </i>
			</span>
			<i>
				<b>
					<xsl:value-of select="plural"/>
				</b>
			</i>
		</xsl:if>
		<xsl:if test="@local='gb'">
			<xsl:if test="count(otherlocal) > 0">
				<br/>
				<span class="local">Am. = <xsl:value-of select="otherlocal"/>
				</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="@local='us'">
			<xsl:if test="count(otherlocal) > 0">
				<br/>
				<span class="local">Br. = <xsl:value-of select="otherlocal"/>
				</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="catexamp | engexamp"/>
		<xsl:apply-templates select="catnote | engnote"/>
		<xsl:if test="count(synonyms) > 0">
			<br/>
			<span class="synonyms">
				<i>sin. </i>
			</span>
			<i>
				<b>
					<xsl:value-of select="synonyms"/>
				</b>
			</i>
		</xsl:if>
		<xsl:if test="position()!=last()  and $hideCount!='true'">
			<br/>
		</xsl:if>
		<xsl:if test="position()!=last()  and $hideCount='true'">
			<xsl:text> / </xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
