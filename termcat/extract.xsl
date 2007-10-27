<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" indent="no" media-type="text/html"/>
    <!--XSL Stylesheet for generating Datasheet-->
    <xsl:template match="/">
        <xsl:apply-templates select="//denominacio[@tipus='principal' or @tipus='remissio']"/>
    </xsl:template>
    <xsl:template match="denominacio">
        <xsl:variable name="topic" select="../areatematica/text()"/>
        <xsl:variable name="entry" select="text()"/>
        <xsl:variable name="type" select="@tipus"/>
        <xsl:for-each select="following-sibling::*[@llengua='en']">
"<xsl:value-of select="$entry"/>","<xsl:value-of select="text()"/>",<xsl:value-of select="$type"/>,<xsl:value-of select="$topic"/><xsl:text></xsl:text>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>
