<cfsetting enablecfoutputonly="true">

<cfparam name="arguments.id" type="string">
<cfparam name="arguments.width" type="numeric">
<cfparam name="arguments.itemHeight" type="numeric">
<cfparam name="arguments.itemsPerRow" type="numeric">

<cfsavecontent variable="javascript">
	<cfoutput>
		<script type="text/javascript">
		(function($){
			$(document).ready(function(){
				//-----------------------------------------------------
				// Run fcbkListSelection*/
				
				$.fcbkListSelection({
					id : "###arguments.id#",
					width : #arguments.width#,
					itemHeight : #arguments.itemHeight#,
					itemsPerRow : #arguments.itemsPerRow#
				});
			});
		})(jQuery);
		</script>
	</cfoutput>
</cfsavecontent>

<cfhtmlhead text="#Trim(javascript)#">

<cfsetting enablecfoutputonly="false">