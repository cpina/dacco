<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="minFrequency"/>
<xsl:param name="speaker"/>
	<xsl:output method="html" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" indent="no" media-type="text/html"/>
	<!--XSL Stylesheet for generating Datasheet-->
	<xsl:template match="dictionary">
		<html>
			<head>
				<title>
					Catalan/English Dictionary
				</title>
				<LINK REL="stylesheet" TYPE="text/css" HREF="sample.css"/>
				<script src="dacco.js"></script>

			</head>
			<body>
<xsl:apply-templates/>
<br></br>
<a href="http://sourceforge.net/projects/dacco"><img border="0" src="http://sourceforge.net/sflogo.php?group_id=80666&amp;type=1" alt="SourceForge"/></a>
		</body>
		</html>
	</xsl:template>
	<xsl:template match="Entry">
	<xsl:if test="@frequency > $minFrequency">
	 <xsl:element name="a">
	 	<xsl:attribute name="name"><xsl:value-of select="text()"/></xsl:attribute>
	 </xsl:element>
		<span class="entry">
		 <xsl:choose>
		        <xsl:when test='@hasSound="true"'>
		        <xsl:element name="a">
		        <xsl:attribute name="href">http://www.ibiblio.org/dacco/Sounds/Catalan/<xsl:value-of select='translate(translate(text()," _-.!?()&apos;",""),"àáèéíòóúüçÀ·","aaeeioouucA")'/>.wav</xsl:attribute>
				<xsl:value-of select="text()"/>
			</xsl:element>
		         		        </xsl:when>
              <xsl:otherwise>
         <xsl:value-of select="text()"/>
                 </xsl:otherwise>
      </xsl:choose>

			<xsl:text> </xsl:text>
				<xsl:if test="@frequency>173000">
				<img src="images/star.gif" width="5" height="5" align="middle" alt="*"></img>
			</xsl:if>
			<xsl:if test="@frequency>100000">
				<img src="images/star.gif" width="5" height="5" align="middle" alt="*"></img>
			</xsl:if>
			<xsl:if test="@frequency>60000">
				<img src="images/star.gif" width="5" height="5" align="middle" alt="*"></img>
			</xsl:if>
			<xsl:if test="@frequency>21200">
				<img src="images/star.gif" width="5" height="5" align="middle" alt="*"></img>
			</xsl:if>
			<xsl:if test="@frequency>250">
				<img src="images/star.gif" width="5" height="5" align="middle" alt="*"></img>
			</xsl:if>
					<xsl:if test="engacro">
				(<xsl:value-of select="engacro"/>)
			</xsl:if>
		</span>
		<xsl:apply-templates select="nouns | verbs | adverbs | adjectives | conjunctions | prepositions | pronouns | abbreviations | exclamations | acronyms | expressions"/>
		<p/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catnote">
	</xsl:template>
	<xsl:template match="engnote">
	<div class="note">n.b: <xsl:value-of select="."/></div>
	</xsl:template>
	<xsl:template match="catexamp">
	<br/>
		<span class="examp"><xsl:value-of select="."/></span>
	</xsl:template>
	<xsl:template match="engexamp">
	<xsl:text> - </xsl:text>
		<span class="examp"><xsl:value-of select="."/></span>
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
				<xsl:attribute name="href"><xsl:text disable-output-escaping="yes">http://dacco.sourceforge.net/cgi-bin/conj.as.txt?verb=</xsl:text><xsl:value-of select="$lookup"/><xsl:text disable-output-escaping="yes">&amp;class=</xsl:text><xsl:value-of select="@conj"/></xsl:attribute>
				<xsl:attribute name="target">	verbix</xsl:attribute>
				<span class="conj">conj</span>
			</xsl:element>
			<xsl:apply-templates/>
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
			<xsl:apply-templates/>
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
			<span class="pos"> abbrev </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="exclamations">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> exclam </span>
			<xsl:apply-templates/>
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
		<xsl:for-each select="translation">
			<xsl:text>    </xsl:text>
			<xsl:if test="last()>1"><b>
				<xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text>
				</b>
			</xsl:if>
                        <xsl:if test="@sourceplural">
			<span class="sourceplural"><xsl:value-of select="@sourceplural"/></span>
		</xsl:if>
			<xsl:if test="@gender='m'">
				<span class="gender"> (m) </span>
			</xsl:if>
			<xsl:if test="@gender='f'">
				<span class="gender"> (f) </span>
			</xsl:if>
			<xsl:if test="@gender='m / f'">
				<span class="gender"> (m / f) </span>
			</xsl:if>
                        <xsl:if test="@gender='ffullform'">
				<span class="gender"> (f) </span>
			</xsl:if>
                        <xsl:if test="@gender='mfullform'">
				<span class="gender"> (m) </span>
			</xsl:if>
                        <xsl:if test="@gender='mpl'">
				<span class="gender"> (mpl) </span>
			</xsl:if>
                        <xsl:if test="@gender='fpl'">
				<span class="gender"> (fpl) </span>
			</xsl:if>

			<xsl:if test="@register='vulgar'">
				<span class="register"> (vulg) </span>
			</xsl:if>
			<xsl:if test="@register='slang'">
				<span class="register"> (slang) </span>
			</xsl:if>
			<xsl:if test="@register='colloquial'">
				<span class="register"> (colloq) </span>
			</xsl:if>
			<xsl:if test="@register='offensive'">
				<span class="register"> (offensive) </span>
			</xsl:if>
			<xsl:if test="@register='dialectal'">
				<span class="register"> (dialectal) </span>
			</xsl:if>
			<xsl:if test="@register='valencian'">
				<span class="register"> (Val.) </span>
			</xsl:if>
                    <xsl:if test="@register='humorous'">
				<span class="register"> (humor) </span>
			</xsl:if>
