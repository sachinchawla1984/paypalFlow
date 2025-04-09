component output="false" displayname="Paypal payflow API CFC wrapper"  {

    public function init (endPointURL) {
        VARIABLES.partner 	  = "PayPal";
        VARIABLES.endPointURL = arguments.endPointURL;
        return this;
    }

    public array function createPayment(
        required string     user                    hint = "Paypal payflow account username",
        required string     pwd                     hint = "Paypal payflow account password",
        required string     vendor                  hint = "Paypal payflow account vendorID",
        required numeric    cardType                hint = "Credit card type",
        required numeric    acct                    hint = "Credit card number",
        required numeric    expMonth                hint = "Credit card expire month",
        required numeric    expYear                 hint = "Credit card expire year",
        required numeric    cvv                     hint = "Credit card security number",
        required numeric    amt                     hint = "Transaction amount",
                 string     currency  = "USD"       hint = "Transaction currency format",
                 string     firstName = ""          hint = "Card holder firstname",
                 string     lastName  = ""          hint = "Card holder lastname",
                 string     tender,
                 string     trxtype,
                 string     verbosity
    ) {
        try {
            arguments.partner = variables.partner;
            arguments.expdate = "#arguments.expMonth##arguments.expYear#";
            return apiCall(parameters = arguments);
        } catch(any e) {
            return listToArray("Something went wrong. Please try again later");
        }
    }

    public array function refund(
        required string  user       hint = "Paypal payflow account username",
        required string  pwd        hint = "Paypal payflow account password",
        required string  vendor     hint = "Paypal payflow account vendorID",
        required string  origid     hint = "Approved transactionID",
        required numeric amt        hint = "Refund amount",
        required string  tender,
                 string  trxtype
    ) {
        try {
            arguments.partner = variables.partner;
            return apiCall(parameters = arguments);
        } catch(any e) {
            return listToArray("Something went wrong. Please try again later");
        }
    }

    public array function recurringBilling(
        required string user         hint = "Paypal payflow account username",
        required string pwd          hint = "Paypal payflow account password",
        required string vendor     hint = "Paypal payflow account vendorID",    
        required string acct         hint = "Credit card number",
        required string payperiod    hint = "Specifies Payment Occurs",
        required string action       hint = "Add, Modify, Cancel, Reactivate, Inquiry",
        required string expMonth     hint = "Credit card expire month",
        required string expYear      hint = "Credit card expire year",
        required numeric cvv         hint = "Credit card security number",
        required string amt          hint = "Transaction amount",
        required string tender       hint = "Tender type",
                 string trxtype      hint = "Recurring profile request",
                 string profilename  hint = "User specified name",
                 string start        hint = "Recurring billing start date",
                 string term         hint = "Number of payments to be made over the life of the agreement",
                 string comment1     hint = "Payment comments",
                 string firstName = ""          hint = "Card holder firstname",
                 string lastName  = ""          hint = "Card holder lastname"              
    ) {
        try {
            arguments.partner = variables.partner;
            arguments.expdate = "#arguments.expMonth##arguments.expYear#";
            return apiCall(parameters = arguments);
        } catch(any e) {
            return listToArray("Something went wrong. Please try again later");
        }
    }

    public array function apiCall( struct parameters ) {
        var httpService = new http(url = VARIABLES.endPointURL, method = "POST");
        var encodeLists = "user,pwd,vendor,amt,billtofirstname,billtolastname";
        for (keys in parameters ) {
            if( listFindNoCase(encodeLists, keys )) {
                httpService.addParam( type = "formfield", name = keys, value = arguments.parameters[keys], encoded = false );
            } else {
                httpService.addParam( type = "formfield", name = keys, value = arguments.parameters[keys] );
            }
        };
        return listToArray(httpService.send().getPrefix().fileContent, "&" );

    }
}