<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : stats.xsl
    Created on : 20 October 2004, 08:59
    Author     : James
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>stats.xsl</title>
            </head>
            <body>
            Entries: <xsl:value-of select="count(//Entry)"/><br/>
            Translations: <xsl:value-of select="count(//translation)"/><br/>
            Cat Notes : <xsl:value-of select="count(//catnote)"/><br/>
            Eng Notes : <xsl:value-of select="count(//engnote)"/><br/>
            
            
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
