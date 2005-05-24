<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 rel. 4 U (http://www.xmlspy.com) by Robert Hibbert (Penn State Univ) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="minFrequency"/>
<xsl:param name="speaker"/>
<xsl:include href="eng.xsl"/>
	<xsl:output method="html" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
	<!--XSL Stylesheet for generating Datasheet-->
	<xsl:template match="dictionary">
		<html>
			<head>
				<title>
					Catalan/English Dictionary
				</title>
				<LINK REL="stylesheet" TYPE="text/css" HREF="sample.css"/>
			</head>
			<body>
				<xsl:apply-templates/>
				<p/>
				<a href="http://sourceforge.net/projects/dacco">
					<img border="0" src="http://sourceforge.net/sflogo.php?group_id=80666&amp;type=1" alt="SourceForge"/>
				</a>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Entry">
		<xsl:if test="@frequency > $minFrequency">
			<xsl:if test="not (*/translations/translation/@register='dialectal-Cockney') and not  (*/translations/translation/@register='dialectal-cockney') ">
				<xsl:if test="count(*/translations/translation[@noteng='TRUE'])=0 or count(*/translations/translation[@noteng='TRUE'])!=count(*/translations/translation)">
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
					<xsl:apply-templates select="phrasalverbs"/>
					<p/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="engnote">
		<div class="note">n.b. <xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="catnote">
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
	<xsl:template match="engexamp">
		<br/>
		<span class="examp">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<xsl:template match="catexamp">
		<xsl:text> - </xsl:text>
		<span class="examp">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<xsl:template match="verbs">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> v </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="adverbs">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> adv </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="nouns">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> n </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="adjectives">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
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
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> conj </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="acronyms">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> acr </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="prepositions">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> prep </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="pronouns">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> pron </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="abbreviations">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> abbrev </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="exclamations">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
			<br/>
			<span class="pos"> excl </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="phrasalverbs">
		<xsl:if test="count(translations/translation[@noteng='TRUE'])=0 or count(/translations/translation[@noteng='TRUE'])!=count(translations/translation)">
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
		<xsl:if test="count(translations/translation[@noteng='TRUE'])>0">
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
		<xsl:choose>
			<xsl:when test="@noteng='TRUE'">
                      </xsl:when>
			<xsl:otherwise>
				<xsl:text>    </xsl:text>
				<xsl:if test="last()>1 and $hideCount!='true'">
					<xsl:if test="position()=1">
						<br/>
					</xsl:if>
					<b>
						<xsl:value-of select="position()"/>
						<xsl:text>. </xsl:text>
					</b>
				</xsl:if>
                                <xsl:choose>
                <xsl:when test="@transitive='true'">
			<span class="transitive"><xsl:text>t </xsl:text></span>
		</xsl:when><xsl:otherwise><span class="transitive"><xsl:text>i </xsl:text></span></xsl:otherwise></xsl:choose>
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
					<span class="local"> (US) </span>
				</xsl:if>
				<xsl:if test="@local='gb'">
					<span class="local"> (UK) </span>
				</xsl:if>
				<xsl:if test="@local='au'">
					<span class="local"> (Aus) </span>
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
					<span class="register"> (dial) </span>
				</xsl:if>
				<xsl:if test="@register='dialectal-Cockney'">
					<span class="register"> (dial) </span>
				</xsl:if>
				<xsl:if test="@register='dialectal-cockney'">
					<span class="register"> (dial) </span>
				</xsl:if>
				<xsl:if test="@register='humorous'">
					<span class="register"> (hum) </span>
				</xsl:if>
				<xsl:if test="@register='dated'">
					<span class="register"> (dated) </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Computers') or contains(@catagory,'computers') ">
					<span class="category">[IT] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Language') or contains(@catagory,'language') ">
					<span class="category">[LANG] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Body') or contains(@catagory,'body') ">
					<span class="category">[ANAT] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Sports') or contains(@catagory,'sports') ">
					<span class="category">[SPORT] </span>
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
					<span class="category">[FOOD] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Clothes') or contains(@catagory,'clothes') ">
					<span class="category">[CLOTHES] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Work') or contains(@catagory,'work') ">
					<span class="category">[WORK] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Country') or contains(@catagory,'country') or contains(@catagory,'city') or contains(@catagory,'City') or contains(@catagory,'river') ">
					<span class="category">[GEOG] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Politics') or contains(@catagory,'politics') ">
					<span class="category">[POLIT] </span>
				</xsl:if>
				<xsl:if test="contains(@catagory,'Weather') or contains(@catagory,'weather') ">
					<span class="category">[WEATHER] </span>
				</xsl:if>
                                    <xsl:if test="contains(@catagory,'insect') or contains(@catagory,'insect') ">
			<span class="category">[INSECT] </span>
		</xsl:if>
                    <xsl:if test="contains(@catagory,'material') or contains(@catagory,'material') ">
			<span class="category">[MATERIAL] </span>
		</xsl:if>
                    <xsl:if test="contains(@catagory,'agriculture') or contains(@catagory,'agriculture') ">
			<span class="category">[AGRICULT] </span>
		</xsl:if>
                 <xsl:if test="contains(@catagory,'music') or contains(@catagory,'music') ">
			<span class="category">[MUSIC] </span>
		</xsl:if>
				<xsl:for-each select="translation">
					<xsl:call-template name="translation">
						<xsl:with-param name="hideCount" select="'true'"/>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:if test="@gender='mpl'">
					<span class="gender"> (m pl.) els</span>
				</xsl:if>
				<xsl:if test="@gender='fpl'">
					<span class="gender"> (f pl.) les</span>
				</xsl:if>
				<xsl:if test="@gender='mf'">
					<span class="gender"> (m / f)</span>
				</xsl:if>
				<xsl:if test="@gender='mfullform'">
					<span class="gender"> (m) el</span>
				</xsl:if>
				<xsl:if test="@gender='ffullform'">
					<span class="gender"> (f) la</span>
				</xsl:if>
				<xsl:if test="@gender='f'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1)='a' or  substring(text(),1,1)='e' or  substring(text(),1,1)='i' or  substring(text(),1,1)='o' or  substring(text(),1,1)='u' or  substring(text(),1,1)='h' or  substring(text(),1,1)='à' or  substring(text(),1,1)='è' or  substring(text(),1,1)='í' or  substring(text(),1,1)='ò' or  substring(text(),1,1)='ú' or  substring(text(),1,1)='A' or  substring(text(),1,1)='E' or  substring(text(),1,1)='I' or  substring(text(),1,1)='O' or  substring(text(),1,1)='U' or  substring(text(),1,1)='À'">
							<span class="gender"> (f) l'</span>
						</xsl:when>
						<xsl:otherwise>
							<span class="gender"> (f) la</span>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@gender='m'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1)='a' or  substring(text(),1,1)='e' or  substring(text(),1,1)='i' or  substring(text(),1,1)='o' or  substring(text(),1,1)='u' or  substring(text(),1,1)='h' or  substring(text(),1,1)='à' or  substring(text(),1,1)='è' or  substring(text(),1,1)='í' or  substring(text(),1,1)='ò' or  substring(text(),1,1)='ú' or  substring(text(),1,1)='A' or  substring(text(),1,1)='E' or  substring(text(),1,1)='I' or  substring(text(),1,1)='O' or  substring(text(),1,1)='U' or  substring(text(),1,1)='À'">
							<span class="gender"> (m) l'</span>
						</xsl:when>
						<xsl:otherwise>
							<span class="gender"> (m) el</span>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<span class="translation">
					<xsl:value-of select="text()"/>
				</span>
				<xsl:if test="@catagory">
					<!-- <i>
					[<xsl:value-of select="@catagory"/>]
				</i> -->
				</xsl:if>
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
				<xsl:apply-templates select="engexamp | catexamp"/>
				<xsl:apply-templates select="engnote | catnote"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="position()!=last()  and $hideCount!='true'">
			<br/>
		</xsl:if>
		<xsl:if test="position()!=last()  and $hideCount='true'">
			<xsl:text> / </xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
