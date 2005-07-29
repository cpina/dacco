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
         <xsl:element name="missing">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
    <xsl:template match="file">
        <xsl:variable name="dic" select="./text()"/>
        <xsl:variable name="engcat" select="document($dic)"/>
        <xsl:variable name="cateng" select="
        document('../../dictionaries/cateng/a.dic') | 
        document('../../dictionaries/cateng/b.dic') |
        document('../../dictionaries/cateng/c.dic') |
        document('../../dictionaries/cateng/d.dic') |
        document('../../dictionaries/cateng/e.dic') |
        document('../../dictionaries/cateng/f.dic') |
        document('../../dictionaries/cateng/g.dic') |
        document('../../dictionaries/cateng/h.dic') |
        document('../../dictionaries/cateng/i.dic') |
        document('../../dictionaries/cateng/j.dic') |
        document('../../dictionaries/cateng/k.dic') |
        document('../../dictionaries/cateng/l.dic') |
        document('../../dictionaries/cateng/m.dic') |
        document('../../dictionaries/cateng/n.dic') |
        document('../../dictionaries/cateng/o.dic') |
        document('../../dictionaries/cateng/p.dic') |
        document('../../dictionaries/cateng/q.dic') |
        document('../../dictionaries/cateng/r.dic') |
        document('../../dictionaries/cateng/s.dic') |
        document('../../dictionaries/cateng/t.dic') |
        document('../../dictionaries/cateng/u.dic') |
        document('../../dictionaries/cateng/v.dic') |
        document('../../dictionaries/cateng/w.dic') |
        document('../../dictionaries/cateng/x.dic') |
        document('../../dictionaries/cateng/y.dic') |
        document('../../dictionaries/cateng/z.dic')        
        "/>
        <xsl:for-each select="$engcat//Entry">
        	<xsl:variable name="inEngCat" select="text()"/>     
          
	<xsl:variable name="match" select="$cateng/dictionary/Entry/*/translations/translation[text()=$inEngCat]/text()"/>			
       
              
        <xsl:if test="string-length($match)=0">
   
			<xsl:for-each select="*/translations/translation">
				<xsl:value-of select="$inEngCat"/><xsl:text>,</xsl:text><xsl:value-of select="text()"/><xsl:text>,</xsl:text> 
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
