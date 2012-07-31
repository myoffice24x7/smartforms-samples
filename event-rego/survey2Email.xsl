<?xml version="1.0" ?>
<xsl:stylesheet version="2.0" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform file:///D:/com.myoffice/survey/xslt20.xsd"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xsi xsl">
  <xsl:output method="xml" indent="yes" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" encoding="ISO-8859-1" />

  <xsl:template match="smartform-session">
    <html>
      <body>
        <style type='text/css'>
          div#myo-email { font-size: medium; font-family: sans-serif }
          div#myo-email h1 { font-size: 1.3em; margin: .67em 0 }
          div#myo-email h2 { font-size: 1.15em; margin: .75em 0 }
          div#myo-email h3 { font-size: 1.05em; margin: .83em 0 }
          div#myo-email table { border-collapse: collapse }
          div#myo-email table td { padding: 1ex }          
        </style>
        <div id='myo-email'>
          <h2>Registration Confirmation &amp; eTicket</h2>
          <h1>MyOffice24x7 SmartForms Cloud - Nation Wide Information Sessions</h1>
          <p>Dear Registrant/s,</p>
          <p>We confirm receipt of your registration, the details of which are listed below:</p>
          
          <table border='1' cellspacing='0'>
            <xsl:call-template name='attendee-row' />
            <xsl:choose>
              <xsl:when test="contains( field[@name='session'], 'Sydney')">
                <tr>
                  <td>Information Session</td>
                  <td>Tuesday, July 17<sup>th</sup> 2012</td>
                </tr>
                <tr>
                  <td>Time</td>
                  <td>10:00 AM to 2:00 PM</td>
                </tr>
                <tr>
                  <td>Venue</td>
                  <td>Harborview Room<br/>
                      Sydney Convention Centre
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="contains( field[@name='session'], 'Melbourne')">
                <tr>
                  <td>Information Session</td>
                  <td>Wednesday, July 18<sup>th</sup> 2012</td>
                </tr>
                <tr>
                  <td>Time</td>
                  <td>10:00 AM to 2:00 PM</td>
                </tr>
                <tr>
                  <td>Venue</td>
                  <td>Mathew Flinders Room<br/>
                      Melbourne Convention Centre
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="contains( field[@name='session'], 'Brisbane')">
                <tr>
                  <td>Information Session</td>
                  <td>Thursday, July 19<sup>th</sup> 2012</td>
                </tr>
                <tr>
                  <td>Time</td>
                  <td>10:00 AM to 2:00 PM</td>
                </tr>
                <tr>
                  <td>Venue</td>
                  <td>Premier Room<br/>
                      Brisbane Convention &amp; Exhibition Centre
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </table>
      
          <h3>Entry Conditions / Information</h3>
          <ul>
            <li>Print the attached eTicket and bring it along to your session in order to gain entry</li>
            <li>Doors open at 9.30 AM for a 10.00 AM start</li>
            <li>Please allow enough time to be processed through Information Session Check-in</li>
          </ul>         
<!--  
          <h3>Venue Information</h3>
          <p>Please refer to
            <xsl:choose>
              <xsl:when test="contains( field[@name='session'], 'Wangaratta')">
                <a href='https://surveys.vcgr.vic.gov.au/web/register/arrangements-2012/venues/wangaratta'>venue information</a>
              </xsl:when>
              <xsl:when test="contains( field[@name='session'], 'Bairnsdale')">
                <a href='https://surveys.vcgr.vic.gov.au/web/register/arrangements-2012/venues/bairnsdale'>venue information</a>
              </xsl:when>
              <xsl:when test="contains( field[@name='session'], 'Ballarat')">
                <a href='https://surveys.vcgr.vic.gov.au/web/register/arrangements-2012/venues/ballarat'>venue information</a>
              </xsl:when>
              <xsl:when test="contains( field[@name='session'], 'Swan')">
                <a href='https://surveys.vcgr.vic.gov.au/web/register/arrangements-2012/venues/swan-hill'>venue information</a>
              </xsl:when>
              <xsl:when test="contains( field[@name='session'], 'CBD')">
                <a href='https://surveys.vcgr.vic.gov.au/web/register/arrangements-2012/venues/melbourne-cbd'>venue information</a>
              </xsl:when>
            </xsl:choose>
            provided on the MyOffice24x7 registrations website
          </p>
 -->
          <h3>What do I need to bring?</h3>
          <ul>
            <li>Notepad and pen if desired</li>
          </ul>
          
          <h3>Will lunch be provided?</h3>
          <ul>
            <li>A light lunch will be provided.</li>
          </ul>
  
          <h3>General Enquiries / Cancellations</h3>
          <p>
            Phone: 1300 674 090 <br/>
            Email: <a href='mailto:info@myoffice24x7.com'>info@myoffice24x7.com</a><br/>
            We look forward to seeing you.
          </p>
          
          <p>Yours Sincerely,</p>
          <p>
            The MyOffice24x7 Team
          </p>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template name='attendee-row'>
    <xsl:param name='i' select="'1'" required="no" />
    <xsl:variable name='lastname' select="field[@name=concat('attendee.', $i,'.lastname')]" />
    <xsl:if test="$lastname != ''"> 
      <tr>
        <td>Attendee <xsl:value-of select='$i' /></td>
        <td> 
          <xsl:value-of select="$lastname" />
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
