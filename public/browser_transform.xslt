<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
      </head>
      <body>
        <h1>Result</h1>
        <table border="1">
            <tr>
              <th>Count</th>
              <th>Number</th>
              <th>Squared number</th>
            </tr>
            <xsl:for-each select="objects/object">
            <tr>
              <td>
                <xsl:value-of select="iter"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="num"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="squared"></xsl:value-of>
              </td>
            </tr>
             </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
