<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

 <xsl:output method="text" />
<xsl:decimal-format
   decimal-separator= '['
   grouping-separator= ';'
  />
 <xsl:template match="/"><![CDATA[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>]]>

   

Aquesta versió del diccionari català-anglès conté: <xsl:value-of select="format-number(sum(/stats/subdictionary/entries),'###,###')"/> entrades, <xsl:value-of select="format-number(sum(/stats/subdictionary/translations),'###,###')"/> traduccions, <xsl:value-of select="sum(/stats/subdictionary/catexamp)"/> exemples i <xsl:value-of select="sum(/stats/subdictionary/catnote)"/> notes d'ús 
<![CDATA[</body>
</html>
]]>
</xsl:template>
</xsl:stylesheet>
         
          