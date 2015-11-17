<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
	xmlns:exsl="http://exslt.org/common"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="xhtml"
	extension-element-prefixes="exsl">
<xsl:output method="xml" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="yes"/>

<!-- Templates for adding a link to the Csound manual index page. -->
<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="xhtml:div[xhtml:h1[@class = 'title']]">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
    <xsl:choose>
      <xsl:when test="count(.//xhtml:a[@href = 'indexframes.html']) = 0">
        <h2 class="title">
          <a href="indexframes.html">Frames Version</a>
        </h2>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>**************************************
Warning: index.html already processed!
**************************************</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:copy>
</xsl:template>

<!-- Templates for creating contents.html, the left nav. -->
<xsl:template match="node()|@*" mode="contents">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*" mode="contents"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="xhtml:div[@class = 'toc']//xhtml:span" mode="contents">
  <xsl:choose>
    <xsl:when test="@class = 'appendix'">
      <font color="Black" size="4">
        <xsl:apply-templates select="node()" mode="contents"/>
        <br/>
      </font>
    </xsl:when>
      <xsl:when test="xhtml:a/text() = 'Glossary'">
        <font color="Black" size="4">
          <br/>
          <xsl:apply-templates select="node()" mode="contents"/>
          <br/>
        </font>
      </xsl:when>
    <xsl:when test="not(@class = 'chapter')
        and not(@class = 'emphasis')
        and not(@class = 'quote')
        and not(@class = 'refentrytitle')
        and not(@class = 'refpurpose')
        and not(@class = 'section')">
      <xsl:message>
        <xsl:text>--------Title:</xsl:text>
        <xsl:value-of select="xhtml:a"/>
      </xsl:message>
      <font color="Black" size="4">
        <br/>
        <xsl:value-of select="xhtml:a"/>
        <br/>
      </font>
    </xsl:when>
    <xsl:otherwise>
      <font size="2">
        <xsl:apply-templates select="node()" mode="contents"/>
      </font>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--
These templates add index letters before opcode links. There is probably a
better way to do this using Muenchian grouping.
-->
<xsl:template name="process-opcode-elements" mode="contents">
  <xsl:param name="letter"/>
  <xsl:variable name="term-elements" select=".//xhtml:dt[xhtml:span/xhtml:a[
    starts-with(normalize-space(text()), $letter)
    or starts-with(normalize-space(text()), translate($letter, 'ABCDEFGHIJKLMNOPQRSTUVQXYZ', 'abcdefghijklmnopqrstuvwxyz'))]]"/>
  <xsl:if test="count($term-elements) &gt; 0">
    <br/>
    <b style="border:solid;">
      <a name="a"><xsl:value-of select="$letter"/></a>
    </b>
    <xsl:apply-templates select="$term-elements" mode="contents"/>
  </xsl:if>
</xsl:template>

<xsl:template match="//xhtml:dl[xhtml:dt/xhtml:span/xhtml:a/@href = 'OpcodesTop.html']/xhtml:dd[1]" mode="contents">
  <dd>
    <dl>
      <!-- Handle opcodes that start with a non-letter character. -->
      <xsl:variable name="term-elements" select=".//xhtml:dt[xhtml:span/xhtml:a[
        not(
          number(
            translate(
              substring(
                normalize-space(text()), 1, 1),
                'ABCDEFGHIJKLMNOPQRSTUVQXYZabcdefghijklmnopqrstuvwxyz',
                '1111111111111111111111111111111111111111111111111111'
            )
          )
        )
      ]]"/>
      <xsl:apply-templates select="$term-elements" mode="contents"/>

      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'A'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'B'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'C'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'D'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'E'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'F'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'G'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'H'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'I'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'J'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'K'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'L'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'M'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'N'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'O'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'P'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'Q'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'R'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'S'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'T'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'U'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'V'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'W'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'X'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'Y'"/></xsl:call-template>
      <xsl:call-template name="process-opcode-elements"><xsl:with-param name="letter" select="'Z'"/></xsl:call-template>
    </dl>
  </dd>
</xsl:template>

<xsl:template match="xhtml:span[@class = 'refpurpose']" mode="contents"/>

