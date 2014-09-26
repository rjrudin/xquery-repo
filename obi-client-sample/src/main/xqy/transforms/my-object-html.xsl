<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:obj="http://marklogic.com/solutions/obi/object"
  xmlns:sem="http://marklogic.com/semantics" xmlns:object="http://marklogic.com/solutions/obi/object" xmlns:xdmp="http://marklogic.com/xdmp"
  extension-element-prefixes="xdmp object">

  <xdmp:import-module namespace="http://marklogic.com/solutions/obi/object" href="/ext/obi/lib/object-lib.xqy" />

  <xsl:template match="/obj:object">
    <xsl:variable name="title" select="obj:title/sem:triple/sem:object" />
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>
          <xsl:value-of select="$title" />
        </title>
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />
      </head>
      <body class="container">
        <div class="page-header">
          <h1>
            <xsl:value-of select="$title" />
          </h1>
        </div>
        <p>
          This is just a sample transform for viewing an object. It's primarily here to show you where to put transforms
          so that they're automatically installed via the ml-gradle tasks.
        </p>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>