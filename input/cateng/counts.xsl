<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : stats.xsl
    Created on : 20 October 2004, 08:59
    Author     : James
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    
    <xsl:variable name="docs" select="/*/file"/>
    <xsl:variable name="values"/>
     <xsl:template match="/">
         <xsl:element name="stats">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
    <xsl:template match="file">
        <xsl:variable name="dic" select="./text()"/>
        <xsl:variable name="doc" select="document($dic)"/>
        <xsl:element name="subdictionary">
        <xsl:attribute name="file">
        <xsl:value-of select="$dic"/></xsl:attribute>
        <xsl:element name="entries">
        <xsl:value-of select="count(document($dic)//Entry)"/>
        </xsl:element>
        <xsl:element name="translations">
        <xsl:value-of select="count(document($dic)//translation)"/>
        </xsl:element>
         <xsl:element name="examples">
        <xsl:value-of select="count(document($dic)//example)"/>
        </xsl:element>
         <xsl:element name="catexamp">
        <xsl:value-of select="count(document($dic)//catexamp)"/>
        </xsl:element>
        <xsl:element name="catnote">
        <xsl:value-of select="count(document($dic)//catnote)"/>
        </xsl:element>
        <xsl:element name="engnote">
        <xsl:value-of select="count(document($dic)//engnote)"/>
        </xsl:element>
        </xsl:element>
        <!-- <xsl:for-each select="document($dic)">
        Entries: <xsl:value-of select="count(//Entry)"/><br/>
            Translations: <xsl:value-of select="count(//translation)"/><br/>
            Cat Notes : <xsl:value-of select="count(//catnote)"/><br/>
            Eng Notes : <xsl:value-of select="count(//engnote)"/><br/>
            </xsl:for-each> -->
    </xsl:template>
   
        
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
   

</xsl:stylesheet>
