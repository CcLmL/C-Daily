<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="message">
    <!--
        This is an XSLT template file. Fill in this area with the
        XSL elements which will transform your XML to XHTML.
    -->
	<xsl:element name="message">
		<xsl:for-each select="..//msgrecord">
			<xsl:element name="msgrecord">
				<xsl:attribute name="name">
					<xsl:value-of select="name"/>
				</xsl:attribute>
				<xsl:attribute name="url">
					<xsl:value-of select="url"/>
				</xsl:attribute>
				<xsl:attribute name="mail">
					<xsl:value-of select="mail"/>
				</xsl:attribute>
				<xsl:attribute name="msg">
					<xsl:value-of select="msg"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:for-each>
	</xsl:element>
</xsl:template>

</xsl:stylesheet> 

