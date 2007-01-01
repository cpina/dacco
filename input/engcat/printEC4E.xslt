<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:include href="copy.xslt"/>
	<xsl:template match="files">
	<xsl:element name="all">
	<xsl:apply-templates/>
	</xsl:element>
	</xsl:template>

	<xsl:template match="file">

 <!--  <xsl:apply-templates select="document(concat(text(),'.dic'))"/> -->
<xsl:element name="dictionary">
  <xsl:element name="letter"><xsl:value-of select="substring(text(),1,1)"/></xsl:element>

 <xsl:apply-templates select="document(concat('../../dictionaries/engcat/',text()))/dictionary/*"/>
</xsl:element>
</xsl:template>

	
	<xsl:template match="Entry">
	<xsl:if test="count(*//translation[@noteng])=0">
		<xsl:element name="Entry">
		<xsl:element name="headword"><xsl:value-of select="text()"/></xsl:element>
		
		<xsl:apply-templates select="*"/>
		</xsl:element>
		 </xsl:if>
	</xsl:template>
	
	<xsl:template match="phrasalverbs">
	<xsl:element name="phrasalverbs">
	  <xsl:element name="subhead"><xsl:value-of select="text()"/></xsl:element>
	   <xsl:apply-templates select="translations"/>
	   </xsl:element>
	  
	  </xsl:template>
	
	<xsl:template match="translation">
	<xsl:element name="translation">
	
	<xsl:apply-templates select="@*"/>
                         
	          	   <xsl:if test="@gender='mpl'">
					<xsl:element name="gender"> (m pl.) els </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='fpl'">
					<xsl:element name="gender"> (f pl.) les </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='mf'">
					<xsl:element name="gender"> (m / f) </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='mfullform'">
					<xsl:element name="gender"> (m) el </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='ffullform'">
					<xsl:element name="gender"> (f) la </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='f'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1)='a' or  substring(text(),1,1)='e' or  substring(text(),1,1)='i' or  substring(text(),1,1)='o' or  substring(text(),1,1)='u' or  substring(text(),1,1)='h' or  substring(text(),1,1)='à' or  substring(text(),1,1)='è' or  substring(text(),1,1)='í' or  substring(text(),1,1)='ò' or  substring(text(),1,1)='ú' or  substring(text(),1,1)='A' or  substring(text(),1,1)='E' or  substring(text(),1,1)='I' or  substring(text(),1,1)='O' or  substring(text(),1,1)='U' or  substring(text(),1,1)='À'">
							<xsl:element name="gender"> (f) l' </xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="gender"> (f) la </xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@gender='m'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1)='a' or  substring(text(),1,1)='e' or  substring(text(),1,1)='i' or  substring(text(),1,1)='o' or  substring(text(),1,1)='u' or  substring(text(),1,1)='h' or  substring(text(),1,1)='à' or  substring(text(),1,1)='è' or  substring(text(),1,1)='í' or  substring(text(),1,1)='ò' or  substring(text(),1,1)='ú' or  substring(text(),1,1)='A' or  substring(text(),1,1)='E' or  substring(text(),1,1)='I' or  substring(text(),1,1)='O' or  substring(text(),1,1)='U' or  substring(text(),1,1)='À'">
							<xsl:element name="gender"> (m) l' </xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="gender"> (m) el </xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
	       <xsl:element name="equiv">
               
	          <xsl:value-of select="text()"/>
	          	<xsl:for-each select="translation">
	          	   <xsl:if test="@gender='mpl'">
					<xsl:element name="gender"> (m pl.) els </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='fpl'">
					<xsl:element name="gender"> (f pl.) les </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='mf'">
					<xsl:element name="gender"> (m / f) </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='mfullform'">
					<xsl:element name="gender"> (m) el </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='ffullform'">
					<xsl:element name="gender"> (f) la </xsl:element>
				</xsl:if>
				<xsl:if test="@gender='f'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1)='a' or  substring(text(),1,1)='e' or  substring(text(),1,1)='i' or  substring(text(),1,1)='o' or  substring(text(),1,1)='u' or  substring(text(),1,1)='h' or  substring(text(),1,1)='à' or  substring(text(),1,1)='è' or  substring(text(),1,1)='í' or  substring(text(),1,1)='ò' or  substring(text(),1,1)='ú' or  substring(text(),1,1)='A' or  substring(text(),1,1)='E' or  substring(text(),1,1)='I' or  substring(text(),1,1)='O' or  substring(text(),1,1)='U' or  substring(text(),1,1)='À'">
							<xsl:element name="gender"> (f) l' </xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="gender"> (f) la </xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@gender='m'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1)='a' or  substring(text(),1,1)='e' or  substring(text(),1,1)='i' or  substring(text(),1,1)='o' or  substring(text(),1,1)='u' or  substring(text(),1,1)='h' or  substring(text(),1,1)='à' or  substring(text(),1,1)='è' or  substring(text(),1,1)='í' or  substring(text(),1,1)='ò' or  substring(text(),1,1)='ú' or  substring(text(),1,1)='A' or  substring(text(),1,1)='E' or  substring(text(),1,1)='I' or  substring(text(),1,1)='O' or  substring(text(),1,1)='U' or  substring(text(),1,1)='À'">
							<xsl:element name="gender"> (m) l' </xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="gender"> (m) el </xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			   <xsl:value-of select="text()"/>
                     </xsl:for-each>
	       </xsl:element>
		<xsl:for-each select="engexamp">
			<xsl:element name="transexamp">
			<xsl:apply-templates select="."/>
		      <xsl:apply-templates select="following-sibling::catexamp[1]"/>
		      		</xsl:element>
		</xsl:for-each>
		<xsl:apply-templates select="engnote"/>
	 <xsl:apply-templates select="example | synonyms | plural" />
	 </xsl:element>
	</xsl:template>


    </xsl:stylesheet>
