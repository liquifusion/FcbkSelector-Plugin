<cfcomponent output="false" mixin="controller">
	
	<!--- Set default values in application scope --->
	<cfset $setDefaultValues()>

	<!----------------------------------------------------->
	<!--- Public --->
	
	<cffunction name="init" hint="Initializes plugin.">
		
		<!--- Compatible with Wheels 1.1+ --->
		<cfset this.version = "1.1">
		<cfreturn this>
		
	</cffunction>
	
	<!----------------------------------------------------->
	
	<cffunction name="fcbkSelector" hint="Displays a Facebook-like multi-selector widget.">
		<cfargument name="objectName" type="variablename" hint="Name of the variable containing the parent object for the selection. Similar to the `objectName` used by other Wheels form helpers.">
		<cfargument name="parentObject" hint="Object containing the parent represented by this selection.">
		<cfargument name="association" type="variablename" hint="Name of association represented by this selection in the parent object.">
		<cfargument name="options" type="any" hint="Query resultset or array of objects representing all options to display.">
		<cfargument name="id" type="string" hint="HTML `id` to assign to the selector's container. This is referenced by the jQuery implementation.">
		<cfargument name="className" type="string" default="" hint="Class name to assign to the selector's container.">
		<cfargument name="width" type="numeric" default="#application.fcbkSelector.width#" hint="Width of the widget.">
		<cfargument name="itemHeight" type="numeric" default="#application.fcbkSelector.itemHeight#" hint="Height of each item in the widget.">
		<cfargument name="itemsPerRow" type="numeric" default="#application.fcbkSelector.itemsPerRow#" hint="Number of items to display in each row.">
		<cfargument name="optionIdProperty" type="variablename" default="#application.fcbkSelector.optionIdProperty#" hint="Name of options' property containing the ID to associate with.">
		<cfargument name="optionTextProperty" type="variablename" default="#application.fcbkSelector.optionTextProperty#" hint="Name of options' property containing the text to display.">
		<cfargument name="parentPosInCompositeKey" type="numeric" default="1" hint="Parent object's position in the composite primary key in the database. This is dictated by column order in the database. If the parent is represented by the second column, for example, pass a value of `2`.">
		<cfargument name="legend" type="string" default="false" hint="Pass a string to display as the `<legend>` if you want for the selector to be wrapped in a `<fieldset>`. Pass `false` if you do not want for the selector to be wrapped in a `<fieldset>`.">
		<cfargument name="prependToLabel" type="string" default="" hint="String to evaluate and prepend to the label.">
		<cfargument name="appendToLabel" type="string" default="" hint="String to evaluate and append to the label.">
		<cfargument name="embedImplementationInHead" type="boolean" default="#application.fcbkSelector.embedImplementationInHtml#" hint="Whether or not to include the implementation in your HTML source inside of a <script> tag. Pass `false` if you plan on writing your own implementation script and implementing the jQuery call yourself.">
		<cfargument name="includeJQuery" type="boolean" default="#application.fcbkSelector.includeJQuery#" hint="Whether or not to include jQuery in your document's <head> automatically.">
		<cfargument name="includeJQueryPlugin" type="boolean" default="#application.fcbkSelector.includeJQueryPlugin#" hint="Whether or not to include the included fcbkListSelection jQuery plugin in your document's `<head>` automatically.">
		<cfargument name="includeStylesheet" type="boolean" default="#application.fcbkSelector.includeStylesheet#" hint="Whether or not to include our stylesheet in your document's <head> automatically.">
		
		<!--- Include jQuery and stylesheets if requested --->
		<cfinclude template="views/html_head.cfm">
		
		<!--- Whether or not this is a fieldset --->
		<cfset isFieldset = Len(arguments.legend) gt 0>
		
		<!--- Build widget --->
		<cfinclude template="views/fcbk_selector.cfm">
		
		<!--- If we're including the implementation in the HTML, do that now --->
		<cfif arguments.embedImplementationInHead>
			<cfinclude template="views/javascript_implementation.cfm">
		</cfif>
	
	</cffunction>
	
	
	<!----------------------------------------------------->
	<!--- Private --->
	
	<cffunction name="$buildKeysString" returntype="string" hint="Builds string to pass as `hasManyCheckBox()`'s `keys` argument'.">
		<cfargument name="parentObject" hint="Object containing the parent represented by this selection.">
		<cfargument name="option" type="any" hint="Model object or query row representing a model object for this current record.">
		<cfargument name="optionIdProperty" type="variablename" hint="Name of option's property containing the ID to associate with.">
		<cfargument name="parentPosInCompositeKey" type="numeric" hint="Parent object's position in the composite primary key in the database. This is dictated by column order in the database. If the parent is represented by the second column, for example, pass a value of `2`.">
		
		<cfset var loc = {}>
		
		<!--- Build list of values for `hasManyCheckBox()` --->
		<cfset loc.keyString = arguments.option[arguments.optionIdProperty]>
		<cfif arguments.parentPosInCompositeKey eq 1>
			<cfset loc.keyString = ListPrepend(loc.keyString, arguments.parentObject.key())>
		<cfelse>
			<cfset loc.keyString = ListAppend(loc.keyString, arguments.parentObject.key())>
		</cfif>
		
		<cfreturn loc.keyString>
		
	</cffunction>
	
	<!----------------------------------------------------->
	
	<cffunction name="$setDefaultValues" access="private" hint="Sets default values in `application` scope if they don't already exist.">
	
		<cfparam name="application.fcbkSelector.embedImplementationInHtml" type="boolean" default="true">
		<cfparam name="application.fcbkSelector.includeJQuery" type="boolean" default="false">
		<cfparam name="application.fcbkSelector.includeJQueryPlugin" type="boolean" default="true">
		<cfparam name="application.fcbkSelector.includeStylesheet" type="boolean" default="true">
		<cfparam name="application.fcbkSelector.optionTextProperty" type="variablename" default="name">
		<cfparam name="application.fcbkSelector.optionIdProperty" type="variablename" default="id">
		<cfparam name="application.fcbkSelector.width" type="numeric" default="500">
		<cfparam name="application.fcbkSelector.itemHeight" type="numeric" default="50">
		<cfparam name="application.fcbkSelector.itemsPerRow" type="numeric" default="3">
	
	</cffunction>
	
	<!----------------------------------------------------->

</cfcomponent>