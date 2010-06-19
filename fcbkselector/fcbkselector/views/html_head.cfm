<cfsetting enablecfoutputonly="true">

<cfparam name="arguments.includeJQuery" type="boolean">
<cfparam name="arguments.includeJQueryPlugin" type="boolean">
<cfparam name="arguments.includeStylesheet" type="boolean">

<!--- Caching time stamp --->
<cfset assetCacheString = "?" & DateFormat(Now(), 'yyyy-mm-dd-') & TimeFormat(Now(), 'hh-mm-ss')>

<cfsavecontent variable="htmlHead">
	<!--- Stylesheet --->
	<cfif application.fcbkSelector.includeStylesheet>
		<cfoutput>
			<link type="text/css" rel="stylesheet" href="/plugins/fcbkselector/stylesheets/fcbklistselection.css#assetCacheString#" />
		</cfoutput>
	</cfif>
	<!--- jQuery --->
	<cfif application.fcbkSelector.includeJQuery>
		<cfoutput>
			<script type="text/javascript" src="/plugins/fcbkselector/javascripts/jquery-1.4.2.min.js#assetCacheString#"></script>
		</cfoutput>
	</cfif>
	<!--- fcbkListSelection jQuery Plugin --->
	<cfif application.fcbkSelector.includeJQueryPlugin>
		<cfoutput>
			<script type="text/javascript" src="/plugins/fcbkselector/javascripts/fcbklistselection.js#assetCacheString#"></script>
		</cfoutput>
	</cfif>
</cfsavecontent>

<cfdump var="#htmlHead#" abort>

<cfhtmlhead text="#Trim(htmlHead)#">

<cfsetting enablecfoutputonly="false">