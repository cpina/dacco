<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="minFrequency"/>
    <xsl:param name="speaker"/>
    <xsl:output method="text" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" indent="no" media-type="text/html"/>
    <!--XSL Stylesheet for generating Datasheet-->
    <xsl:template match="dictionary">
        <xsl:apply-templates select="Entry"/>
    </xsl:template>
    <xsl:template match="Entry">
        <xsl:value-of select="text()"/> 
        <xsl:if test="engacro">
            <xsl:text>, </xsl:text>	
            <xsl:value-of select="engacro"/>)
        </xsl:if>
        <xsl:text>, </xsl:text>	
        <xsl:for-each select="*/translations/translation">

            <xsl:value-of select="plural"/>
            <xsl:text>, </xsl:text>				

            <xsl:value-of select="fems"/>
            <xsl:text>, </xsl:text>	

            <xsl:value-of select="femplural"/>
            <xsl:text>, </xsl:text>	

        </xsl:for-each>
        <xsl:text>
        </xsl:text>
    </xsl:template>
    <xsl:template match="engexamp"/>
</xsl:stylesheet>
