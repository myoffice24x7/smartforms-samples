<?xml version="1.0" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />

  <xsl:template match="smartform-session">

    <xsl:for-each select="field[contains(@name,'email')][text()!='']">
      <xsl:value-of select='.' />
      <xsl:if test='position()!=last( )'>
        <xsl:text>;</xsl:text>
      </xsl:if>
   </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>
