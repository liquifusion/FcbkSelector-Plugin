<cfsetting enablecfoutputonly="true">

<cfparam name="arguments.legend" type="string">
<cfparam name="arguments.className" type="string">
<cfparam name="arguments.options" type="any">
<cfparam name="arguments.optionTextProperty" type="variablename">
<cfparam name="arguments.optionsIdProperty" type="variablename">
<cfparam name="arguments.id" type="string">
<cfparam name="arguments.association" type="variablename">
<cfparam name="arguments.parentPosInCompositeKey" type="numeric">
<cfparam name="arguments.parentObject">
<cfparam name="isFieldset" type="boolean">

<cfoutput>

<!--- If this is a fieldset --->
<cfif isFieldset>
<fieldset>
	<legend>#arguments.legend#</legend>
</cfif>

<!--- Display the fields --->
<div
	id="#arguments.id#"
	<cfif Len(arguments.className) gt 0>
		class="#arguments.className#"
	</cfif>
>
	<!--- Handle array of objects --->
	<cfif IsArray(arguments.options)>
		<cfloop array="#arguments.options#" index="option">
			<!--- Keys string --->
			<cfset keys = $buildKeysString(arguments.parentObject, option, arguments.optionIdProperty, arguments.parentPosInCompositeKey)>
			<!--- Check box --->
			#hasManyCheckBox(
				label=option[arguments.optionTextProperty],
				objectName=arguments.objectName,
				association=arguments.association,
				keys=keys
			)#
		</cfloop>
	<!--- Handle query resultset --->
	<cfelse>
		<cfloop query="arguments.options">
			<!--- Keys string --->
			<cfset keys = $buildKeysString(arguments.parentObject, arguments.options, arguments.optionIdProperty, arguments.parentPosInCompositeKey)>
			<!--- Check box --->
			#hasManyCheckBox(
				label=arguments.options.name,
				objectName=arguments.objectName,
				association=arguments.association,
				keys=keys
			)#
		</cfloop>
	</cfif>
</div>

<!--- If this is a fieldset --->
<cfif isFieldset>
	</fieldset>
</cfif>

</cfoutput>

<cfsetting enablecfoutputonly="false">