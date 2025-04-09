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
