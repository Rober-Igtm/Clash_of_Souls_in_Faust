<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Scene <xsl:apply-templates select="/scene/@id"></xsl:apply-templates></title>
                <link rel="stylesheet" type="text/css" href="faust.css"/>
            </head>
            <body>
                <div class="container">
                    <h1>Faust's Two Souls</h1>
                    <div class="flex-grid">
                        <aside class="col sidebar">
                            <a href="index.xhtml">Home</a>
                            <a href="about.xhtml">About</a>
                            <a href="scenes.xhtml">Scene Index</a>
                            <a href="project_log.xhtml">Project Log</a>
                            <a href="graphs.xhtml">Graphs</a>
                            <a href="conclusions.xhtml">Conclusion</a>
                            <a href="resources.xhtml">Resources</a>
                        </aside>
                        <section class="col script">
                            <xsl:apply-templates select="scene"/>
                        </section>
                    </div>
                </div>

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
        <xsl:apply-templates/>

    </xsl:template>
    <xsl:template match="stage">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="speaker">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="lg">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="l">
        <xsl:apply-templates/>
            <br/>
        
    </xsl:template>
    <xsl:template match="p">
        <br/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="earthly">
        <span class="earthly">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="divine">
        <span class="divine">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
