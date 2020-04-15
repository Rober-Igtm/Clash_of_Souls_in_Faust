<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- GLOBAL VARIABLES -->
    <xsl:variable name="characters" as="xs:double" select="sum(//p/string-length())"/>
    <xsl:variable name="elements" as="xs:double" select="sum(count(//divine)) + sum(count(//earthly))"/>
    <xsl:variable name="divine" as="xs:integer" select="sum(//divine/string-length())"/>
    <xsl:variable name="earthly" as="xs:integer" select="sum(//earthly/string-length())"/>
    
    <xsl:variable name="maxHeight">
        <xsl:choose>
            <xsl:when test="$earthly > $divine">
                <xsl:value-of select="$earthly"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$divine"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="xScale" as="xs:integer" select="2"/>
    <xsl:variable name="yScale" as="xs:double" select="2"/>
    <xsl:variable name="radius" as="xs:double" select="2"/>

    <xsl:template match="/">
        <svg viewBox="0 -70 {$characters * $xScale + 170} {$maxHeight * $yScale + 125}">
            <g transform="translate(100, {$yScale * $maxHeight})">
                <!-- SCALE -->
                <xsl:for-each select="1 to 10">
                    <!-- LOCAL VARIABLES -->
                    <xsl:variable name="xTenth" as="xs:double" select=". * $characters div 10"/>
                    <xsl:variable name="yTenth" as="xs:double"
                        select=". * ceiling($maxHeight div 10)"/>

                    <!-- TICK MARKS -->
                    <line x1="-10" y1="-{$yTenth * $yScale}" x2="0" y2="-{$yTenth * $yScale}"
                        stroke="black"/>

                    <!-- GUIDELINES -->
                    <line x1="0" y1="-{$yTenth * $yScale}" x2="{$characters * $xScale}"
                        y2="-{$yTenth * $yScale}" stroke="lightgrey"/>

                    <!-- LABELS -->
                    <text x="-15" y="-{$yTenth * $yScale}" text-anchor="end"
                        alignment-baseline="central">
                        <xsl:value-of select="$yTenth"/>
                    </text>
                </xsl:for-each>

                <!-- ZERO -->
                <line x1="-10" y1="0" x2="0" y2="0" stroke="black"/>
                <text x="-15" y="0" text-anchor="end" alignment-baseline="central">
                    <xsl:value-of select="0"/>
                </text>

                <!-- BARS -->
                <rect x="{$characters div 3}" y="-{$divine}" width="{$characters div 3}" height="{$divine}" fill="#00FDFF"></rect>
                <rect x="{$characters div 3 * 4}" y="-{$earthly}" width="{$characters div 3}" height="{$earthly}" fill="#FFC300"></rect>

                <!-- BAR LABELS -->
                <text x="{$characters div 6 * 3}" y="-{$divine + 3}" text-anchor="middle" alignment-baseline="bottom" font-size="20px">Divine</text>
                <text x="{($characters div 6 * 9)}" y="-{$earthly + 3}" text-anchor="middle" alignment-baseline="bottom" font-size="20px">Earthly</text>

                <!-- AXES -->
                <line x1="0" y1="0" x2="{$characters * $xScale}" y2="0" stroke="black"/>
                <line x1="0" y1="0" x2="0" y2="-{$yScale * $maxHeight + 50}" stroke="black"/>

                <!-- AXES LABELS -->
                <text x="-50" y="-{$maxHeight div 2 * $yScale}" text-anchor="middle"
                    font-size="larger" transform="rotate(-90 -50 -{$maxHeight div 2 * $yScale})"
                    >Occurrences</text>
                <text x="{$characters * $xScale div 2}" y="50" text-anchor="middle" font-size="larger"
                    alignment-baseline="baseline">Percentage of Scene</text>

                <!-- TITLE -->
                <text x="{$characters * $xScale div 2}" y="-{$maxHeight * $yScale + 55}"
                    text-anchor="middle" font-size="larger" text-decoration="underline">DIVINE AND EARTHLY TRAITS THROUGHOUT SCENE <xsl:value-of select="/scene/@id"
                    /></text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
