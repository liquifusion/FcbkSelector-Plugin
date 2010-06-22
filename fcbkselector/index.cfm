<cfsetting enablecfoutputonly="true">

<cfinclude template="stylesheets/doc_styles.cfm">

<cfoutput>

<h1>FcbkSelector v0.2</h1>
<p>With a single function, add a fully-accessible Facebook-like multi-selection widget that is bound directly to your nested properties.</p>
<p>This plugin requires version 1.1 or greater of ColdFusion on Wheels.</p>

<h2>The <code>fcbkSelector()</code> Function</h2>
<p>
	After installing this plugin, a single function called <tt>fcbkSelector()</tt> will be available in your view templates.
	This function acts as a wrapper for the <tt><a href="http://cfwheels.org/docs/function/hasmanycheckbox">hasManyCheckBox()</a></tt>
	form helper but provides additional markup and calls to assets required to make the widget work.
</p>

<h3>Arguments</h3>
<table>
	<thead>
		<tr>
			<th>Argument</th>
			<th>Type</th>
			<th>Required</th>
			<th>Default</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><tt>objectName</tt></td>
			<td>variablename</td>
			<td><tt>true</tt></td>
			<td></td>
			<td>Name of the variable containing the parent object for the selection. Similar to the <tt>objectName</tt> used by other Wheels form helpers.</td>
		</tr>
		<tr class="highlight">
			<td><tt>parentObject</tt></td>
			<td><tt>object</tt></td>
			<td><tt>true</tt></td>
			<td></td>
			<td>Object containing the parent represented by this selection.</td>
		</tr>
		<tr>
			<td><tt>association</tt></td>
			<td><tt>variablename</tt></td>
			<td><tt>true</tt></td>
			<td></td>
			<td>Name of association represented by this selection in the parent object.</td>
		</tr>
		<tr class="highlight">
			<td><tt>options</tt></td>
			<td><tt>query</tt> or <tt>array</tt></td>
			<td><tt>true</tt></td>
			<td></td>
			<td>Query resultset or array of objects representing all options to display.</td>
		</tr>
		<tr>
			<td><tt>id</tt></td>
			<td><tt>string</tt></td>
			<td><tt>true</tt></td>
			<td></td>
			<td>HTML <tt>id</tt> to assign to the selector's container. This is referenced by the jQuery implementation.</td>
		</tr>
		<tr class="highlight">
			<td><tt>showSearch</tt></td>
			<td><tt>boolean</tt></td>
			<td><tt>false</tt></td>
			<td><tt>true</tt></td>
			<td>Whether or not to show the search filter box.</td>
		</tr>
		<tr>
			<td><tt>searchInitText</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>Start Typing a Name</tt></td>
			<td>Text to display in search filter box on load.</td>
		</tr>
		<tr class="highlight">
			<td><tt>className</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>[empty string]</tt></td>
			<td>Class name to assign to the selector's container.</td>
		</tr>
		<tr>
			<td><tt>width</tt></td>
			<td><tt>numeric</tt></td>
			<td><tt>false</tt></td>
			<td><tt>500</tt></td>
			<td>Width of the widget.</td>
		</tr>
		<tr class="highlight">
			<td><tt>itemHeight</tt></td>
			<td><tt>numeric</tt></td>
			<td><tt>false</tt></td>
			<td><tt>50</tt></td>
			<td>Height of each item in the widget.</td>
		</tr>
		<tr>
			<td><tt>itemsPerRow</tt></td>
			<td><tt>numeric</tt></td>
			<td><tt>false</tt></td>
			<td><tt>3</tt></td>
			<td>Number of items to display in each row.</td>
		</tr>
		<tr class="highlight">
			<td><tt>optionIdProperty</tt></td>
			<td><tt>variablename</tt></td>
			<td><tt>false</tt></td>
			<td><tt>id</tt></td>
			<td>Name of options' property containing the ID to associate with.</td>
		</tr>
		<tr>
			<td><tt>optionTextProperty</tt></td>
			<td><tt>variablename</tt></td>
			<td><tt>false</tt></td>
			<td><tt>name</tt></td>
			<td>Name of options' property containing the text to display.</td>
		</tr>
		<tr class="highlight">
			<td><tt>parentPosInCompositeKey</tt></td>
			<td><tt>numeric</tt></td>
			<td><tt>false</tt></td>
			<td><tt>1</tt></td>
			<td>Parent object's position in the composite primary key in the database. This is dictated by column order in the database. If the parent is represented by the second column, for example, pass a value of <tt>2</tt>.</td>
		</tr>
		<tr>
			<td><tt>legend</tt></td>
			<td><tt>string</tt> or <tt>boolean</tt></td>
			<td><tt>false</tt></td>
			<td><tt>false</tt></td>
			<td>Pass a string to display as the <tt>&lt;legend&gt;</tt> if you want for the selector to be wrapped in a <tt>&lt;fieldset&gt;</tt>. Pass <tt>false</tt> if you do not want for the selector to be wrapped in a <tt>&lt;fieldset&gt;</tt>.</td>
		</tr>
		<tr class="highlight">
			<td><tt>prependToLabel</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>[empty string]</tt></td>
			<td>String to evaluate and prepend to the label.</td>
		</tr>
		<tr>
			<td><tt>appendToLabel</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>[empty string]</tt></td>
			<td>String to evaluate and append to the label.</td>
		</tr>
		<tr class="highlight">
			<td><tt>embedImplementationInHead</tt></td>
			<td><tt>boolean</tt></td>
			<td><tt>false</tt></td>
			<td><tt>true</tt></td>
			<td>Whether or not to include the implementation in your <abbr title="Hypertext Markup Language">HTML</abbr> source inside of a <tt>&lt;script&gt;</tt> tag. Pass <tt>false</tt> if you plan on writing your own implementation script and implementing the jQuery call yourself.</td>
		</tr>
		<tr>
			<td><tt>includeJQuery</tt></td>
			<td><tt>boolean</tt></td>
			<td><tt>false</tt></td>
			<td><tt>false</tt></td>
			<td>Whether or not to include jQuery in your document's <tt>&lt;head&gt;</tt> automatically.</td>
		</tr>
		<tr class="highlight">
			<td><tt>includeJQueryPlugin</tt></td>
			<td><tt>boolean</tt></td>
			<td><tt>false</tt></td>
			<td><tt>true</tt></td>
			<td>Whether or not to include the included fcbkListSelection jQuery plugin in your document's <tt>&lt;head&gt;</tt> automatically.</td>
		</tr>
		<tr>
			<td><tt>includeStylesheet</tt></td>
			<td><tt>boolean</tt></td>
			<td><tt>false</tt></td>
			<td><tt>true</tt></td>
			<td>Whether or not to include our stylesheet in your document's <tt>&lt;head&gt;</tt> automatically.</td>
		</tr>
	</tbody>
