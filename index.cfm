<!--- 
Filename: index.cfm
Description: This file has the form, on submission, form data is processed inside file paypalExpressCheckout.cfm
--->


<html>
<head>
<link href="https://www.readingheart.org/style.css" rel="stylesheet" type="text/css">
<link href="https://www.readingheart.org/css/shortcodes.css" rel="stylesheet" type="text/css">
<link href="https://www.readingheart.org/css/responsive.css" rel="stylesheet" type="text/css">
<link href="https://www.readingheart.org/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://www.readingheart.org/css/shortcodes.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.readingheart.org/css/layerslider.css" type="text/css">

<!-- Donation Page Files 
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/styles.css" />
<link rel="stylesheet" type="text/css" href="assets/css/select.css" />
 /Donation Page Files -->

<!--prettyPhoto-->
<link href="https://www.readingheart.org/css/prettyPhoto.css" rel="stylesheet" type="text/css" media="all" />   
<!--[if IE 7]>
<link href="css/font-awesome-ie7.css" rel="stylesheet" type="text/css">
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--Fonts-->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Bubblegum+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Bubblegum+Sans' rel='stylesheet' type='text/css'>
<!--jquery-->
<script src="https://www.readingheart.org/js/modernizr-2.6.2.min.js"></script>
	

<link rel="stylesheet" href="https://www.readingheart.org/css/jquery-ui.css">
<link rel="stylesheet" href="https://www.readingheart.org/font-awesome-4.7.0/css/font-awesome.css">    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://www.readingheart.org/js/jquery.validate.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://www.readingheart.org/css/payment.css">


