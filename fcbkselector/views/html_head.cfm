<cfsetting enablecfoutputonly="true">

<cfparam name="arguments.includeJQuery" type="boolean">
<cfparam name="arguments.includeJQueryPlugin" type="boolean">
<cfparam name="arguments.includeStylesheet" type="boolean">

<!--- Base path for assets --->
<cfset basePath = get("rootPath")>
<cfset basePath = ListAppend(basePath, get("pluginPath"), "/")>
<cfset basePath = Replace(basePath, "//", "/", "all")>

<!--- Caching time stamp --->
<cfset assetCacheString = "?" & DateFormat(Now(), 'yyyy-mm-dd-') & TimeFormat(Now(), 'hh-mm-ss')>

<cfsavecontent variable="htmlHead">
	<!--- Stylesheet --->
	<cfif application.fcbkSelector.includeStylesheet>
		<cfoutput>
			<link type="text/css" rel="stylesheet" href="#basePath#/fcbkselector/stylesheets/fcbklistselection.css#assetCacheString#" />
		</cfoutput>
	</cfif>
	<!--- jQuery --->
	<cfif application.fcbkSelector.includeJQuery>
		<cfoutput>
			<script type="text/javascript" src="#basePath#/fcbkselector/javascripts/jquery-1.4.2.min.js#assetCacheString#"></script>
		</cfoutput>
	</cfif>
	<!--- fcbkListSelection jQuery Plugin --->
	<cfif application.fcbkSelector.includeJQueryPlugin>
		<cfoutput>
			<script type="text/javascript" src="basePath/fcbkselector/javascripts/jquery.fcbklistselection.js#assetCacheString#"></script>
		</cfoutput>
	</cfif>
</cfsavecontent>

<cfhtmlhead text="#Trim(htmlHead)#">

<cfsetting enablecfoutputonly="false">