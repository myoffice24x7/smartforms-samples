<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://string.table"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xsi s">

    <xsl:output method="html" version="1.0" omit-xml-declaration="no"
        indent="yes" />
    <xsl:param name="versionParam" select="'1.0'" />
    
    <xsl:template name="cover">
        <xsl:param name="field" />
        <xsl:param name="label" />
        <td style="padding: 5px; margin: 5px; width: 75px; height: 110px; background-color: whiteSmoke;">             
            <xsl:choose>
                <xsl:when test="field[@name=$field] = 'yes'"><strong><xsl:value-of select="$label" /></strong></xsl:when>
                <xsl:otherwise><xsl:value-of select="$label" />    </xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:template>
    
    <xsl:template match="/smartform-session">

        <h1>Health Insurance Quote Request</h1>

        <p> A submission was received for the Health Insurance Quote form. </p>

        <h2>Details</h2>

        <p> Coverage for: <strong>
                <xsl:value-of select="field[@name='who']"/>
            </strong>
        </p>

        <p> Main Priority: <xsl:choose>
                <xsl:when test="field[@name='priority'] = 'Other'">
                    <strong>
                        <xsl:value-of select="field[@name='priority.other']"/>
                    </strong>
                </xsl:when>
                <xsl:otherwise>
                    <strong>
                        <xsl:value-of select="field[@name='priority']"/>
                    </strong>
                </xsl:otherwise>
            </xsl:choose>
        </p>

        <p> Date of birth: <strong>
                <xsl:value-of select="field[@name='me.dob']"/>
            </strong>
        </p>
        <xsl:choose>
            <xsl:when test="field[@name='who'] = 'couple'">
                <p> Partner's date of birth: <strong>
                        <xsl:value-of select="field[@name='partner.dob']"/>
                    </strong>
                </p>
            </xsl:when>
            <xsl:when test="field[@name='who'] = 'family'">
                <p> Number of children: <strong>
                        <xsl:value-of select="field[@name='children']"/>
                    </strong>
                </p>
                <p> Location: <strong>
                        <xsl:value-of select="field[@name='hi.cover.where']"/>
                    </strong>
                </p>
            </xsl:when>
        </xsl:choose>

        <h2>Benefits</h2>

        <p>The applicant selected the following <strong>bolded</strong> benefits as being 'important' rather than
            'unimportant'.</p>

        <div>
            <h3>Hospital Cover</h3>
            <table>
                <tr>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.private-hospital-admission</xsl:with-param>
                        <xsl:with-param name="label">Private Hospital Admission</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.pregnancy</xsl:with-param>
                        <xsl:with-param name="label">Pregnancy and Birth</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.repro</xsl:with-param>
                        <xsl:with-param name="label">Assisted Reproductive (e.g
                            IVF)</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.heart</xsl:with-param>
                        <xsl:with-param name="label">Heart Surgery</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.eye</xsl:with-param>
                        <xsl:with-param name="label">Major Eye Surgery</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.dialysis</xsl:with-param>
                        <xsl:with-param name="label">Dialysis</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.hipknee</xsl:with-param>
                        <xsl:with-param name="label">Hip &amp; Knee Joint
                            Replacement</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.psych</xsl:with-param>
                        <xsl:with-param name="label">Psychiatry</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.rehab</xsl:with-param>
                        <xsl:with-param name="label">Rehabilitation</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">hospital.weight</xsl:with-param>
                        <xsl:with-param name="label">Surgical Weight Loss Procedures</xsl:with-param>
                    </xsl:call-template>
                </tr>
            </table>
        </div>

        <div>
            <h3>Extras Cover</h3>
            <table>
                <tr>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.dental-general</xsl:with-param>
                        <xsl:with-param name="label">Dental (General)</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.dental-major</xsl:with-param>
                        <xsl:with-param name="label">Dental (Major)</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.optical</xsl:with-param>
                        <xsl:with-param name="label">Optical</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.physio</xsl:with-param>
                        <xsl:with-param name="label">Physiotherapy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.chiro</xsl:with-param>
                        <xsl:with-param name="label">Chiropractic</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.podiatry</xsl:with-param>
                        <xsl:with-param name="label">Podiatry</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.orthotics</xsl:with-param>
                        <xsl:with-param name="label">Orthotics</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.psych</xsl:with-param>
                        <xsl:with-param name="label">Clinical Psychology</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.pharm</xsl:with-param>
                        <xsl:with-param name="label">Pharmaceutical Prescriptions</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="cover">
                        <xsl:with-param name="field">extras.appliances</xsl:with-param>
                        <xsl:with-param name="label">Medical Appliances</xsl:with-param>
                    </xsl:call-template>
                </tr>                
            </table>
        </div>

        <div style="clear: both;"/>
        
        <h2>Callback</h2>
        
        <p>
            Callback preference: <strong><xsl:value-of select="field[@name='callback.method']"/></strong>
        </p>
        
        <p>
            Name: <strong><xsl:value-of select="field[@name='callback.name']"/></strong>
        </p>
        
        <xsl:choose>
            <xsl:when test="field[@name='callback.method'] = 'phone' or field[@name='callback.method'] = 'visit'">
                <p>
                    Phone: <strong><xsl:value-of select="field[@name='callback.phone']"/></strong>
                </p>
            </xsl:when>
            <xsl:when test="field[@name='callback.method'] = 'email'">
                <p>
                    Email: <strong><xsl:value-of select="field[@name='callback.email']"/></strong>
                </p>
            </xsl:when>         
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="field[@name='callback.method'] = 'visit'">
                <p>
                    Date Preference: <strong><xsl:value-of select="field[@name='callback.time']"/></strong>
                </p>
            </xsl:when>   
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>
