<?xml version="1.0" ?>
<xsl:stylesheet version="2.0" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform file:///D:/com.myoffice/survey/xslt20.xsd"
    exclude-result-prefixes="xsi xsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="smartform-session">
    <div>
      <style type='text/css'>
        div#myo-report { font-size: medium; font-family: sans-serif }
        div#myo-report h1 { font-size: 1.5em; margin: .67em 0 }
        div#myo-report h2 { font-size: 1.25em; margin: .75em 0 }
        div#myo-report h3 { font-size: 1.1em; margin: .83em 0 }
        div#myo-report table { border-collapse: collapse }
        div#myo-report table td { padding: 1ex }          
      </style>
      <div id='myo-report'>
        <h1>MyOffice24x7 SmartForms Cloud - Nation Wide Information Sessions</h1>
        <h2>Attendee Details</h2>
        
        <table border='1' cellspacing='0'>
          <xsl:call-template name='attendee-row' />
          <tr>
            <td>Company:</td>
            <td><xsl:value-of select="field[@name='attendee.organisation']" /></td>
          </tr>
          <tr>
            <td>Venue:</td>
            <td><xsl:value-of select="field[@name='session']" /></td>
          </tr>
          <tr>
            <td>Meal:</td>
            <td><xsl:value-of select="field[@name='meal']" /></td>
          </tr>
  
        </table>
      </div>
    </div>
  </xsl:template>

  <xsl:template name='attendee-row'>
    <xsl:param name='i' select="'1'" required="no" />
    <xsl:variable name='lastname' select="field[@name=concat('attendee.', $i,'.lastname')]" />
    <xsl:if test="$lastname != ''"> 
      <tr>
        <td>Attendee <xsl:value-of select='$i' /></td>
        <td> 
          <xsl:value-of select="field[@name=concat('attendee.', $i, '.title')]" /><xsl:text>. </xsl:text><xsl:value-of select="$lastname" />
          <xsl:text>, </xsl:text>
          <xsl:value-of select="field[@name=concat('attendee.', $i, '.firstname')]" />
        </td>
      </tr>
      <xsl:call-template name='attendee-row'>
        <xsl:with-param name='i' select='$i+1' />
      </xsl:call-template>
    </xsl:if>

  </xsl:template>

</xsl:stylesheet>
