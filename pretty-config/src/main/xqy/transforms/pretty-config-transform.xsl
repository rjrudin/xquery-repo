<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rapi="http://marklogic.com/rest-api" xmlns:xdmp="http://marklogic.com/xdmp"
	extension-element-prefixes="xdmp">

	<xsl:template match="/rapi:Config">
		<xsl:variable name="title" select="'REST API Configuration Extensions'" />
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta charset="utf-8"></meta>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
				<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
				<title>
					<xsl:value-of select="$title" />
				</title>
				<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"></link>
				<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"></link>
			</head>
			<body class="container">
				<div class="page-header">
					<h1>
						<xsl:value-of select="$title" />
					</h1>
				</div>
				<p>
					The tabs below show all of the resources, query options, and transforms installed in your REST API server.
				</p>
				<p>
					Each list is built from the data that's available from
					<a href="/v1/config/resources">/v1/config/resources</a>
					,
					<a href="/v1/config/query">/v1/config/query</a>
					, and
					<a href="/v1/config/transforms">/v1/config/transforms</a>
					,
					respectively.
				</p>
				<ul class="nav nav-tabs" role="tablist">
					<li class="active">
						<a href="#resources" data-toggle="tab" role="tab">Resources</a>
					</li>
					<li>
						<a href="#options" data-toggle="tab" role="tab">Query Options</a>
					</li>
					<li>
						<a href="#transforms" data-toggle="tab" role="tab">Transforms</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="resources">
						<br />
						<xsl:apply-templates select="rapi:resources" />
					</div>
					<div class="tab-pane" id="options">
						<br />
						<xsl:apply-templates select="rapi:query-options" />
					</div>
					<div class="tab-pane" id="transforms">
						<br />
						<xsl:apply-templates select="rapi:transforms" />
					</div>
				</div>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
				<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="rapi:query-options">
		<div class="list-group">
			<xsl:for-each select="rapi:options">
				<a href="{rapi:uri}" class="list-group-item">
					<xsl:value-of select="rapi:name" />
				</a>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="rapi:transforms">
		<div class="list-group">
			<xsl:for-each select="rapi:transform">
				<a href="{rapi:transform-source}" class="list-group-item">
					<h4 class="list-group-item-heading">
						<xsl:value-of select="rapi:name" />
						<span class="badge" style="margin-left:10px;">
							<xsl:value-of select="rapi:source-format" />
						</span>
					</h4>
					<xsl:if test="rapi:description">
						<xsl:copy-of select="xdmp:unquote(concat('&lt;div&gt;', rapi:description, '&lt;/div&gt;'))" />
					</xsl:if>
				</a>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="rapi:resources">
		<div class="row">
			<div class="col-md-3">
				<div class="affix" role="complementary">
					<ul class="nav">
						<xsl:for-each select="rapi:resource">
							<xsl:sort select="rapi:title" />
							<li>
								<a href="#resource-{position()}">
									<xsl:value-of select="rapi:title" />
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</div>
			</div>
			<div class="col-md-9">
				<xsl:for-each select="rapi:resource">
					<xsl:sort select="rapi:title" />
					<div id="resource-{position()}" class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a data-toggle="collapse" href="#collapse-resource-{position()}">
									<xsl:value-of select="rapi:title" />
								</a>
								<a style="padding-left:10px;" href="/v1/config/resources/{rapi:name}">
									<span class="glyphicon glyphicon-new-window"><!-- -->
									</span>
								</a>
							</h3>
						</div>
						<div id="collapse-resource-{position()}" class="panel-collapse collapse in">
							<div class="panel-body">
								<xsl:if test="rapi:description">
									<xsl:copy-of select="xdmp:unquote(concat('&lt;div&gt;', rapi:description, '&lt;/div&gt;'))" />
								</xsl:if>
								<xsl:for-each select="rapi:methods/rapi:method">
									<h3>
										<xsl:value-of select="rapi:method-name" />
									</h3>
									<xsl:if test="rapi:parameter">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>Name</th>
													<th>Type</th>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="rapi:parameter">
													<tr>
														<td>
															<xsl:value-of select="rapi:parameter-name" />
														</td>
														<td>
															<xsl:value-of select="rapi:parameter-type" />
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</xsl:if>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>