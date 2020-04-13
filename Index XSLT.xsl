<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>Faust's Two Souls</head>
            <body>
                <xsl:apply-templates select="scene"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="head">
        <h1>
            <xsl:apply-templates select="//scene/@id"/>
            <xsl:text>. </xsl:text>
            <xsl:apply-templates/>
        </h1>
        <hr/>
    </xsl:template>
    <xsl:template match="sp">
        <br/>
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="stage">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="speaker">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="lg">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="l">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>
