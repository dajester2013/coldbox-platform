<!-----------------------------------------------------------------------Author 	 :	Luis MajanoDate     :	September 25, 2005Description : 				General handler for my hello application. Please remember to alter	your extends base component using the Coldfusion Mapping.	example:		Mapping: fwsample		Argument Type: fwsample.system.EventHandlerModification History:Sep/25/2005 - Luis Majano	-Created the template.-----------------------------------------------------------------------><cfcomponent output="false">	<cffunction name="index" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">				<cfset event.setView("test/index")>	</cffunction>			</cfcomponent>