</head>
<body class="main">
	<!--wrapper starts-->
    <div class="wrapper">

        <!---Main Container --->
        <div id="main">
            <div class="container">
            	<section id="primary" class="with-sidebar">    
                    <form name="submit_payment" id="submit_payment" action="paypalFlow.cfm" method="POST">
                    <div class="payment-container">
                        <div class="widget select-amount">
                            <div style="text-align: center;">
                            <h1>Donation</h1>
                            </div>
                            <h3 style="margin-top: 15px !important; margin-bottom: 10px !important;">I want to give</h3>
                            <input class="amount" type="radio" name="radio-1" id="radio-1" value="1000.00">
                            <label for="radio-1" class="donation-amount">$1000</label>  
                            <input class="amount" type="radio" name="radio-1" id="radio-2" value="500.00">
                            <label for="radio-2" class="donation-amount">$500</label>   
                            <input class="amount" type="radio" name="radio-1" id="radio-3" value="250.00">
                            <label for="radio-3" class="donation-amount">$250</label>   
                            <input class="amount" type="radio" name="radio-1" id="radio-4" value="100.00">
                            <label for="radio-4" class="donation-amount" >$100</label>   
                            <input class="amount" type="radio" name="radio-1" id="radio-5" value="50.00">
                            <label for="radio-5" class="donation-amount">$50</label>   
                            <input class="amount" type="radio" name="radio-1" id="radio-6" value="20.00" checked>
                            <label for="radio-6" class="donation-amount">$20</label>    
                            <div class="other-amount">
                            <input placeholder="Other Amount" name="other_amount" id="other_amount" class="other-amount-right" type="text" style="padding: 0; padding-left: 12px;">
                            </div>
                            <div style="margin-top: 8px;">
                                $10.00 is the minimum online donation. All donations are tax deductible. 
                            </div>
                        </div>
                        <div class="widget">
                            <h3 style="margin-top: 15px !important; margin-bottom: 10px !important;">Frequency</h3>
                            <div style="display: inline-block;">
                                <input class="frequency ui-checkboxradio ui-helper-hidden-accessible" type="radio" name="frequency" id="frequency-onetime" checked="true" value="OneTime">
                                <label for="frequency-onetime" class="ui-checkboxradio-label ui-corner-all ui-button ui-widget ui-checkboxradio-radio-label ui-checkboxradio-checked ui-state-active">One Time</label>
                                <input class="frequency ui-checkboxradio ui-helper-hidden-accessible" type="radio" name="frequency" id="frequency-monthly" value="Month">
                                <label for="frequency-monthly" class="ui-checkboxradio-label ui-corner-all ui-button ui-widget ui-checkboxradio-radio-label">Monthly</label>
                                <input class="frequency ui-checkboxradio ui-helper-hidden-accessible" type="radio" name="frequency" id="frequency-quarterly" value="Quarterly">
                                <label for="frequency-quarterly" class="ui-checkboxradio-label ui-corner-all ui-button ui-widget ui-checkboxradio-radio-label">Quarterly</label>
                                <input class="frequency ui-checkboxradio ui-helper-hidden-accessible" type="radio" name="frequency" id="frequency-biannual" value="biannual">
                                <label for="frequency-biannual" class="ui-checkboxradio-label ui-corner-all ui-button ui-widget ui-checkboxradio-radio-label">Bi-annual</label>
                                <label style="clear: both; margin-top: 20px; cursor: pointer;" class="dedicated-label">
                                <input class="isDedicated" name="isDedicated" id="isDedicated" type="checkbox">
                                <span class="dedication-label">
                                <span class="ng-binding label-text">Dedicate this gift to a friend or loved one</span>
                                </span>
                                </label>
                            </div>
                        </div>
                        <div style="text-align: center;">
                            <h1>Payment Details</h1>
                        </div>
                        <div style="display: inline-block;" class="payment-options-div">
                            <div class="credit-card-button disabled-button payment-button" style="float: left; display: block;">
                                <span><img src="https://www.readingheart.org/images/rco-ui-donation-credit-cards-hires.png"></span>
                                <span class="span-text">Credit Card</span>
                            </div>
                        </div>
                        <div class="credit-card-div" style="display: inline;">
                            <div class="personal-info">
                                <div class="div-heading">
                                <span><i class="fa fa-user" aria-hidden="true"></i></span>
                                <span class="card-header-title">Personal Information</span>
                                </div>
                                <div class="div-content">
                                <div class="form-input-div">
                                    <label>First Name</label>
                                    <div><input name="first_name" id="first_name" type="text" class="requiredFirstName" placeholder="First Name"></div>
                                </div>
                                <div class="form-input-div">
                                    <label>Last Name</label>
                                    <div><input name="last_name" id="last_name" type="text" class="requiredLastName" placeholder="Last Name"></div>
                                </div>
                                <div class="form-input-div" style="margin-top: 20px;">
                                    <label>Email Address</label>
                                    <div><input name="email_address" id="email_address" type="text" class="requiredEmail email" placeholder="Email"></div>
                                </div>
                                </div>
                            </div>
                            <div class="card-info">
                                <div class="div-heading">
                                <span><i class="fa fa-credit-card"></i></span>
                                <span class="card-header-title">Card Information</span>
                                </div>
                                <div class="card-number">
                                <span>
                                <label>Card Number</label>
                                <input name="card_number" id="card_number" type="text" class="requiredCardNumber" placeholder="Card Number">
                                </span>
                                <span>
                                <label>&nbsp;</label>
                                <img src="https://www.readingheart.org/images/rco-ui-cc-mastercard.png">
                                </span>
                                </div>
                                <div class="card-month-year-cvv">
                                <span>
                                    <span class="card-part" style="margin-right: 12%;">
                                        <label>Month</label>
                                        <select class="requiredCardMonth" name="card_month" id="card_month">
                                            <option value=""  label=""></option>
                                            <option value="01" selected="selected"  label="01">01</option>
                                            <option value="02" label="2">02</option>
                                            <option value="03" label="3">03</option>
                                            <option value="04" label="4">04</option>
                                            <option value="05" label="5">05</option>
                                            <option value="06" label="6">06</option>
                                            <option value="07" label="7">07</option>
                                            <option value="08" label="8">08</option>
                                            <option value="09" label="9">09</option>
                                            <option value="10" label="10">10</option>
                                            <option value="11" label="11">11</option>
                                            <option value="12" label="12">12</option>
                                        </select>
                                    </span>
                                    <span class="card-part" style="margin-right: 12%;">
                                        <label>Year</label>
                                        <select class="requiredCardYear" name="card_year" id="card_year">
                                            <option value="00" selected="selected"  label="Select">Select</option>
                                            <option value="23" label="23">23 </option>
                                            <option value="24" label="24">24 </option>
                                            <option value="25" label="25">25 </option>
                                            <option value="26" label="26">26 </option>
                                            <option value="27" label="27">27 </option>
                                            <option value="28" label="28">28 </option>
                                            <option value="29" label="29">29 </option>
                                            <option value="30" label="30">30 </option>
                                            <option value="31" label="31">31 </option>
                                            <option value="32" label="32">32 </option>
                                            <option value="33" label="33">33 </option>
                                        </select>
                                    </span>
                                    <span class="card-part">
                                    <label>CVV</label>
                                    <input class="card-cvv requiredCardCVV" name="card_cvv" id="card_cvv" type="text" placeholder="Card Code">
                                    </span>
                                    <span class="cvv-img">
                                    <label>&nbsp;</label>
                                    <img src="https://www.readingheart.org/images/rco-ui-cc-cvv.png">
                                    </span>
                                </span>
                                </div>
                            </div>
                            <div class="card-info billing-info">
                                <div class="div-heading">
                                <span><i class="fa fa-home"></i></span>
                                <span class="card-header-title">Billing Information</span>
                                </div>
                                <div class="card-number">
                                <span>
                                <label>Address</label>
                                <input name="address_line1" id="address_line1" type="text" placeholder="Address">
                                </span>
                                <span>
                                <label>Address Line 2</label>
                                <input name="address_line2" id="address_line2" type="text" placeholder="Address 2">
                                </span>
                                <span style="margin-top: 20px; width: 46%;" class="billing-country">
                                    <label>Country</label>
                                    <select name="billing_country" id="billing_country">
                                        <option value="0" label="Albania">Albania</option>
                                        <option value="1" label="Algeria">Algeria</option>
                                        <option value="2" label="Andorra">Andorra</option>
                                        <option value="3" label="Angola">Angola</option>
                                        <option value="4" label="Anguilla">Anguilla</option>
                                        <option value="5" label="Antigua and Barbuda">Antigua and Barbuda</option>
                                        <option value="6" label="Argentina">Argentina</option>
                                        <option value="7" label="Armenia">Armenia</option>
                                        <option value="8" label="Aruba">Aruba</option>
                                        <option value="9" label="Australia">Australia</option>
                                        <option value="10" label="Austria">Austria</option>
                                        <option value="11" label="Azerbaijan">Azerbaijan</option>
                                        <option value="12" label="Bahamas, The">Bahamas, The</option>
                                        <option value="13" label="Bahrain">Bahrain</option>
                                        <option value="14" label="Bangladesh">Bangladesh</option>
                                        <option value="15" label="Barbados">Barbados</option>
                                        <option value="16" label="Belgium">Belgium</option>
                                        <option value="17" label="Belize">Belize</option>
                                        <option value="18" label="Benin">Benin</option>
                                        <option value="19" label="Bermuda">Bermuda</option>
                                        <option value="20" label="Bhutan">Bhutan</option>
                                        <option value="21" label="Bolivia">Bolivia</option>
                                        <option value="22" label="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                        <option value="23" label="Botswana">Botswana</option>
                                        <option value="24" label="Bouvet Island">Bouvet Island</option>
                                        <option value="25" label="Brazil">Brazil</option>
                                        <option value="26" label="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                        <option value="27" label="British Virgin Islands">British Virgin Islands</option>
                                        <option value="28" label="Brunei">Brunei</option>
                                        <option value="29" label="Burkina Faso">Burkina Faso</option>
                                        <option value="30" label="Burundi">Burundi</option>
                                        <option value="31" label="Cambodia">Cambodia</option>
                                        <option value="32" label="Cameroon">Cameroon</option>
                                        <option value="33" label="Canada">Canada</option>
                                        <option value="34" label="Cape Verde">Cape Verde</option>
                                        <option value="35" label="Cayman Islands">Cayman Islands</option>
                                        <option value="36" label="Chile">Chile</option>
                                        <option value="37" label="China, People's Republic of">China, People's Republic of</option>
                                        <option value="38" label="China, Republic of (Taiwan)">China, Republic of (Taiwan)</option>
                                        <option value="39" label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                        <option value="40" label="Colombia">Colombia</option>
                                        <option value="41" label="Comoros">Comoros</option>
                                        <option value="42" label="Cook Islands">Cook Islands</option>
                                        <option value="43" label="Costa Rica">Costa Rica</option>
                                        <option value="44" label="Cyprus">Cyprus</option>
                                        <option value="45" label="Czech Republic">Czech Republic</option>
                                        <option value="46" label="Denmark">Denmark</option>
                                        <option value="47" label="Djibouti">Djibouti</option>
                                        <option value="48" label="Dominica">Dominica</option>
                                        <option value="49" label="Dominican Republic">Dominican Republic</option>
                                        <option value="50" label="Ecuador">Ecuador</option>
                                        <option value="51" label="El Salvador">El Salvador</option>
                                        <option value="52" label="Equatorial Guinea">Equatorial Guinea</option>
                                        <option value="53" label="Eritrea">Eritrea</option>
                                        <option value="54" label="Ethiopia">Ethiopia</option>
                                        <option value="55" label="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option>
                                        <option value="56" label="Faroe Islands">Faroe Islands</option>
                                        <option value="57" label="Fiji">Fiji</option>
                                        <option value="58" label="Finland">Finland</option>
                                        <option value="59" label="France">France</option>
                                        <option value="60" label="French Guiana">French Guiana</option>
                                        <option value="61" label="French Polynesia">French Polynesia</option>
                                        <option value="62" label="Gabon">Gabon</option>
                                        <option value="63" label="Gambia, The">Gambia, The</option>
                                        <option value="64" label="Georgia">Georgia</option>
                                        <option value="65" label="Germany">Germany</option>
                                        <option value="66" label="Gibraltar">Gibraltar</option>
                                        <option value="67" label="Greece">Greece</option>
                                        <option value="68" label="Greenland">Greenland</option>
                                        <option value="69" label="Grenada">Grenada</option>
                                        <option value="70" label="Guadeloupe">Guadeloupe</option>
                                        <option value="71" label="Guatemala">Guatemala</option>
                                        <option value="72" label="Guinea">Guinea</option>
                                        <option value="73" label="Guinea-Bissau">Guinea-Bissau</option>
                                        <option value="74" label="Guyana">Guyana</option>
                                        <option value="75" label="Haiti">Haiti</option>
                                        <option value="76" label="Honduras">Honduras</option>
                                        <option value="77" label="Hong Kong">Hong Kong</option>
                                        <option value="78" label="Hungary">Hungary</option>
                                        <option value="79" label="Iceland">Iceland</option>
                                        <option value="80" label="India">India</option>
                                        <option value="81" label="Ireland">Ireland</option>
                                        <option value="82" label="Isle of Man">Isle of Man</option>
                                        <option value="83" label="Israel">Israel</option>
                                        <option value="84" label="Italy">Italy</option>
                                        <option value="85" label="Jamaica">Jamaica</option>
                                        <option value="86" label="Japan">Japan</option>
                                        <option value="87" label="Jordan">Jordan</option>
                                        <option value="88" label="Kazakhstan">Kazakhstan</option>
                                        <option value="89" label="Kenya">Kenya</option>
                                        <option value="90" label="Kiribati">Kiribati</option>
                                        <option value="91" label="Korea, South">Korea, South</option>
                                        <option value="92" label="Kuwait">Kuwait</option>
                                        <option value="93" label="Kyrgyzstan">Kyrgyzstan</option>
                                        <option value="94" label="Laos">Laos</option>
                                        <option value="95" label="Lesotho">Lesotho</option>
                                        <option value="96" label="Liechtenstein">Liechtenstein</option>
                                        <option value="97" label="Luxembourg">Luxembourg</option>
                                        <option value="98" label="Macau">Macau</option>
                                        <option value="99" label="Madagascar">Madagascar</option>
                                        <option value="100" label="Malawi">Malawi</option>
                                        <option value="101" label="Maldives">Maldives</option>
                                        <option value="102" label="Mali">Mali</option>
                                        <option value="103" label="Malta">Malta</option>
                                        <option value="104" label="Martinique">Martinique</option>
                                        <option value="105" label="Mauritania">Mauritania</option>
                                        <option value="106" label="Mauritius">Mauritius</option>
                                        <option value="107" label="Mexico">Mexico</option>
                                        <option value="108" label="Micronesia">Micronesia</option>
                                        <option value="109" label="Moldova">Moldova</option>
                                        <option value="110" label="Monaco">Monaco</option>
                                        <option value="111" label="Mongolia">Mongolia</option>
                                        <option value="112" label="Montserrat">Montserrat</option>
                                        <option value="113" label="Morocco">Morocco</option>
                                        <option value="114" label="Mozambique">Mozambique</option>
                                        <option value="115" label="Namibia">Namibia</option>
                                        <option value="116" label="Nauru">Nauru</option>
                                        <option value="117" label="Nepal">Nepal</option>
                                        <option value="118" label="Netherlands">Netherlands</option>
                                        <option value="119" label="Netherlands Antilles">Netherlands Antilles</option>
                                        <option value="120" label="New Caledonia">New Caledonia</option>
                                        <option value="121" label="New Zealand">New Zealand</option>
                                        <option value="122" label="Nicaragua">Nicaragua</option>
                                        <option value="123" label="Niger">Niger</option>
                                        <option value="124" label="Niue">Niue</option>
                                        <option value="125" label="Norfolk Island">Norfolk Island</option>
                                        <option value="126" label="Norway">Norway</option>
                                        <option value="127" label="Oman">Oman</option>
                                        <option value="128" label="Panama">Panama</option>
                                        <option value="129" label="Papua New Guinea">Papua New Guinea</option>
                                        <option value="130" label="Paraguay">Paraguay</option>
                                        <option value="131" label="Peru">Peru</option>
                                        <option value="132" label="Philippines">Philippines</option>
                                        <option value="133" label="Pitcairn Islands">Pitcairn Islands</option>
                                        <option value="134" label="Poland">Poland</option>
                                        <option value="135" label="Portugal">Portugal</option>
                                        <option value="136" label="Qatar">Qatar</option>
                                        <option value="137" label="Reunion">Reunion</option>
                                        <option value="138" label="Rwanda">Rwanda</option>
                                        <option value="139" label="Saint Helena">Saint Helena</option>
                                        <option value="140" label="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                        <option value="141" label="Saint Lucia">Saint Lucia</option>
                                        <option value="142" label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                        <option value="143" label="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                        <option value="144" label="Samoa">Samoa</option>
                                        <option value="145" label="San Marino">San Marino</option>
                                        <option value="146" label="Sao Tome and Principe">Sao Tome and Principe</option>
                                        <option value="147" label="Saudi Arabia">Saudi Arabia</option>
                                        <option value="148" label="Senegal">Senegal</option>
                                        <option value="149" label="Serbia">Serbia</option>
                                        <option value="150" label="Seychelles">Seychelles</option>
                                        <option value="151" label="Sierra Leone">Sierra Leone</option>
                                        <option value="152" label="Slovenia">Slovenia</option>
                                        <option value="153" label="Solomon Islands">Solomon Islands</option>
                                        <option value="154" label="South Africa">South Africa</option>
                                        <option value="155" label="Spain">Spain</option>
                                        <option value="156" label="Sri Lanka">Sri Lanka</option>
                                        <option value="157" label="Suriname">Suriname</option>
                                        <option value="158" label="Swaziland">Swaziland</option>
                                        <option value="159" label="Sweden">Sweden</option>
                                        <option value="160" label="Switzerland">Switzerland</option>
                                        <option value="161" label="Tajikistan">Tajikistan</option>
                                        <option value="162" label="Tanzania">Tanzania</option>
                                        <option value="163" label="Thailand">Thailand</option>
                                        <option value="164" label="Timor-Leste (East Timor)">Timor-Leste (East Timor)</option>
                                        <option value="165" label="Togo">Togo</option>
                                        <option value="166" label="Tonga">Tonga</option>
                                        <option value="167" label="Trinidad and Tobago">Trinidad and Tobago</option>
                                        <option value="168" label="Tunisia">Tunisia</option>
                                        <option value="169" label="Turkey">Turkey</option>
                                        <option value="170" label="Turkmenistan">Turkmenistan</option>
                                        <option value="171" label="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                        <option value="172" label="Tuvalu">Tuvalu</option>
                                        <option value="173" label="United Arab Emirates">United Arab Emirates</option>
                                        <option value="174" label="United Kingdom">United Kingdom</option>
                                        <option value="175" selected="selected" label="United States">United States</option>
                                        <option value="176" label="Uruguay">Uruguay</option>
                                        <option value="177" label="Vanuatu">Vanuatu</option>
                                        <option value="178" label="Vatican City">Vatican City</option>
                                        <option value="179" label="Venezuela">Venezuela</option>
                                        <option value="180" label="Zambia">Zambia</option>
                                    </select>
                                </span>
                                </div>
                                <div class="card-month-year-cvv">
                                <span>
                                <label>City</label>
                                <input class="billing-city" name="address_city" id="address_city" type="text" placeholder="City">
                                </span>
                                <span>
                                    <span class="billing-part" style="width: 40% !important; margin-right: 20% !important;">
                                        <label>State</label>
                                        <select name="billing_state" id="billing_state">
                                            <option value=""></option>
                                            <option value="AL">Alabama</option>
                                            <option value="AK">Alaska</option>
                                            <option value="AZ">Arizona</option>
                                            <option value="AR">Arkansas</option>
                                            <option selected="selected" value="CA">California</option>
                                            <option value="CO">Colorado</option>
                                            <option value="CT">Connecticut</option>
                                            <option value="DE">Delaware</option>
                                            <option value="DC">District Of Columbia</option>
                                            <option value="FL">Florida</option>
                                            <option value="GA">Georgia</option>
                                            <option value="HI">Hawaii</option>
                                            <option value="ID">Idaho</option>
                                            <option value="IL">Illinois</option>
                                            <option value="IN">Indiana</option>
                                            <option value="IA">Iowa</option>
                                            <option value="KS">Kansas</option>
                                            <option value="KY">Kentucky</option>
                                            <option value="LA">Louisiana</option>
                                            <option value="ME">Maine</option>
                                            <option value="MD">Maryland</option>
                                            <option value="MA">Massachusetts</option>
                                            <option value="MI">Michigan</option>
                                            <option value="MN">Minnesota</option>
                                            <option value="MS">Mississippi</option>
                                            <option value="MO">Missouri</option>
                                            <option value="MT">Montana</option>
                                            <option value="NE">Nebraska</option>
                                            <option value="NV">Nevada</option>
                                            <option value="NH">New Hampshire</option>
                                            <option value="NJ">New Jersey</option>
                                            <option value="NM">New Mexico</option>
                                            <option value="NY">New York</option>
                                            <option value="NC">North Carolina</option>
                                            <option value="ND">North Dakota</option>
                                            <option value="OH">Ohio</option>
                                            <option value="OK">Oklahoma</option>
                                            <option value="OR">Oregon</option>
                                            <option value="PA">Pennsylvania</option>
                                            <option value="RI">Rhode Island</option>
                                            <option value="SC">South Carolina</option>
                                            <option value="SD">South Dakota</option>
                                            <option value="TN">Tennessee</option>
                                            <option value="TX">Texas</option>
                                            <option value="UT">Utah</option>
                                            <option value="VT">Vermont</option>
                                            <option value="VA">Virginia</option>
                                            <option value="WA">Washington</option>
                                            <option value="WV">West Virginia</option>
                                            <option value="WI">Wisconsin</option>
                                            <option value="WY">Wyoming</option>
                                        </select>
                                    </span>
                                    <span class="billing-part" style="width: 40% !important;">
                                    <label>Postal Code</label>
                                    <input name="address_postcode" id="address_postcode" type="text" placeholder="Zip Code">
                                    </span>
                                </span>
                                </div>
                            </div>
                            <div class="card-info billing-info" style="display: block;">
                                <div class="payment-submit-cc ng-scope" style="float: left;">
                                <a onclick="document.getElementById('submit_payment').submit();" class="btn btn-primary donate-botton">Donate $50.00 </a>
                                <!--              <input value="Donate $50.00" type="Submit">-->
                                </div>
                                <div class="org-logo" style="float: right; display: inline-block;">
                                <img src="https://www.readingheart.org/images/rapidssl-logo.png">
                                </div>
                                <div class="verify-information" style="display: block; color: #6d6e70;font-style: italic;font-size: 13px;padding-top: 0px;line-height: 20px; width: 50%; clear: both;">
                                Please verify that your information is correct, then click DONATE to make your gift. Your tax receipt will be provided on the next page.
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
               </section>
 
                </section>   
                </section>
                <!--primary ends-->
            </div>   
        </div>
</body>
</html>