<xsl:if test="contains(@catagory,'Computers') or contains(@catagory,'computers') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainComputersPage.htm">[IT]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Language') or contains(@catagory,'language') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/LanguagesList.htm">[LANG]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Body') or contains(@catagory,'body') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainBodyPage.htm">[ANAT]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Sports') or contains(@catagory,'sports') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainSportsPage.htm">[SPORT]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Animal') or contains(@catagory,'animal') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainAnimalPage.htm">[ZOOL]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Transport') or contains(@catagory,'transport') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainTransportPage.htm">[TRANSP]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Medical') or contains(@catagory,'medical') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainMedicalPage.htm">[MED]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Financial') or contains(@catagory,'financial') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/FinancialList.htm">[FIN]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Religious') or contains(@catagory,'religious') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/ReligionList.htm">[RELIG]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Food') or contains(@catagory,'food') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainFoodPage.htm">[FOOD]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Clothes') or contains(@catagory,'clothes') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/fullClothesList.htm">[CLOTHES]</a><xsl:text> </xsl:text></span>
			</xsl:if>
<xsl:if test="contains(@catagory,'Work') or contains(@catagory,'work') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/MainWorkPage.htm">[WORK]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Country') or contains(@catagory,'country') or contains(@catagory,'city') or contains(@catagory,'City') or contains(@catagory,'river') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/ContinentsList.htm">[GEOG]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Politics') or contains(@catagory,'politics') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/PoliticsList.htm">[POLIT]</a><xsl:text> </xsl:text></span>
			</xsl:if>
			<xsl:if test="contains(@catagory,'Weather') or contains(@catagory,'weather') ">
				<span class="category"><a href="http://dacco.sourceforge.net/cateng4eng/wordnets/WeatherList.htm">[MET]</a><xsl:text> </xsl:text></span>
			</xsl:if>
                         <xsl:if test="@picture">
                    <xsl:element name="a">
                <xsl:attribute name="href">javascript:flickr("<xsl:value-of select="@picture"/>","<xsl:value-of select="../../../text()"/>","<xsl:value-of select="@flickr"/>");</xsl:attribute>
                <img src="http://www.catalandictionary.org/shared/images/photo.gif" alt="[Photo]" width="23" height="20" border="0"/>
                
                </xsl:element>
                </xsl:if>    
			<span class=" translation"><xsl:value-of select="text()"/></span>
			<xsl:if test="@catagory">
				<!-- <i>
					[<xsl:value-of select="@catagory"/>]
				</i> -->
			</xsl:if>
			<xsl:if test="@collocation">
			<xsl:text>  </xsl:text>
			<xsl:element name="a">
	<xsl:attribute name="href">
<xsl:text>http://dacco.sourceforge.net/cateng4eng/collocations/</xsl:text><xsl:value-of select='translate(../../../text(),"àáèéíòóúüçÀ·","aaeeioouucA")'/><xsl:text>.htm</xsl:text>
</xsl:attribute>
			<img src="images/collocation.gif" border="0" width="10" height="10" align="middle" alt="collocation"></img>
</xsl:element>
			</xsl:if>
			<xsl:if test="catacro">
				(<xsl:value-of select="catacro"/>)
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
<xsl:if test="count(plural) >0 or count(fems) >0 or count(femplural) >0">
<br/>
</xsl:if>
<xsl:if test="count(plural) > 0">
<xsl:comment> plural <xsl:value-of select="plural"/> </xsl:comment>
				<span class="plural"><i>pl. </i></span><i><b><xsl:value-of select="plural"/></b></i>
					<xsl:if test="count(fems) > 0">
<xsl:text> </xsl:text>
				<span class="fems"><i>/ </i></span>
						</xsl:if>
			</xsl:if>
			
	<xsl:if test="count(fems) > 0">
        <xsl:comment> fems <xsl:value-of select="fems"/> </xsl:comment>
				<span class="fems"><i>f.s. </i></span><i><b><xsl:value-of select="fems"/></b></i>
				<xsl:if test="count(femplural) > 0">
<xsl:text> </xsl:text>
				<span class="femplural"><i>/ </i></span>
						</xsl:if>

</xsl:if>

<xsl:if test="count(femplural) > 0">
<xsl:comment> femplural <xsl:value-of select="femplural"/> </xsl:comment>
				<span class="femplural"><i>f.pl. </i></span><i><b><xsl:value-of select="femplural"/></b></i>
</xsl:if>


			<xsl:apply-templates select="catexamp | engexamp"/><br/>
			<xsl:apply-templates select="catnote | engnote"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
