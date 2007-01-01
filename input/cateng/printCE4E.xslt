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

 <xsl:apply-templates select="document(concat('../../dictionaries/cateng/',text()))/dictionary/*"/>
</xsl:element>
</xsl:template>
	
	
	<xsl:template match="Entry">
		<xsl:element name="Entry">
		<xsl:element name="headword"><xsl:value-of select="text()"/></xsl:element>
		
		<xsl:apply-templates select="*"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="translation">
	<xsl:element name="translation">
	
	<xsl:apply-templates select="@*"/>
		<xsl:if test="@gender">
	       <xsl:element name="gender"><xsl:value-of select="@gender"/></xsl:element>
	       </xsl:if>
	       <xsl:element name="equiv">
	       
	          <xsl:value-of select="text()"/>
	       </xsl:element>
		<xsl:for-each select="catexamp">
			<xsl:element name="transexamp">
			<xsl:apply-templates select="."/>
		      <xsl:apply-templates select="following-sibling::engexamp[1]"/>
		      		</xsl:element>
		</xsl:for-each>
		
		
		

		
	 <xsl:apply-templates select="*[not(self::engexamp or self::catexamp)]" />
	 </xsl:element>
	</xsl:template>

</xsl:stylesheet>
