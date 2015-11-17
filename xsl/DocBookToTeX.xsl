<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:db="http://docbook.org/ns/docbook"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="string-replace.xsl"/>
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:book">
  <xsl:text>\documentclass{tex/csound-manual}
\setmainfont{Latin Modern Sans}
\renewcommand{\MintedPygmentize}{pygments-main/pygmentize}
\title{The Canonical Csound Reference Manual}
\author{The Csound Team}
\begin{document}
\maketitle
\tableofcontents
</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>\end{document}
</xsl:text>
</xsl:template>

<!-- Omit the very long Reference section for now. -->
<xsl:template match="db:part[@id = 'PartReference']"/>

<xsl:template match="db:preface">
  <xsl:text>\chapter*{Preface}
\addcontentsline{toc}{chapter}{Preface}</xsl:text>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template name="make-label">
  <xsl:choose>
    <xsl:when test="@xml:id != ''">
      <xsl:text>\label{</xsl:text>
      <xsl:value-of select="@xml:id"/>
      <xsl:text>}</xsl:text>
    </xsl:when>
    <xsl:when test="@id != ''">
      <xsl:text>\label{</xsl:text>
      <xsl:value-of select="@id"/>
      <xsl:text>}</xsl:text>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:chapter | db:appendix" name="db:chapter">
  <xsl:text>\chapter{</xsl:text>
  <xsl:apply-templates select="db:title" mode="title"/>
  <xsl:text>}
</xsl:text>
  <xsl:call-template name="make-label"/>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="db:book/db:appendix[1]">
  <xsl:text>\appendix</xsl:text>
  <xsl:call-template name="db:chapter"/>
</xsl:template>

<xsl:template match="db:section | db:simplesect | db:formalpara">
  <xsl:variable name="title" select="db:title"/>
  <xsl:variable name="ancestorSectionCount" select="count(ancestor::db:section)"/>
  <xsl:text>\</xsl:text>
  <xsl:choose>
    <xsl:when test="$ancestorSectionCount = 0">
      <xsl:text>section</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 1">
      <xsl:text>subsection</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 2">
      <xsl:text>subsubsection</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 3">
      <xsl:text>paragraph</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 4">
      <xsl:text>subparagraph</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message terminate="no">Section with title “<xsl:value-of select="$title"/>” is nested too deeply.</xsl:message>
      <xsl:text>subparagraph</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>{</xsl:text>
  <xsl:apply-templates select="$title" mode="title"/>
  <xsl:text>}
</xsl:text>
  <xsl:call-template name="make-label"/>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="db:bridgehead">
  <xsl:variable name="ancestorSectionCount" select="count(ancestor::db:section)"/>
  <xsl:text>\</xsl:text>
  <xsl:choose>
    <xsl:when test="$ancestorSectionCount = 0">
      <xsl:text>section*</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 1">
      <xsl:text>subsection*</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 2">
      <xsl:text>subsubsection*</xsl:text>
    </xsl:when>
    <xsl:when test="$ancestorSectionCount = 3">
      <xsl:text>paragraph*</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>subparagraph*</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>{</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>}
</xsl:text>
</xsl:template>

<xsl:template match="db:note">
  <xsl:text>\textbf{</xsl:text>
  <xsl:apply-templates select="db:title" mode="title"/>
  <xsl:text>}
</xsl:text>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="db:para">
  <xsl:apply-templates select="node()"/>
  <xsl:text>\par
</xsl:text>
</xsl:template>

<xsl:template match="db:simpara">
  <xsl:apply-templates select="node()"/>
  <xsl:text>\par
</xsl:text>
</xsl:template>

<xsl:template match="db:itemizedlist">
  <xsl:text>\begin{itemize}
</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>\end{itemize}
</xsl:text>
</xsl:template>

<xsl:template match="db:orderedlist | db:simplelist">
  <xsl:text>\begin{enumerate}
</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>\end{enumerate}
</xsl:text>
</xsl:template>

<xsl:template match="db:itemizedlist/db:listitem | db:orderedlist/db:listitem | db:simplelist/db:member">
  <xsl:text>\item{}</xsl:text>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="db:variablelist">
  <xsl:text>\begin{description}
</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>\end{description}
</xsl:text>
</xsl:template>

<xsl:template match="db:varlistentry">
  <xsl:text>\item[</xsl:text>
  <xsl:apply-templates select="db:term"/>
  <xsl:text>]</xsl:text>
  <xsl:apply-templates select="db:listitem"/>
</xsl:template>

<xsl:template match="db:title"/>
<xsl:template match="db:title" mode="title">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<!--
There are 36 tables/informaltables in the DocBook XML files. None of these
include a colspec <http://www.docbook.org/tdg/en/html/colspec.html> element,
which makes typesetting them very difficult, so skip them for now.
-->
<xsl:template match="db:table | db:informaltable"/>

<xsl:template match="db:mediaobject/db:imageobject/db:imagedata">
  <xsl:text>\includegraphics{</xsl:text>
  <xsl:value-of select="@fileref"/>
  <xsl:text>}
</xsl:text>
</xsl:template>

<xsl:template match="db:literallayout | db:screen | db:synopsis">
  <xsl:text>\begin{verbatim}
</xsl:text>
  <xsl:apply-templates select="node()" mode="verbatim"/>
  <xsl:text>\end{verbatim}
</xsl:text>
</xsl:template>

<xsl:template match="db:programlisting">
  <xsl:text>\begin{minted}{csound-document}
</xsl:text>
  <xsl:apply-templates select="node()" mode="verbatim"/>
  <xsl:text>\end{minted}
</xsl:text>
</xsl:template>

