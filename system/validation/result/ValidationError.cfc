/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
The ColdBox validation error, all inspired by awesome Hyrule Validation Framework by Dan Vega
*/
component accessors="true" implements="coldbox.system.validation.result.IValidationError"{
	
	// constructor
	ValidationError function init(){
		message = "";
		field = "";
		rejectedValue = "";
		return this;
	}

	/**
	* Set the error message
	* @message.hint The error message
	*/
	coldbox.system.validation.result.ValidationError function setMessage(required string message){
		variables.message = arguments.message;
		return this;
	}
	 
	/**
	* Set the field
	* @message.hint The error message
	*/
	coldbox.system.validation.result.ValidationError function setField(required string field){
		variables.field = arguments.field;
		return this;	
	}
	
	/**
	* Set the rejected value
	* @value.hint The rejected value
	*/
	coldbox.system.validation.result.IValidationError function setRejectedValue(required any value){
		variables.rejectedValue = arguments.value;
		return this;
	}
	
	/**
	* Get the error message
	*/
	string function getMessage(){
		return message;
	}
	
	/**
	* Get the error field
	*/
	string function getField(){
		return field;
	}
	
	/**
	* Get the rejected value
	*/
	any function getRejectedValue(){
		return rejectedValue;
	}
	
	/**
	* Get the error representation
	*/
	struct function getMemento(){
		return {
			message = message,
			field = field,
			rejectedValue = rejectedValue
		};
	}

	
	/**
	* Configure method, which can do setters for all required error params
	* @message.hint The required error message
	* @field.hint The required field that case the exception
	* @rejectedValue.hint The optional rejected value
	*/
	coldbox.system.validation.result.IValidationError function configure(required string message, required string field, string rejectedValue){
		for(var key in arguments){
			if( structKeyExists(arguments,key) ){ variables[key] = arguments[ key ]; }
		}
		return this;
	}
	
}