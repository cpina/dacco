<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY verb "v">
<!ENTITY adj "adj">
]>
<!--
    Document   : eng.xsl
    Created on : 17 October 2004, 16:39
    Author     : James
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
   <xsl:template match="nouns">
		<xsl:if test="count(translations/translation)>0">
			<br/>
			<span class="pos"> nnnnn </span>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
