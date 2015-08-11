<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <STYLE type="text/css">
        @import "../../../../style/reports.css";
      </STYLE>
      <head>
        <script type="text/javascript" src="../../../../style/jquery.min.js"/>
      </head>
      <body>
        <div id="testcasepage">
          <div id="title">
            <table>
              <tr>
                <td>
                  <h1>Test Report</h1>
                </td>
              </tr>
            </table>
          </div>
          <div id="environment">
            <table>
              <tr>
                <th colspan="2">Environment Information</th>
              </tr>
              <tr>
                <td>Build</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="test_definition/environment/@build">
                      <xsl:if test="test_definition/environment/@build = ''">
                        N/A
                      </xsl:if>
                      <xsl:value-of select="test_definition/environment/@build"/>
                    </xsl:when>
                    <xsl:otherwise>
                      N/A
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Branch</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="test_definition/environment/@branch">
                      <xsl:if test="test_definition/environment/@branch = ''">
                        N/A
                      </xsl:if>
                      <xsl:value-of select="test_definition/environment/@branch"/>
                    </xsl:when>
                    <xsl:otherwise>
                      N/A
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>ARCH</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="test_definition/environment/@arch">
                      <xsl:if test="test_definition/environment/@arch = ''">
                        N/A
                      </xsl:if>
                      <xsl:value-of select="test_definition/environment/@arch"/>
                    </xsl:when>
                    <xsl:otherwise>
                      N/A
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Platform</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="test_definition/environment/@platform">
                      <xsl:if test="test_definition/environment/@platform = ''">
                        N/A
                      </xsl:if>
                      <xsl:value-of select="test_definition/environment/@platform"/>
                    </xsl:when>
                    <xsl:otherwise>
                      N/A
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Segment</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="test_definition/environment/@segment">
                      <xsl:if test="test_definition/environment/@segment = ''">
                        N/A
                      </xsl:if>
                      <xsl:value-of select="test_definition/environment/@segment"/>
                    </xsl:when>
                    <xsl:otherwise>
                      N/A
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
              <tr>
                <td>Hardware</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="test_definition/environment/@hardware">
                      <xsl:if test="test_definition/environment/@hardware = ''">
                        N/A
                      </xsl:if>
                      <xsl:value-of select="test_definition/environment/@hardware"/>
                    </xsl:when>
                    <xsl:otherwise>
                      N/A
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
          </div>
          <div>
            <div id="title">
              <a name="contents"/>
              <table>
                <tr>
                  <td class="title">
                    <h1>Test Summary by Component</h1>
                  </td>
                </tr>
              </table>
            </div>
            <table>
              <tr>
                <th>Component</th>
                <th>Passed</th>
                <th>Failed</th>
                <th>Blocked</th>
                <th>Not Run</th>
                <th>Total</th>
              </tr>
              <xsl:for-each select="test_definition/category">
                <xsl:sort select="@name"/>
                <tr>
                  <td>
                    <a>
                      <xsl:attribute name="href">
                        #<xsl:value-of select="@name"/>
                      </xsl:attribute>
                      <xsl:value-of select="@name"/>
                    </a>
                  </td>
                  <td>
                    <xsl:value-of select="count(testcase[@result = 'PASS'])"/>
                  </td>
                  <td>
                    <xsl:value-of select="count(testcase[@result = 'FAIL'])"/>
                  </td>
                  <td>
                    <xsl:value-of select="count(testcase[@result = 'BLOCK'])"/>
                  </td>
                  <td>
                    <xsl:value-of select="count(testcase) - count(testcase[@result = 'PASS']) - count(testcase[@result = 'FAIL']) - count(testcase[@result = 'BLOCK'])"/>
                  </td>
                  <td>
                    <xsl:value-of select="count(testcase)"/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </div>
          <div id="cases">
            <div id="title">
              <table>
                <tr>
                  <td class="title">
                    <h1 align="center">Detailed Test Results</h1>
                  </td>
                </tr>
              </table>
            </div>
            <xsl:for-each select="test_definition/category">
              <xsl:sort select="@name"/>
              <div id="btc">
                <a href="#contents">Back to Contents</a>
              </div>
              <div id="category_title">
                Test Component:
                <xsl:value-of select="@name"/>
                <a><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></a>
              </div>
              <table>
                <tr>
                  <th>Case_ID</th>
                  <th>Purpose</th>
                  <th>Result</th>
                  <th>Comments</th>
                </tr>
                  <xsl:for-each select=".//testcase">
                    <xsl:sort select="@id"/>
                    <tr>
                      <td>
                        <xsl:value-of select="@id"/>
                      </td>
                      <td>
                        <xsl:value-of select="@purpose"/>
                      </td>
                      <xsl:choose>
                        <xsl:when test="@result">
                          <xsl:if test="@result = 'FAIL'">
                            <td class="red_rate">
                              <xsl:value-of select="@result"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="@result = 'PASS'">
                            <td class="green_rate">
                              <xsl:value-of select="@result"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="@result = 'BLOCK' ">
                            <td class="yellow_rate">
                              BLOCK
                            </td>
                          </xsl:if>
                          <xsl:if test="@result != 'BLOCK' and @result != 'FAIL' and @result != 'PASS' ">
                            <td class="yellow_rate">
                              Not Run
                            </td>
                          </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                          <td>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td>
                          <xsl:value-of select="."/>
                      </td>
                    </tr>
                  </xsl:for-each>
              </table>
            </xsl:for-each>
          </div>
        </div>
        <div id="goTopBtn">
          <img border="0" src="../../../../style/back_top.png"/>
        </div>
        <script type="text/javascript" src="../../../../style/reports.js"/>
        <script language="javascript" type="text/javascript">
          $(document).ready(function(){
            goTopEx();
          });
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="br-replace">
    <xsl:param name="word"/>
    <xsl:variable name="cr">
      <xsl:text>
      </xsl:text>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="contains($word,$cr)">
        <xsl:value-of select="substring-before($word,$cr)"/>
        <br/>
        <xsl:call-template name="br-replace">
          <xsl:with-param name="word" select="substring-after($word,$cr)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$word"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
