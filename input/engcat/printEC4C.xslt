<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
    <xsl:include href="copy.xslt"/>
    <xsl:template match="files">
        <xsl:element name="all">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="file">

        <!--  <xsl:apply-templates select="document(concat(text(),'.dic'))"/> -->
        <xsl:element name="dictionary">
            <xsl:element name="letter"><xsl:value-of select="substring(text(),1,1)"/></xsl:element>

            <xsl:apply-templates select="document(concat('../../dictionaries/engcat/',text()))/dictionary/*"/>
        </xsl:element>
    </xsl:template>

	
    <xsl:template match="Entry">
        <xsl:if test="count(*//translation[@noteng])=0">
            <xsl:element name="Entry">
                <xsl:element name="headword"><xsl:value-of select="text()"/></xsl:element>
		
                <xsl:apply-templates select="*"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
	
    <xsl:template match="phrasalverbs">
        <xsl:element name="phrasalverbs">
            <xsl:element name="subhead"><xsl:value-of select="text()"/></xsl:element>
            <xsl:apply-templates select="translations"/>
        </xsl:element>
	  
    </xsl:template>
	
    <xsl:template match="translation">
        <xsl:element name="translation">
	
            <xsl:apply-templates select="@*"/>

	       
            <xsl:element name="equiv">
                <xsl:value-of select="text()"/>
                <xsl:for-each select="translation">
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="text()"/>
                    <xsl:if test="position() != last()"><xsl:text> / </xsl:text></xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:for-each select="engexamp">
                <xsl:element name="transexamp">
                    <xsl:apply-templates select="."/>
                    <xsl:apply-templates select="following-sibling::catexamp[1]"/>
                </xsl:element>
            </xsl:for-each>
            <xsl:apply-templates select="catnote"/>
            <xsl:apply-templates select="example | synonyms | plural" />
        </xsl:element>
    </xsl:template>

        
    <xsl:template match="@gender">
        <xsl:if test=".='mpl'">
            <xsl:element name="gender"> (m pl.) </xsl:element>
        </xsl:if>
        <xsl:if test=".='fpl'">
            <xsl:element name="gender"> (f pl.) </xsl:element>
        </xsl:if>
        <xsl:if test=".='mf'">
            <xsl:element name="gender"> (m / f) </xsl:element>
        </xsl:if>
        <xsl:if test=".='mfullform'">
            <xsl:element name="gender"> (m) </xsl:element>
        </xsl:if>
        <xsl:if test=".='ffullform'">
            <xsl:element name="gender"> (f) </xsl:element>
        </xsl:if>
        <xsl:if test=".='f'">
            <xsl:element name="gender"> (f) </xsl:element>
        </xsl:if>
        <xsl:if test=".='m'">
            <xsl:element name="gender"> (m) </xsl:element>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
