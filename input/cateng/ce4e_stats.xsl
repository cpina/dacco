<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

 <xsl:output method="text" />
<xsl:template match="/"><![CDATA[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>]]>
Catalan-English dictionary: <xsl:value-of select="sum(/stats/subdictionary/entries)"/> entries, <xsl:value-of select="sum(/stats/subdictionary/translations)"/> translations, <xsl:value-of select="sum(/stats/subdictionary/total_eng_examp)"/> examples <xsl:value-of select="sum(/stats/subdictionary/engnote)"/> usage notes
<![CDATA[</body>
</html>
]]>
</xsl:template>
</xsl:stylesheet>
         
          