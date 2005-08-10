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
				<LINK REL="stylesheet" TYPE="text/css" HREF="sample.css"></LINK>
			</head>
			<body>
<xsl:apply-templates/>
<br/>
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
			<xsl:value-of select="text()"/>
			<xsl:if test="engacro">
				(<xsl:value-of select="engacro"/>)
			</xsl:if>
		</span>
		<xsl:apply-templates select="nouns | verbs | adverbs | adjectives | conjunctions | prepositions | pronouns | abbreviations | exclamations | acronyms | expressions"/>
		<p/>
			</xsl:if>
	</xsl:template>
	<xsl:template match="catnote">
		<div class="note">nota: <xsl:value-of select="."/></div>
	</xsl:template>
	<xsl:template match="engnote">
		<!-- 
		<br/>
		<table bgcolor="#dddddd">
			<tbody>
				<tr>
					<td><i>nota: <xsl:value-of select="."/></i></td>
				</tr>
			</tbody>
		</table>		
		-->
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
        
	
		<xsl:for-each select="translation[not(@reflexive)]">
			<xsl:text>    </xsl:text>
			<xsl:if test="last()>1"><b>
				<xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text>
				</b>
			</xsl:if>
                        <xsl:call-template name="doTranslation"/>
                </xsl:for-each>
               <xsl:if test="count(translation[@reflexive])>0">
                    <span class="reflexive"><xsl:value-of select="translation[@reflexive]/@reflexive"/><br/></span>
                </xsl:if>
                <xsl:for-each select="translation[@reflexive]">
			<xsl:text>    </xsl:text>
			<xsl:if test="last()>1"><b>
				<xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text>
				</b>
			</xsl:if> 
                        <xsl:call-template name="doTranslation"/>
                </xsl:for-each>
                
                </xsl:template>
              
            <xsl:template name="doTranslation">
			<xsl:text>    </xsl:text>
			<xsl:if test="last()>1"><b>
				<xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text>
				</b>
			</xsl:if>
                        <xsl:if test="@sourceplural">
			<span class="sourceplural"><xsl:value-of select="@sourceplural"/></span>
		</xsl:if>
                 <xsl:if test="@feminine">
			<span class="feminine"><xsl:value-of select="@feminine"/></span>
		</xsl:if>
                 <xsl:if test="@reflexive">
			<span class="reflexive"><xsl:value-of select="@reflexive"/></span>
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
                       <xsl:if test="@gender='mfullform'">
				<span class="gender"> (m) </span>
			</xsl:if>
                        <xsl:if test="@gender='ffullform'">
				<span class="gender"> (f) </span>
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
			<xsl:if test="@register='valencian'">
				<span class="register"> (Val.) </span>
			</xsl:if>
                    <xsl:if test="@register='humorous'">
				<span class="register"> (hum.) </span>
			</xsl:if>
<xsl:if test="contains(@disambiguate,'Computers') or contains(@disambiguate,'computers') ">
				<span class="category">[INFORM] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Language') or contains(@disambiguate,'language') ">
				<span class="category">[LING] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Body') or contains(@disambiguate,'body') ">
				<span class="category">[ANAT] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Sports') or contains(@disambiguate,'sports') ">
				<span class="category">[ESPORT] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Animal') or contains(@disambiguate,'animal') ">
				<span class="category">[ZOOL] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Transport') or contains(@disambiguate,'transport') ">
				<span class="category">[TRANSP] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Medical') or contains(@disambiguate,'medical') ">
				<span class="category">[MED] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Financial') or contains(@disambiguate,'financial') ">
				<span class="category">[FIN] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Religious') or contains(@disambiguate,'religious') ">
				<span class="category">[RELIG] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Food') or contains(@disambiguate,'food') ">
				<span class="category">[ALIM] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Clothes') or contains(@disambiguate,'clothes') ">
				<span class="category">[ROBA] </span>
			</xsl:if>
<xsl:if test="contains(@disambiguate,'Work') or contains(@disambiguate,'work') ">
				<span class="category">[TREB] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Country') or contains(@disambiguate,'country') or contains(@disambiguate,'city') or contains(@disambiguate,'City') or contains(@disambiguate,'river') or contains(@disambiguate,'region')">
				<span class="category">[GEOG] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Politics') or contains(@disambiguate,'politics') ">
				<span class="category">[POLIT] </span>
			</xsl:if>
			<xsl:if test="contains(@disambiguate,'Weather') or contains(@disambiguate,'weather') ">
				<span class="category">[METEOR] </span>
			</xsl:if>
                            <xsl:if test="contains(@disambiguate,'Insect') or contains(@disambiguate,'insect') ">
			<span class="category">[INSECTE] </span>
		</xsl:if>
                    <xsl:if test="contains(@disambiguate,'Agriculture') or contains(@disambiguate,'agriculture') ">
			<span class="category">[AGRIC] </span>
		</xsl:if>
                 <xsl:if test="contains(@disambiguate,'Music') or contains(@disambiguate,'music') ">
			<span class="category">[MÚSICA] </span>
		</xsl:if>
                  <xsl:if test="contains(@disambiguate,'Maths') or contains(@disambiguate,'maths') ">
			<span class="category">[MAT] </span>
		</xsl:if>
<xsl:if test="contains(@disambiguate,'Plant') or contains(@disambiguate,'plant') ">
				<span class="category">[BOT] </span>
			</xsl:if>
			<span class="translation"><xsl:value-of select="text()"/></span>
			<xsl:if test="@catagory">
				<!-- <i>
					[<xsl:value-of select="@catagory"/>]
				</i> -->
			</xsl:if>
			<xsl:if test="catacro">
				(<xsl:value-of select="catacro"/>)
			</xsl:if>



			<xsl:apply-templates select="catexamp | engexamp"/><br/>
			<xsl:apply-templates select="catnote | engnote"/>
	</xsl:template>
</xsl:stylesheet>
