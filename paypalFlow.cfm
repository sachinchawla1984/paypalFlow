<!--- Include Config file--->
<cfinclude template="paypalFlowConfig.cfm">


<!--- Create an object for Paypal CFC and initialize values with client_id, secret and environment to set the paypal URL--->
<cfset payflowObject = createObject("component", "cfc.paypalFlow")>
<cfset payflowObject.init(
                            endPointURL=VARIABLES.endPointURL
                        )>

<!---
If Payment is recurring then invoke CallRecurringPaymentProfile Method else CallShortcutExpressCheckout
 --->
<!--- CARD --->
<cfset first_name = form.first_name>
<cfset last_name = form.last_name>
<cfset email = form.email_address>
<cfset session.fname = first_name>
<cfset session.lname = last_name>
<cfset session.email_address = email_address>
<cfset firstName = form.first_name>
<cfset lastName = form.last_name>
<cfset creditCardNumber = form.card_number>
<cfset expDateMonth = form.card_month>
<cfset expDateYear = form.card_year>
<cfset cvv2Number = form.card_cvv>
<cfset address1 = form.address_line1>
<cfset address2 = form.address_line2>
<cfset billing_country = form.billing_country>
<cfset city = form.address_city>
<cfset state = form.billing_state>
<cfset zip = form.address_postcode>
<cfset session.address_line1 = address1>
<cfset session.address_line2 = address2>
<cfset session.address_city = city>
<cfset session.billing_state = state>
<cfset session.address_postcode = zip>
<cfset payFlowResponse =  structNew()>

<cfif payment_Frequency eq 'Month'>
    <cfset payPeriod = 'MONT'>
    <cfset isRecurring = true>
<cfelseif payment_Frequency eq 'Quarterly'>
    <cfset payPeriod = 'QTER'>
    <cfset isRecurring = true>
<cfelseif payment_Frequency eq 'biannual'>
    <cfset payPeriod = 'SMYR'>
    <cfset isRecurring = true>
<cfelse>
    <cfset payPeriod = 'none'>
    <cfset isRecurring = false>
</cfif>             

<cfif isRecurring>        
    <cfset paypalFlowResponse = payflowObject.recurringBilling(
            user = VARIABLES.paypalFlowUser,
            pwd = VARIABLES.paypalFlowPwd,
            vendor = VARIABLES.paypalFlowVendor,
            acct = creditCardNumber,
            amt = paymentAmount,
            expMonth = expDateMonth,
            expYear	= expDateYear,
            cvv 	  = cvv2Number,
            term = "36",
            start = "#dateFormat(now()+1,'mmddyyyy')#",
            payperiod = payPeriod,
            trxtype	= "R",
            tender = "C",
            action = "A",
            profilename = "#first_name##last_name#",
            firstName = first_name,
            lastName  = last_name,                        
            comment1 = "New Donation for ReadingHeart"
        )>
<cfelse>
    <cfset paypalFlowResponse = payflowObject.createPayment(
            user = VARIABLES.paypalFlowUser,
            pwd = VARIABLES.paypalFlowPwd,
            vendor   = VARIABLES.paypalFlowVendor,
            cardType  = 0,
            acct = creditCardNumber,
            expMonth  = expDateMonth,
            expYear   = expDateYear,
            cvv 	  = cvv2Number,
            amt 	  = paymentAmount,
            currency  = "USD",
            firstName = first_name,
            lastName  = last_name,
            tender    = "C",
            trxtype   = "S",
            verbosity = "HIGH"
        )>
</cfif>

<cfset response = listLast(paypalFlowResponse[1],'=')>

<cfif response NEQ 126 AND response NEQ 0>
    <cfset responseMess = listLast(paypalFlowResponse[1],'=')>
    <!---locate to error page --->
    <cfdump var="#responseMess#">
<cfelse>               
    <cfset session.credit_card = 1>
    <cfset session.paid_card_amount = paymentAmount>

    <cfif payment_Frequency eq "Month">
        <cfset session.Frequency = "Monthly">
    <cfelseif payment_Frequency eq "Quarterly">
        <cfset session.Frequency = "Quarterly">
    <cfelseif payment_Frequency eq "biannual">
        <cfset session.Frequency = "Bi-annual">
    <cfelse>
        <cfset session.Frequency = "One Time">
    </cfif>

    <cflocation url="thanks.cfm?ac=success" addtoken="no">
</cfif>   
