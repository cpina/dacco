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
         <xsl:element name="missin">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
    <xsl:template match="file">
        <xsl:variable name="dic" select="./text()"/>
        <xsl:variable name="cat" select="document($dic)"/>
        <xsl:variable name="eng" select="
        document('../../dictionaries/engcat/a.dic') | 
        document('../../dictionaries/engcat/b.dic') |
        document('../../dictionaries/engcat/c.dic') |
        document('../../dictionaries/engcat/d.dic') |
        document('../../dictionaries/engcat/e.dic') |
        document('../../dictionaries/engcat/f.dic') |
        document('../../dictionaries/engcat/g.dic') |
        document('../../dictionaries/engcat/h.dic') |
        document('../../dictionaries/engcat/i.dic') |
        document('../../dictionaries/engcat/j.dic') |
        document('../../dictionaries/engcat/k.dic') |
        document('../../dictionaries/engcat/l.dic') |
        document('../../dictionaries/engcat/m.dic') |
        document('../../dictionaries/engcat/n.dic') |
        document('../../dictionaries/engcat/o.dic') |
        document('../../dictionaries/engcat/p.dic') |
        document('../../dictionaries/engcat/q.dic') |
        document('../../dictionaries/engcat/r.dic') |
        document('../../dictionaries/engcat/s.dic') |
        document('../../dictionaries/engcat/t.dic') |
        document('../../dictionaries/engcat/u.dic') |
        document('../../dictionaries/engcat/v.dic') |
        document('../../dictionaries/engcat/w.dic') |
        document('../../dictionaries/engcat/x.dic') |
        document('../../dictionaries/engcat/y.dic') |
        document('../../dictionaries/engcat/z.dic')        
        "/>
        <xsl:for-each select="$cat//Entry">
        	<xsl:variable name="foo" select="text()"/>        
	<xsl:variable name="match" select="$eng/dictionary/Entry/*/translations/translation[text()=$foo]/text()"/>		
		<xsl:if test="string-length($match)=0">
			<xsl:for-each select="*/translations/translation">
				<xsl:value-of select="$foo"/><xsl:text>,</xsl:text><xsl:value-of select="text()"/><xsl:text>,</xsl:text> 
			</xsl:for-each>
			<xsl:text>
</xsl:text>
		</xsl:if>  
       </xsl:for-each>
    </xsl:template>
   
   
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
   

</xsl:stylesheet>
