<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>SceneII</title>
            </head>
            <body>
                <h1>EFORE THE CITY-GATE </h1>
                <h1>Earthly Speeches</h1>
                <xsl:apply-templates select="//speaker"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match= "speaker">
        <xsl:apply-templates select= "distinct-values(count(//divine))"/>
    </xsl:template>
</xsl:stylesheet><!--  I tried to count  the divine speeches and the earthly speeches. I wanted to compare the percentage of Fasut's speech in the scene and the percentage of each "divine and earthly" in scene II -->