</table>

<h2>Basic Usage</h2>
<p>At its minimum, you need to provide <tt>fcbkSelector()</tt> a few different elements:</p>
<ul>
	<li><tt>objectName</tt>: Name of the variable containing the parent object.</li>
	<li><tt>parentObject</tt>: The parent object instance itself.</li>
	<li><tt>association</tt>: Name of the association set in the parent object via <tt>hasMany</tt>.</li>
	<li><tt>options</tt>: Query resultset or array of objects containing all possible options for the user.</li>
	<li><tt>id</tt>: <abbr title="Hypertext Markup Language">HTML</abbr> <tt>id</tt> to bind the jQuery implementation to.</li>
</ul>
<p>With those set, your call will look something like this:</p>
<pre>
##fcbkSelector(
    objectName=&quot;customer&quot;,
    parentObject=customer,
    association=&quot;subscriptions&quot;,
    options=publications,
    id=&quot;subscription-selector&quot;
)##
</pre>

<h3>Including or Excluding jQuery and <abbr title="Cascading Style Sheet">CSS</abbr> Assets</h3>
<p>
	This plugin includes the jQuery library, a jQuery plugin called fcbkselectionlist, and a style sheet. Each of these
	assets is optional, and the plugin provides settings to include or exclude them individually.
</p>
<p>
	This gives you the flexibility to move the different assets to the <tt>javascripts</tt> and <tt>stylesheets</tt>
	folders, include them manually using the media helpers in your layouts, or even to minify them using the
	<a href="http://cfwheels.org/plugins/listing/4">Asset Bundler plugin</a> (highly recommended).
</p>
<p>
	Refer to the <tt>includeJQuery</tt>, <tt>includeJQueryPlugin</tt>, and <tt>includeStylesheet</tt> argument
	descriptions above for more details.
</p>

<h3>Implementing Your Own jQuery Plugin Calls</h3>
<p>
	Another default behavior of this plugin is to implement the calls to the jQuery plugin in your document's
	<tt>&lt;head&gt;</tt> section. If you prefer to consolidate and implement the jQuery calls yourself, then pass
	<tt>false</tt> for the <tt>embedImplementationInHead</tt> argument.
</p>
<p>
	If you choose to do so, your call to the jQuery plugin should look similar to this:
</p>
<pre>
(function($){

    $(document).ready(function(){
        // Arguments: id selector, widget width, item height, items per row
        $.fcbkListSelection(&quot;##subscription-selector&quot;, 500, 50, 3);
    });

})(jQuery);
</pre>

<h2>Configuring Defaults</h2>
<p>
	The FcbkSelector plugin will set some default values for you that make sense most of the time. But if you want
	to change some of the defaults application-wide, you can modify these settings in your <tt>config/settings.cfm</tt>
	or <tt>events/onapplicationstart.cfm</tt> files.
</p>
<pre>
&lt;cfset application.fcbkSelector.embedImplementationInHtml = true&gt;
&lt;cfset application.fcbkSelector.includeJQuery = false&gt;
&lt;cfset application.fcbkSelector.includeJQueryPlugin = true&gt;
&lt;cfset application.fcbkSelector.includeStylesheet = true&gt;
&lt;cfset application.fcbkSelector.optionTextProperty = &quot;name&quot;&gt;
&lt;cfset application.fcbkSelector.optionIdProperty = &quot;id&quot;&gt;
&lt;cfset application.fcbkSelector.width = 500&gt;
&lt;cfset application.fcbkSelector.itemHeight = 50&gt;
&lt;cfset application.fcbkSelector.itemsPerRow = 3&gt;
</pre>
<p>Note that all of these settings can be overridden as arguments passed to <tt>fcbkSelector()</tt> as well.</p>

<h2>Credits</h2>
<p>This plugin was created by <a href="http://www.clearcrystalmedia.com/pm/">Chris Peters</a>.</p>

</cfoutput>

<cfsetting enablecfoutputonly="false">