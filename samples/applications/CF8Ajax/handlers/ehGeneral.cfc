<!-----------------------------------------------------------------------Author 	 :	Your NameDate     :	September 25, 2005Description : 				This is a ColdBox event handler for general methods.Please note that the extends needs to point to the eventhandler.cfcin the ColdBox system directory.extends = coldbox.system.eventhandler	-----------------------------------------------------------------------><cfcomponent name="general" extends="coldbox.system.eventhandler" output="false">		<!--- This init format is mandatory if you are writing init code else is optional, 	      include the super.init(arguments.controller). 	<cffunction name="init" access="public" returntype="any" output="false">		<cfargument name="controller" type="any">		<cfset super.init(arguments.controller)>		<!--- Any constructor code here --->		<cfreturn this>	</cffunction>	--->	<cffunction name="dspHome" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- Do Your Logic Here to prepare a view --->		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox!")>			<!--- Set the View To Display, after Logic --->		<cfset Event.setView("vwHome")>	</cffunction>		<!--- CFGRID example --->	<cffunction name="dspGrid" access="public" returntype="any" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- Do Your Logic Here to prepare a view --->		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox!")>		<!--- Set the View To Display, after Logic --->		<cfset Event.setView("vwCFGrid")>	</cffunction>		<cffunction name="doData" access="public" returntype="query" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- Call your service layer and data from database --->		<cfset var qry1 = getColdBoxOCM().get('qry1') />		<cfreturn qry1>	</cffunction>		<!--- CFINPUT Auto Suggest --->	<cffunction name="dspCFInput" access="public" returntype="any" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- Do Your Logic Here to prepare a view --->		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox!")>			<!--- Set the View To Display, after Logic --->		<cfset Event.setView("vwCFinputAutoSuggest")>	</cffunction>		<cffunction name="doLookupName" access="public" returntype="Array" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfset var searchstring = Event.getValue('search','') />		<cfset var FindFirstName = getColdBoxOCM().get('qry1') />		<cfset var results = ArrayNew(1)>				<cfif len(searchstring)>			<cfquery name="FindFirstName" dbtype="query">				SELECT * FROM FindFirstName				WHERE fname like '%#searchstring#%'			</cfquery>		</cfif>				<cfloop query="FindFirstName" endrow="5">			<cfset ArrayAppend(results,FindFirstName.fname)>		</cfloop>				<cfreturn results>	</cffunction>			<!--- CFAJAXPROXY feature... using client side javascript  --->	<cffunction name="dspAjaxProxy" access="public" returntype="any" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">				<!--- Do Your Logic Here to prepare a view --->		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox!")>			<!--- Set the View To Display, after Logic --->		<cfset Event.setView("vwCFAjaxProxy")>			</cffunction>		<cffunction name="doEmployees" access="public" returntype="any" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfset var ID = Event.getValue('ID',0) />		<!--- Call your service layer and data from database --->		<!--- I have dummy query stored in ColdBox Cache (this is just for demo purpose) --->		<cfset var FindEmployee= getColdBoxOCM().get('qry1') />				<cfif ID GT 0>			<cfquery name="FindEmployee" dbtype="query">				SELECT * FROM FindEmployee				WHERE idt = #ID#			</cfquery>		</cfif>				<cfreturn FindEmployee>	</cffunction>	</cfcomponent>