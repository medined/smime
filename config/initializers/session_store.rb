# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_smime_session',
  :secret      => '14afb4a85037bc7f0d971c72aeff870c728e8b9e40d2b805c01c3c22102a439b257ada624d63c12e364cc69ebf9d7d84b7f60afe98e97c64859e0c132c918072'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
