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
   <!--  <xsl:template match="/">
        <xsl:text>top level</xsl:text>
        <xsl:apply-templates select="//file[1]"/>
    </xsl:template> -->
    
    <xsl:template match="file">
        <xsl:variable name="dic" select="./text()"/>
        <xsl:variable name="doc" select="document($dic)"/>
        Translations <xsl:value-of select="position()"/> :<xsl:value-of select="count(document($dic)//translation)"/>
        
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
