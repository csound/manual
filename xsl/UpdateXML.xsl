<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="xi:*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="*">
  <xsl:element name="{name()}" namespace="http://docbook.org/ns/docbook">
    <xsl:apply-templates select="node()|@*"/>
  </xsl:element>
</xsl:template>

<xsl:template match="/*">
  <xsl:element name="{name()}" namespace="http://docbook.org/ns/docbook">
    <xsl:attribute name="version">5.0</xsl:attribute>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:element>
</xsl:template>

<xsl:template match="/book">
  <book xml:id="index" xml:lang="en"
    xmlns="http://docbook.org/ns/docbook" version="5.0"
    xmlns:xi="http://www.w3.org/2001/XInclude">
    <xsl:apply-templates select="node()"/>
  </book>
</xsl:template>

<xsl:template match="/preface[@id = 'PrefaceTop']">
  <preface
    xmlns="http://docbook.org/ns/docbook" version="5.0"
    xmlns:xi="http://www.w3.org/2001/XInclude">
    <xsl:attribute name="xml:id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:apply-templates select="node()"/>
  </preface>
</xsl:template>

<xsl:template match="/part[@id = 'csound5Opcodes']">
  <part
    xmlns="http://docbook.org/ns/docbook" version="5.0"
    xmlns:xi="http://www.w3.org/2001/XInclude">
    <xsl:attribute name="xml:id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:apply-templates select="node()"/>
  </part>
</xsl:template>

<xsl:template match="/chapter[
    @id = 'CommandTop'
    or @id = 'ControlTop'
    or @id = 'CsBeats'
    or @id = 'CscoreTop'
    or @id = 'csound5Opcodes'
    or @id = 'DeprecatedTop'
    or @id = 'ExperimentalTop'
    or @id = 'MathTop'
    or @id = 'MidiTop'
    or @id = 'OpcodesTop'
    or @id = 'OrchTop'
    or @id = 'OSCNetwork'
    or @id = 'PitchTop'
    or @id = 'PluginTop'
    or @id = 'ScoregensTop'
    or @id = 'ScoreTop'
    or @id = 'SiggenTop'
    or @id = 'SigioTop'
    or @id = 'SigmodTop'
    or @id = 'SpectralTop'
    or @id = 'StringsTop'
    or @id = 'TableTop'
    or @id = 'Using'
    or @id = 'UtilityTop'
    or @id = 'vectorial']">
  <chapter
    xmlns="http://docbook.org/ns/docbook" version="5.0"
    xmlns:xi="http://www.w3.org/2001/XInclude">
    <xsl:attribute name="xml:id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:apply-templates select="node()"/>
  </chapter>
</xsl:template>

<xsl:template match="/section[
    @id = 'ControlFltkIntro'
    or @id = 'UtilityAnalysis'
    or @id = 'UtilityConversion'
    or @id = 'UtilityOther'
    or @id = 'UtilityQueries']">
  <section
    xmlns="http://docbook.org/ns/docbook" version="5.0"
    xmlns:xi="http://www.w3.org/2001/XInclude">
    <xsl:attribute name="xml:id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:apply-templates select="node()"/>
  </section>
</xsl:template>

</xsl:stylesheet>