<xsl:template match="text()" mode="verbatim">
  <!--
  XeTeX displays ^^I instead of tab characters, so replace tab characters with
  two spaces.
  -->
  <xsl:call-template name="string-replace">
    <xsl:with-param name="string" select="."/>
    <xsl:with-param name="substring" select="'&#x9;'"/>
    <xsl:with-param name="replace" select="'  '"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="db:citetitle | db:emphasis">
  <xsl:text>\emph{</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="db:code">
  <xsl:text>\texttt{</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="db:link">
  <xsl:choose>
    <xsl:when test="@linkend">
      <xsl:text>\hyperref[</xsl:text>
      <xsl:value-of select="@linkend"/>
      <xsl:text>]{</xsl:text>
      <xsl:apply-templates select="node()"/>
      <xsl:text>}</xsl:text>
    </xsl:when>
    <xsl:when test="node()">
      <xsl:text>\href{</xsl:text>
      <xsl:value-of select="@xlink:href"/>
      <xsl:text>}{</xsl:text>
      <xsl:apply-templates select="node()"/>
      <xsl:text>} (\url{</xsl:text>
      <xsl:value-of select="@xlink:href"/>
      <xsl:text>})</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>\url{</xsl:text>
      <xsl:value-of select="@xlink:href"/>
      <xsl:text>}</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:ulink">
  <xsl:choose>
    <xsl:when test="node()">
      <xsl:text>\href{</xsl:text>
      <xsl:value-of select="@url"/>
      <xsl:text>}{</xsl:text>
      <xsl:apply-templates select="node()"/>
      <xsl:text>} (\url{</xsl:text>
      <xsl:value-of select="@url"/>
      <xsl:text>})</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>\url{</xsl:text>
      <xsl:value-of select="@url"/>
      <xsl:text>}</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="db:indexterm">
  <xsl:text>\index{</xsl:text>
  <xsl:apply-templates select="db:primary"/>
  <xsl:if test="db:secondary">
    <xsl:text>!</xsl:text>
    <xsl:apply-templates select="db:secondary"/>
    <xsl:if test="db:tertiary">
      <xsl:text>!</xsl:text>
      <xsl:apply-templates select="db:tertiary"/>
    </xsl:if>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="db:see">
      <xsl:text>|see{</xsl:text>
      <xsl:apply-templates select="db:see"/>
      <xsl:text>}</xsl:text>
    </xsl:when>
    <xsl:when test="db:seealso">
      <xsl:text>|seealso{</xsl:text>
      <xsl:apply-templates select="db:seealso"/>
      <xsl:text>}</xsl:text>
    </xsl:when>
  </xsl:choose>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- Escape TeX special characters -->
<xsl:template match="text()">
  <xsl:call-template name="string-replace">
    <xsl:with-param name="string">
      <xsl:call-template name="string-replace">
        <xsl:with-param name="string">
          <xsl:call-template name="string-replace">
            <xsl:with-param name="string">
              <xsl:call-template name="string-replace">
                <xsl:with-param name="string">
                  <xsl:call-template name="string-replace">
                    <xsl:with-param name="string">
                      <xsl:call-template name="string-replace">
                        <xsl:with-param name="string">
                          <xsl:call-template name="string-replace">
                            <xsl:with-param name="string">
                              <xsl:call-template name="string-replace">
                                <xsl:with-param name="string">
                                  <xsl:call-template name="string-replace">
                                    <xsl:with-param name="string">
                                      <xsl:call-template name="string-replace">
                                        <xsl:with-param name="string">
                                          <xsl:call-template name="string-replace">
                                            <xsl:with-param name="string">
                                              <xsl:call-template name="string-replace">
                                                <xsl:with-param name="string">
                                                  <xsl:call-template name="string-replace">
                                                    <xsl:with-param name="string" select="."/>
                                                    <xsl:with-param name="substring" select="'\'"/>
                                                    <xsl:with-param name="replace" select="'\textbackslash'"/>
                                                  </xsl:call-template>
                                                </xsl:with-param>
                                                <xsl:with-param name="substring" select="'}'"/>
                                                <xsl:with-param name="replace" select="'\}'"/>
                                              </xsl:call-template>
                                            </xsl:with-param>
                                            <xsl:with-param name="substring" select="'{'"/>
                                            <xsl:with-param name="replace" select="'\{'"/>
                                          </xsl:call-template>
                                        </xsl:with-param>
                                        <xsl:with-param name="substring" select="'/'"/>
                                        <xsl:with-param name="replace" select="'\slash{}'"/>
                                      </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="substring" select="'\textbackslash'"/>
                                    <xsl:with-param name="replace" select="'\textbackslash{}'"/>
                                  </xsl:call-template>
                                </xsl:with-param>
                                <xsl:with-param name="substring" select="'^'"/>
                                <xsl:with-param name="replace" select="'\^{}'"/>
                              </xsl:call-template>
                            </xsl:with-param>
                            <xsl:with-param name="substring" select="'_'"/>
                            <xsl:with-param name="replace" select="'\_'"/>
                          </xsl:call-template>
                        </xsl:with-param>
                        <xsl:with-param name="substring" select="'~'"/>
                        <xsl:with-param name="replace" select="'\~{}'"/>
                      </xsl:call-template>
                    </xsl:with-param>
                    <xsl:with-param name="substring" select="'&#xA0;'"/>
                    <xsl:with-param name="replace" select="'~'"/>
                  </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="substring" select="'&amp;'"/>
                <xsl:with-param name="replace" select="'\&amp;'"/>
              </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="substring" select="'%'"/>
            <xsl:with-param name="replace" select="'\%'"/>
          </xsl:call-template>
        </xsl:with-param>
        <xsl:with-param name="substring" select="'$'"/>
        <xsl:with-param name="replace" select="'\$'"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="substring" select="'#'"/>
    <xsl:with-param name="replace" select="'\#'"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