<xsl:template match="xhtml:body">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>

  <exsl:document href="contents.html" method="xml" version="1.0" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="UTF-8">
    <xsl:comment> generated by makeframes.xsl </xsl:comment>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <title>Contents</title>
      <link rel="stylesheet" href="csound.css" type="text/css"/>
      <link rel="start" href="index.html" title="The Canonical Csound Reference Manual"/>
      <link rel="next" href="PrefaceTop.html" title="Preface"/>
      <base target="rbottom"/>
    </head>
    <body link="#0000FF" vlink="#0000FF" alink="#0000FF">
      <div class="navheader" style="width: 1137; height: 2">
        <xsl:apply-templates select="//xhtml:div[@class = 'toc']" mode="contents"/>
      </div>
    </body>
    </html>
  </exsl:document>

  <exsl:document href="indexframes.html" method="xml" version="1.0" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="UTF-8">
    <xsl:comment> generated by makeframes.xsl - DO NOT EDIT MANUALLY</xsl:comment>
    <html>
    <head>
      <link rel="stylesheet" href="csound.css" type="text/css"/>
      <title>
        <xsl:text>Csound </xsl:text>
        <xsl:value-of select="CsoundVersion"/>
        <xsl:text> Manual - Frames Version</xsl:text>
      </title>
    </head>
    <frameset cols="275,*">
      <frame name="left" scrolling="auto" noresize="noresize" target="rtop" src="contents.html"/>
      <frameset rows="90,*">
        <frame name="rtop" target="rbottom" src="title.html" scrolling="no" marginheight="6"/>
        <frame name="rbottom" src="credits.html"/>
      </frameset>
      <noframes>
        <body>
          <p>This page uses frames, but your browser doesn't support them.</p>
        </body>
      </noframes>
    </frameset>
    </html>
  </exsl:document>

  <exsl:document href="credits.html" method="xml" version="1.0" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="UTF-8">
    <xsl:comment> generated by makeframes.xsl </xsl:comment>
    <html>
    <head>
      <link rel="stylesheet" href="csound.css" type="text/css"/>
    </head>
    <body/>
    </html>
  </exsl:document>

  <exsl:document href="title.html" method="xml" version="1.0" encoding="UTF-8">
    <xsl:comment> generated by makeframes.xsl </xsl:comment>
    <html>
    <head>
      <title>The Canonical Csound Reference Manual</title>
      <link rel="stylesheet" href="csound.css" type="text/css"/>
      <base target="rbottom"/>
    </head>
    <body alink="#0000ff" link="#0000ff" vlink="#0000ff">
      <p align="center">
        <font size="6">The Canonical Csound Reference Manual</font>
        <font size="4">
          <br/>
          |
          <a href="contents.html#a" style="text-decoration: none;">A</a>
          |
          <a href="contents.html#b" style="text-decoration: none;">B</a>
          |
          <a href="contents.html#c" style="text-decoration: none;">C</a>
          |
          <a href="contents.html#d" style="text-decoration: none;">D</a>
          |
          <a href="contents.html#e" style="text-decoration: none;">E</a>
          |
          <a href="contents.html#f" style="text-decoration: none;">F</a>
          |
          <a href="contents.html#g" style="text-decoration: none;">G</a>
          |
          <a href="contents.html#h" style="text-decoration: none;">H</a>
          |
          <a href="contents.html#i" style="text-decoration: none;">I</a>
          |
          <a href="contents.html#j" style="text-decoration: none;">J</a>
          |
          <a href="contents.html#k" style="text-decoration: none;">K</a>
          |
          <a href="contents.html#l" style="text-decoration: none;">L</a>
          |
          <a href="contents.html#m" style="text-decoration: none;">M</a>
          |
          <a href="contents.html#n" style="text-decoration: none;">N</a>
          |
          <a href="contents.html#o" style="text-decoration: none;">O</a>
          |
          <a href="contents.html#p" style="text-decoration: none;">P</a>
          |
          <a href="contents.html#q" style="text-decoration: none;">Q</a>
          |
          <a href="contents.html#r" style="text-decoration: none;">R</a>
          |
          <a href="contents.html#s" style="text-decoration: none;">S</a>
          |
          <a href="contents.html#t" style="text-decoration: none;">T</a>
          |
          <a href="contents.html#u" style="text-decoration: none;">U</a>
          |
          <a href="contents.html#v" style="text-decoration: none;">V</a>
          |
          <a href="contents.html#w" style="text-decoration: none;">W</a>
          |
          <a href="contents.html#x" style="text-decoration: none;">X</a>
          |
          <a href="contents.html#z" style="text-decoration: none;">Z</a>
          |
          <br/>
          <a href="ScoregensTop.html" target="rbottom" style="text-decoration: none;">Score Statements</a>
          |
          <a href="ScoreGenRef.html" target="rbottom" style="text-decoration: none;">GEN Routines</a>
          |
          <a href="MiscQuickref.html" target="rbottom" style="text-decoration: none;">Quick Reference</a>
        </font>
      </p>
    </body>
    </html>
  </exsl:document>
</xsl:template>

</xsl:stylesheet>
