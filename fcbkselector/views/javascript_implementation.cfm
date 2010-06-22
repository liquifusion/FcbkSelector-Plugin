<cfsetting enablecfoutputonly="true">

<cfparam name="arguments.id" type="string">
<cfparam name="arguments.width" type="numeric">
<cfparam name="arguments.itemHeight" type="numeric">
<cfparam name="arguments.itemsPerRow" type="numeric">
<cfparam name="arguments.showSearch" type="boolean">
<cfparam name="arguments.searchInitText" type="string">

<cfsavecontent variable="javascript">
	<cfoutput>
		<script type="text/javascript">
		(function($){
			$(document).ready(function(){
				$.fcbkListSelection(
					"###arguments.id#",
					#arguments.width#,
					#arguments.itemHeight#,
					#arguments.itemsPerRow#,
					<cfif arguments.showSearch>
						true,
					<cfelse>
						false,
					</cfif>
					"#arguments.searchInitText#"
				);
			});
		})(jQuery);
		</script>
	</cfoutput>
</cfsavecontent>

<cfhtmlhead text="#Trim(javascript)#">

<cfsetting enablecfoutputonly="false">