<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : lut.xsl
    Author     : James
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" />
    
    <xsl:variable name="docs" select="/*/file"/>
    <xsl:variable name="values"/>
     <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template> 
    
    <xsl:template match="file">
        <xsl:variable name="dic" select="./text()"/>
        <xsl:variable name="content" select="document($dic)"/>
        <xsl:for-each select="$content//Entry">
           		<xsl:variable name="entry" select="text()"/>
<xsl:value-of select="$entry"/><xsl:text>,</xsl:text><xsl:value-of select="$entry"/><xsl:text>
</xsl:text>
			<xsl:for-each select="
*//past |
*//gerund |
*//plural |
*//fems |
*//femplural |
*//firstPresent |
*//secondPresent |
*//thirdPresent |
*//participle |
.//expressions |
*//mistakes">

<xsl:value-of select="normalize-space(text())"/><xsl:text>,</xsl:text><xsl:value-of select="$entry"/><xsl:text>
</xsl:text>
			</xsl:for-each>
       </xsl:for-each>
    </xsl:template>
   

</xsl:stylesheet>
