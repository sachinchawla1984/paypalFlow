PayPal Payflow API – ColdFusion CFC Wrapper
    This ColdFusion component is a simple wrapper for the PayPal Payflow Pro API. It allows you to process direct credit card payments, issue refunds, and manage recurring billing profiles through the Payflow gateway.

Initialization
    To start using the component, initialize it with the Payflow API endpoint URL. This URL differs depending on whether you're using the sandbox or live environment.

Key Functions
    1. createPayment(...)
    Processes a one-time direct credit card payment through Payflow.

    Required Parameters:
    Payflow credentials: user, pwd, vendor

    Credit card details: cardType, acct, expMonth, expYear, cvv

    Payment info: amt

    Optional:
    Cardholder info: firstName, lastName

    Transaction customization: currency, tender, trxtype, verbosity

    Note: The expiration date is combined from expMonth and expYear.

2. refund(...)
    Issues a partial or full refund for a previously approved transaction.

    Required Parameters:
    Payflow credentials: user, pwd, vendor

    origid: The transaction ID to be refunded

    amt: Amount to refund

    tender: Tender type (e.g., C for credit card)

    Optional:
    trxtype: Transaction type

3. recurringBilling(...)
    Creates, modifies, cancels, or manages a recurring billing profile.

    Required Parameters:
    Payflow credentials: user, pwd, vendor

    Credit card info: acct, expMonth, expYear, cvv

    Billing details: amt, payperiod, action, tender

    Optional:
    Profile setup: profilename, start, term

    Misc: comment1, trxtype, firstName, lastName

    Action values include: A (Add), M (Modify), C (Cancel), R (Reactivate), I (Inquiry)

Internal Function: apiCall(parameters)
    All functions internally use apiCall() to send an HTTP POST request to the Payflow endpoint, passing along the required parameters. Selected fields like names and credentials are not URL-encoded, as per Payflow’s API specification.

-------------------------------------------------------------------------
Example - 

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

-------------------------------------------------------------------------