<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

 <xsl:output method="html" />
<xsl:template match="/">
<html>
 Stats for English-Catalan dictionary<br/>
 entries count is: <xsl:value-of select="sum(/stats/subdictionary/entries)"/><p/>
 translations count is: <xsl:value-of select="sum(/stats/subdictionary/translations)"/><p/>
 examples count is: <xsl:value-of select="sum(/stats/subdictionary/examples)"/><p/>
 catexamp count is: <xsl:value-of select="sum(/stats/subdictionary/catexamp)"/><p/>
 engnote count is: <xsl:value-of select="sum(/stats/subdictionary/engnote)"/><p/>
 catnote count is: <xsl:value-of select="sum(/stats/subdictionary/catnote)"/><p/>
</html>
</xsl:template>
</xsl:stylesheet>
         
          