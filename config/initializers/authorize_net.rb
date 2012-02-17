module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    # For more information on the Authorize.Net Gateway please visit their {Integration Center}[http://developer.authorize.net/]
    #
    # The login and password are not the username and password you use to 
    # login to the Authorize.Net Merchant Interface. Instead, you will 
    # use the API Login ID as the login and Transaction Key as the 
    # password.
    # 
    # ==== How to Get Your API Login ID and Transaction Key
    #
    # 1. Log into the Merchant Interface
    # 2. Select Settings from the Main Menu
    # 3. Click on API Login ID and Transaction Key in the Security section
    # 4. Type in the answer to the secret question configured on setup
    # 5. Click Submit
    # 
    # ==== Automated Recurring Billing (ARB)
    # 
    # Automated Recurring Billing (ARB) is an optional service for submitting and managing recurring, or subscription-based, transactions.
    # 
    # To use recurring, update_recurring, and cancel_recurring ARB must be enabled for your account.
    # 
    # Information about ARB is available on the {Authorize.Net website}[http://www.authorize.net/solutions/merchantsolutions/merchantservices/automatedrecurringbilling/].
    # Information about the ARB API is available at the {Authorize.Net Integration Center}[http://developer.authorize.net/]
    class AuthorizeNetGateway < Gateway

      self.test_url = "https://secure.networkmerchants.com/gateway/transact.dll"
      self.live_url = "https://secure.networkmerchants.com/gateway/transact.dll"

      self.supported_countries = ['US']
      self.supported_cardtypes = [:visa, :master, :american_express, :discover, :diners_club, :jcb]
      self.homepage_url = 'www.none.com'
      self.display_name = 'Gateway Emulator '

    end
  end
end

if Preference.table_exists?
  Spree::Config.set(:auto_capture => true)
end
