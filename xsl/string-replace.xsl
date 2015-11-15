<?xml version="1.0" encoding="UTF-8"?>
<!--
String replace template, from
http://geekswithblogs.net/Erik/archive/2008/04/01/120915.aspx
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="string-replace">
  <xsl:param name="string"/>
  <xsl:param name="substring"/>
  <xsl:param name="replace"/>
  <xsl:choose>
    <xsl:when test="contains($string, $substring)">
      <xsl:value-of select="substring-before($string, $substring)"/>
      <xsl:value-of select="$replace"/>
      <xsl:call-template name="string-replace">
        <xsl:with-param name="string" select="substring-after($string, $substring)"/>
        <xsl:with-param name="substring" select="$substring"/>
        <xsl:with-param name="replace" select="$replace"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$string"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
