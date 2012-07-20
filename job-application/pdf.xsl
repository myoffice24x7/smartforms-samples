<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform' xmlns:fo='http://www.w3.org/1999/XSL/Format'
	xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:str='http://exslt.org/strings'
	xsi:schemaLocation='http://www.w3.org/1999/XSL/Format file:///F:/com.myoffice/survey/fop.xsd
					    http://www.w3.org/1999/XSL/Transform file:///F:/com.myoffice/survey/xslt20.xsd'>
	>
	<xsl:output method="xml" version="1.0" omit-xml-declaration="no"
		indent="yes" />
	<xsl:param name="versionParam" select="'1.0'" />
	<xsl:template name="page-master">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="simpleA4"
				page-height="29.7cm" page-width="21cm" margin-top="1cm"
				margin-bottom="2cm" margin-left="1.5cm" margin-right="1cm">
				<fo:region-body margin-top="15pt" />
				<fo:region-before extent="15pt" />
				<fo:region-after extent="12pt" background-color="silver" />
			</fo:simple-page-master>
			<fo:simple-page-master master-name="nopageA4"
				page-height="29.7cm" page-width="21cm" margin-top="1cm"
				margin-bottom="2cm" margin-left="1.5cm" margin-right="1cm">
				<fo:region-body margin-top="15pt" />
				<fo:region-before extent="15pt" />
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>
	<xsl:template match="/smartform-session">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<xsl:call-template name="page-master" />
			<fo:page-sequence master-reference="nopageA4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block border-bottom-style="solid">
						Job Application for
						<fo:inline font-weight="bold">
							<xsl:value-of select="field[@name='personal.title']" />
							.
							<xsl:value-of select="field[@name='personal.name']" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="field[@name='personal.surname']" />
						</fo:inline>
					</fo:block>
					<fo:block padding="0.5cm">
						<fo:inline font-size="20pt">Personal &amp; Contact Details
						</fo:inline>
						<fo:table>
							<fo:table-body>
								<fo:table-row>
									<!-- Row 1 Column 1 -->
									<fo:table-cell>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Date of Birth:</fo:inline>
											<xsl:value-of select="field[@name='personal.dob']" />
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Residential Address:
											</fo:inline>
											<fo:block>
												<xsl:value-of select="field[@name='residental.address.line-1']" />
											</fo:block>
											<fo:block>
												<xsl:value-of select="field[@name='residental.address.line-2']" />
											</fo:block>
											<fo:block>
												<xsl:value-of select="field[@name='residential.address.suburb']" />
												<xsl:text> </xsl:text>
												<xsl:value-of select="field[@name='residential.address.postcode']" />
												<xsl:text> </xsl:text>
												<xsl:value-of select="field[@name='residential.address.state']" />
											</fo:block>
											<fo:block>
												<xsl:value-of select="field[@name='residential.address.country']" />
											</fo:block>
										</fo:block>
									</fo:table-cell>
									<!-- Row 1 Column 2 -->
									<fo:table-cell>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Email:</fo:inline>
											<xsl:text> </xsl:text>
											<xsl:value-of select="field[@name='personal.email']" />
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">BH:</fo:inline>
											<xsl:text> </xsl:text>
											<xsl:value-of select="field[@name='personal.phone.bh']" />
										</fo:block>
										<fo:block>
											<fo:inline font-weight="bold">AH:</fo:inline>
											<xsl:text> </xsl:text>
											<xsl:value-of select="field[@name='personal.phone.ah']" />
										</fo:block>
										<fo:block>
											<fo:inline font-weight="bold">Work:</fo:inline>
											<xsl:text> </xsl:text>
											<xsl:value-of select="field[@name='personal.phone.work']" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<!-- Row 2 Column 1 -->
									<fo:table-cell>
										<fo:block margin-top="1cm">
											<fo:inline font-size="20pt">Availability</fo:inline>
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Currently Employed:
											</fo:inline>
											<xsl:value-of select="field[@name='current.employed']" />
										</fo:block>
										<xsl:choose>
											<xsl:when test="field[@name='current.employed'] = 'Yes'">
												<fo:block padding-top="0.5cm">
													<fo:inline font-weight="bold">Role: </fo:inline>
													<xsl:value-of select="field[@name='current.role.name']" />
												</fo:block>
												<fo:block>
													<fo:inline font-weight="bold">Notice Period: </fo:inline>
													<xsl:value-of select="field[@name='current.role.notice-period']" />
													weeks
												</fo:block>
											</xsl:when>
										</xsl:choose>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Date available: </fo:inline>
											<xsl:value-of select="field[@name='current.role.availability']" />
										</fo:block>
									</fo:table-cell>
									<!-- Row 2 Column 2 -->
									<fo:table-cell>
										<fo:block margin-top="1cm">
											<fo:inline font-size="20pt">Right to Work</fo:inline>
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">AU/NZ Citizen: </fo:inline>
											<xsl:value-of select="field[@name='right-to-work.is-citizen']" />
										</fo:block>
										<xsl:choose>
											<xsl:when test="field[@name='right-to-work.is-citizen'] = 'No'">
												<fo:block padding-top="0.5cm">
													<fo:inline font-weight="bold">Passport No.: </fo:inline>
													<xsl:value-of
														select="field[@name='right-to-work.passport.number']" />
												</fo:block>
												<fo:block>
													<fo:inline font-weight="bold">Issued By: </fo:inline>
													<xsl:value-of
														select="field[@name='right-to-work.passport.country']" />
												</fo:block>
												<fo:block padding-top="0.5cm">
													<fo:inline font-weight="bold">Visa Type: </fo:inline>
													<xsl:choose>
														<xsl:when
															test="field[@name='right-to-work.visa.type'] = 'Other'">
															<xsl:value-of
																select="field[@name='right-to-work.visa.type.other']" />
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="field[@name='right-to-work.visa.type']" />
														</xsl:otherwise>
													</xsl:choose>
													<fo:block>
														<fo:inline font-weight="bold">No.: </fo:inline>
														<xsl:value-of select="field[@name='right-to-work.visa.number']" />
													</fo:block>
													<fo:block>
														<fo:inline font-weight="bold">Valid: </fo:inline>
														<xsl:value-of
															select="field[@name='right-to-work.visa.issue-date']" />
														<fo:inline font-weight="bold"> until </fo:inline>
														<xsl:value-of
															select="field[@name='right-to-work.visa.expiry-date']" />
													</fo:block>
												</fo:block>
											</xsl:when>
										</xsl:choose>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<!-- Row 3 Column 1 -->
									<fo:table-cell>
										<fo:block margin-top="1cm">
											<fo:inline font-size="20pt">Experience</fo:inline>
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Former Employee: </fo:inline>
											<xsl:value-of select="field[@name='experience.acme-employee']" />
											<xsl:choose>
												<xsl:when test="field[@name='experience.acme-employee'] = 'Yes'">
													(
													<xsl:value-of
														select="field[@name='experience.acme-employee.duration']" />
													years)
												</xsl:when>
											</xsl:choose>
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Years employed in IT:
											</fo:inline>
											<xsl:value-of select="field[@name='experience.industry-duration']" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="1cm">
											<fo:inline font-size="20pt">Qualifications</fo:inline>
										</fo:block>
										<fo:block padding-top="0.5cm">
											<fo:inline font-weight="bold">Highest Qualification:
											</fo:inline>
											<xsl:value-of select="field[@name='qualifications.highest-level']" />
										</fo:block>
										<fo:block>
											<fo:inline font-weight="bold">Granted By: </fo:inline>
											<xsl:value-of select="field[@name='qualifications.organization']" />
										</fo:block>
										<fo:block>
											<fo:inline font-weight="bold">Year Attained: </fo:inline>
											<xsl:value-of select="field[@name='qualifications.year-attained']" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<xsl:call-template name="previous-employer">
				<xsl:with-param name="number" select="'1'" />
			</xsl:call-template>
			<xsl:call-template name="previous-employer">
				<xsl:with-param name="number" select="'2'" />
			</xsl:call-template>
			<xsl:call-template name="previous-employer">
				<xsl:with-param name="number" select="'3'" />
			</xsl:call-template>
		</fo:root>
	</xsl:template>

	<xsl:template name="previous-employer">
		<xsl:param name="number" select="'1'" />
		<xsl:choose>
			<xsl:when
				test="field[@name=concat('prev.role.',$number,'.company-name')] != ''">
				<fo:page-sequence master-reference="nopageA4">
					<fo:flow flow-name="xsl-region-body">
						<fo:block border-bottom-style="solid">
							Job Application for
							<fo:inline font-weight="bold">
								<xsl:value-of select="field[@name='personal.title']" />
								.
								<xsl:value-of select="field[@name='personal.name']" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="field[@name='personal.surname']" />
							</fo:inline>
						</fo:block>
						<fo:block padding="0.5cm">
							<fo:inline font-size="20pt">Employment History</fo:inline>
							<fo:block padding-top="0.5cm">
								<fo:inline font-size="14px">
									Role
									<xsl:value-of select="$number" />
								</fo:inline>
								<fo:block padding-top="0.5cm">
									<fo:inline font-weight="bold">Company Name: </fo:inline>
									<xsl:value-of
										select="field[@name=concat('prev.role.',$number,'.company-name')]" />
								</fo:block>
								<fo:block>
									<fo:inline font-weight="bold">Position: </fo:inline>
									<xsl:value-of
										select="field[@name=concat('prev.role.',$number,'.position')]" />
								</fo:block>
								<fo:block padding-top="0.5cm">
									<fo:inline font-weight="bold">Employed: </fo:inline>
									<xsl:value-of
										select="field[@name=concat('prev.role.',$number,'.from-date')]" />
									until
									<xsl:value-of
										select="field[@name=concat('prev.role.',$number,'.to-date')]" />
								</fo:block>
								<fo:block padding-top="0.5cm">
									<fo:inline font-weight="bold">Duties and Responsibilities:
									</fo:inline>
									<fo:block>
										<xsl:value-of
											select="field[@name=concat('prev.role.',$number,'.company-name')]" />
									</fo:block>
								</fo:block>
								<fo:block padding-top="0.5cm">
									<fo:inline font-weight="bold">Reasons for Leaving:
									</fo:inline>
									<fo:block>
										<xsl:value-of
											select="field[@name=concat('prev.role.',$number,'.reason-for-leaving')]" />
									</fo:block>
								</fo:block>
								<fo:block padding-top="0.5cm">
									<fo:inline font-weight="bold">Contact Name: </fo:inline>
									<xsl:value-of
										select="field[@name=concat('prev.role.',$number,'.contact.name')]" />
								</fo:block>
								<fo:block padding-top="0.5em">
									<fo:inline font-weight="bold">Phone Number: </fo:inline>
									<xsl:value-of
										select="field[@name=concat('prev.role.',$number,'.contact.number')]" />
								</fo:block>
							</fo:block>
						</fo:block>
					</fo:flow>
				</fo:page-sequence>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>