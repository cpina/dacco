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
		<xsl:apply-templates select="nouns | verbs | adverbs | adjectives | conjunctions | prepositions | pronouns | abbreviations | exclamations | acronyms"/>
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
	<xsl:template match="translations">
		<xsl:for-each select="translation">
			<xsl:text>    </xsl:text>
			<xsl:if test="last()>1"><b>
				<xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text>
				</b>
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
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
