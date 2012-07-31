<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version='1.1'
    xmlns='http://www.w3.org/1999/XSL/Format'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'
    xmlns:fox='http://xmlgraphics.apache.org/fop/extensions'
    xmlns:barcoder="com.myoffice24x7.smartform.domain.runtime.session.transform.impl.XsltUtil"
    xsi:schemaLocation='http://www.w3.org/1999/XSL/Format file:///D:/com.myoffice/survey/fop.xsd
                        http://www.w3.org/1999/XSL/Transform file:///D:/com.myoffice/survey/xslt20.xsd'>


 <xsl:attribute-set name="h3">
  <xsl:attribute name='font-size'>125%</xsl:attribute>
  <xsl:attribute name='font-weight'>bold</xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="subheading-block-spacing">
  <xsl:attribute name='padding'>1em 0 0.25em</xsl:attribute>
  <xsl:attribute name='margin'>0</xsl:attribute>
 </xsl:attribute-set>
 
 <xsl:attribute-set name="default-block-spacing">
  <xsl:attribute name='padding'>0.33em 0</xsl:attribute>
  <xsl:attribute name='margin'>0</xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="default-cell-spacing">
  <xsl:attribute name='padding'>0.25em</xsl:attribute>
  <xsl:attribute name='margin'>0</xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="default-list-spacing">
  <xsl:attribute name='provisional-distance-between-starts'>1em</xsl:attribute>
  <xsl:attribute name='provisional-label-separation'>1em</xsl:attribute>
  <xsl:attribute name='margin-left'>0.5em</xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="sup">
  <xsl:attribute name='vertical-align'>super</xsl:attribute>
  <xsl:attribute name='font-size'>66%</xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="table-cell-borders">
  <xsl:attribute name='border'>thin solid black</xsl:attribute>
 </xsl:attribute-set>


 <xsl:template match="smartform-session">

  <root>
   <layout-master-set>
    <simple-page-master master-name="PlainA4" page-height="297mm" page-width="210mm">
     <region-body />
    </simple-page-master>
    <simple-page-master master-name="WatermarkedA4" page-height="297mm" page-width="210mm">
     <region-body background-image="http://www.myoffice24x7.com/seminar-demo/page-background.svg" background-position-horizontal="right" background-position-vertical="bottom" background-repeat="no-repeat" />
    </simple-page-master>
    
   </layout-master-set>

   <fox:external-document content-type="pdf" src="http://www.myoffice24x7.com/seminar-demo/flyer.pdf" />

   <page-sequence master-reference="WatermarkedA4">
    <flow flow-name="xsl-region-body" font-size="medium" line-height-shift-adjustment='disregard-shifts'>
     <block-container width='14cm' height='24cm' margin='10mm'>

      <block text-align='center' font-size='smaller'>
       <xsl:call-template name='barcode'>
        <xsl:with-param name='barcodeText' select="user-visit/@user-uuid" />
       </xsl:call-template>
      </block>

      <block xsl:use-attribute-sets='h3 subheading-block-spacing'>
       Ticket Details:
      </block>

      <block xsl:use-attribute-sets='default-block-spacing'>
       <table width="13cm" table-layout="fixed">
         <table-column column-width='33%' xsl:use-attribute-sets='table-cell-borders' />
         <table-column column-width='67%' xsl:use-attribute-sets='table-cell-borders' />
         <table-body>
         <xsl:call-template name='attendee-row' />
         <xsl:choose>
           <xsl:when test="contains( field[@name='session'], 'Sydney')">
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Information Session</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Tuesday, July 17<inline xsl:use-attribute-sets='sup'>th</inline> 2012</block></table-cell>
             </table-row>
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Time</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>10:00 AM to 2:00 PM</block></table-cell>
             </table-row>
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Venue</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'>
                <block>Harborview Room</block>
                <block>Sydney Convention Centre</block>
               </table-cell>
             </table-row>
           </xsl:when>
           <xsl:when test="contains( field[@name='session'], 'Melbourne')">
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Information Session</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Wednesday, July 18<inline xsl:use-attribute-sets='sup'>th</inline> 2012</block></table-cell>
             </table-row>
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Time</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>10:00 AM to 2:00 PM</block></table-cell>
             </table-row>
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Venue</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'>
                <block>Mathew Flinders Room</block>
                <block>Melbourne Convention Centre</block>
               </table-cell>
             </table-row>
           </xsl:when>
           <xsl:when test="contains( field[@name='session'], 'Brisbane')">
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Information Session</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Thursday, July 19<inline xsl:use-attribute-sets='sup'>th</inline> 2012</block></table-cell>
             </table-row>
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Time</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>10:00 AM to 2:00 PM</block></table-cell>
             </table-row>
             <table-row xsl:use-attribute-sets='table-cell-borders'>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Venue</block></table-cell>
               <table-cell xsl:use-attribute-sets='default-cell-spacing'>
                 <block>Premier Room</block>
                 <block>Brisbane Convention &amp; Exhibition Centre</block>
               </table-cell>
             </table-row>
           </xsl:when>
         </xsl:choose>
         </table-body>
       </table>
      </block>
      
      <block xsl:use-attribute-sets='h3 subheading-block-spacing'>Entry Conditions / Information</block>
      <list-block xsl:use-attribute-sets='default-list-spacing'>
       <xsl:call-template name='bullet-list'>
        <xsl:with-param name='item'>Print the this eTicket and bring it along to your session in order to gain entry</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name='bullet-list'>
        <xsl:with-param name='item'>Doors open at 9.30 AM for a 10.00 AM start</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name='bullet-list'>
        <xsl:with-param name='item'>Please allow enough time to be processed through Information Session Check-in</xsl:with-param>
       </xsl:call-template>
      </list-block>
      

      <block xsl:use-attribute-sets='h3 subheading-block-spacing'>What do I need to bring?</block>
      <list-block xsl:use-attribute-sets='default-list-spacing'>
       <xsl:call-template name='bullet-list'>
        <xsl:with-param name='item'>Notepad and pen if desired</xsl:with-param>
       </xsl:call-template>
      </list-block>

      <block xsl:use-attribute-sets='h3 subheading-block-spacing'>Will lunch be provided?</block>
      <list-block xsl:use-attribute-sets='default-list-spacing'>
       <xsl:call-template name='bullet-list'>
        <xsl:with-param name='item'>A light lunch will be provided.</xsl:with-param>
       </xsl:call-template>
      </list-block>

      <block xsl:use-attribute-sets='h3 subheading-block-spacing'>General Enquiries / Cancellations</block>
      <block xsl:use-attribute-sets='default-block-spacing'>
       <block>Phone: 1300 674 090</block>
       <block>Email: <basic-link external-destination='mailto:info@myoffice24x7.com'>info@myoffice24x7.com</basic-link></block>
      </block>

      <block xsl:use-attribute-sets='default-block-spacing'>We look forward to seeing you.</block>
      <block xsl:use-attribute-sets='default-block-spacing'>Yours Sincerely,</block>
      <block xsl:use-attribute-sets='default-block-spacing'>The MyOffice24x7 Team</block>

     </block-container>
    </flow>
   </page-sequence>
  </root>
 </xsl:template>

  <xsl:template name='attendee-row'>
    <xsl:param name='i' select="'1'" />
    <xsl:variable name='lastname' select="field[@name=concat('attendee.', $i,'.lastname')]" />
    <xsl:if test="$lastname != ''"> 
      <table-row xsl:use-attribute-sets='table-cell-borders'>
        <table-cell xsl:use-attribute-sets='default-cell-spacing'><block>Attendee <xsl:value-of select='$i' /></block></table-cell>
        <table-cell xsl:use-attribute-sets='default-cell-spacing'><block> 
          <xsl:value-of select="$lastname" />
          <xsl:text>, </xsl:text>
          <xsl:value-of select="field[@name=concat('attendee.', $i, '.firstname')]" />
        </block></table-cell>
      </table-row>
      <xsl:call-template name='attendee-row'>
        <xsl:with-param name='i' select='$i+1' />
      </xsl:call-template>
    </xsl:if>

  </xsl:template>

 <xsl:template name='bullet-list'>
  <xsl:param name='bullet' select="'&#x2022;'" />
  <xsl:param name='item' />

  <list-item xsl:use-attribute-sets='default-block-spacing'>
   <list-item-label end-indent='label-end( )'>
    <block>
     <xsl:copy-of select='$bullet' />
    </block>
   </list-item-label>
   <list-item-body start-indent='body-start( )'>
    <block>
     <xsl:copy-of select='$item' />
    </block>
   </list-item-body>
  </list-item>
 </xsl:template>

 <xsl:template name="barcode">
   <xsl:param name="barcodeText" />
   <xsl:variable name="imageSrc" select='barcoder:createBarcodeImage($barcodeText)'/>
   <block>
    <external-graphic src="{$imageSrc}" content-width="12cm" />
   </block>
   <block>
    <xsl:value-of select="$barcodeText"/>
   </block>
   <xsl:variable name="unused" select='barcoder:clearBarcodeImageFile($imageSrc)'/>
  </xsl:template>


</xsl:stylesheet>