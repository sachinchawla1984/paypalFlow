<!--- 
Filename: paypalFlowConfig.cfm
Description: This is the config file and needs to be included to access all settings like:
                i) Default value of form fields
                ii) BaseURL, Paypal Return URL and Paypal Cancel URL
                iii) Sandbox and Production client_id and client_secret that needs to be send via an API call
--->


<!---Check if URL is http or https --->
<cfif cgi.HTTPS eq 'On'>
    <cfset protocol = 'https://'>
<cfelse>
    <cfset protocol = 'http://'>
</cfif>


<!---Set Path for current directory --->
<cfset thisFolder = listLast(expandPath('.'),'\')>

<!---Set default value for the Payment form fields --->
<cfparam name="payment_Frequency" default="OneTime">
<cfparam name="paymentAmount" default="20.00">
<cfparam name="currencyCodeType" default="USD">
<cfparam name="paymentType" default="Sale">
<cfparam name="donation_for" default="">
<cfparam name="dedicate_option" default="">
<cfparam name="dedicated_name" default="">

<!---Base URL used for form redirection --->
<cfparam name="baseUrl" default = "#protocol##cgi.HTTP_HOST#">

<!---Return and Cancel URL needs to be send to Paypal --->
<cfparam name="returnURL" default="#baseUrl#/#thisFolder#/paypalFlowReview.cfm">
<cfparam name="cancelURL" default="#baseUrl#/#thisFolder#/donate.cfm">


<!--- Set value for Environment Sandbox = true OR Sandbox = false for Production--->
<cfset sandbox = true>


<!---Set Client_id and Client_Secret for Sandbox and Production Environment --->
<cfif sandBox>

    <!---Configuration for Paypal Flow - Pay using Credit Card --->
    <cfset VARIABLES.endPointURL = 'https://pilot-payflowpro.paypal.com'>
    <cfset VARIABLES.paypalFlowUser = 'aadhidev'>
    <cfset VARIABLES.paypalFlowPwd = 'aadhideV1'>
    <cfset VARIABLES.paypalFlowVendor = 'aadhidev'>
<cfelse>
    <!--- Add live credentials here--->

    <!---Configuration for Paypal Flow - Pay using Credit Card --->
    <cfset VARIABLES.endPointURL = 'https://payflowpro.paypal.com'>
    <cfset VARIABLES.paypalFlowUser = 'Upworktest'>
    <cfset VARIABLES.paypalFlowPwd = 'dRHRHRH3*'>
    <cfset VARIABLES.paypalFlowVendor = 'ReadingHeart'>
</cfif>
