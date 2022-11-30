<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Result</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Index</th>
            <th>Numbers</th>
            <th>Squares</th>
          </tr>
          <xsl:for-each select="objects/object">
            <tr>
              <td><xsl:value-of select="index"/></td>
              <td><xsl:value-of select="def"/></td>
              <td><xsl:value-of select="sqr"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>