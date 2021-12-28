<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="tei:person" name="person_detail">
        <div class="card-body">
            <small>Vorname</small>:  <xsl:value-of select=".//tei:forename/text()"/>
            <br />
            <small>Nachname</small>: <xsl:value-of select=".//tei:surname/text()"/>
            <br />
            <small>geboren</small>:  <xsl:value-of select=".//tei:birth/tei:date/text()"/>
            <br />
            <small>gestorben</small>: <xsl:value-of select=".//tei:death/tei:date/text()"/>
            <legend>erwähnt in</legend>
            <ul>
                <xsl:for-each select=".//tei:event">
                    <xsl:variable name="linkToDocument">
                        <xsl:value-of select="replace(tokenize(data(.//@target), '/')[last()], '.xml', '.html')"/>
                    </xsl:variable>
                    <li>
                        <xsl:value-of select=".//tei:title"/><xsl:text> </xsl:text>
                        <a href="{$linkToDocument}">
                            <i class="fas fa-external-link-alt"></i>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
</xsl:stylesheet>