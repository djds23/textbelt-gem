require 'bundler/setup'
Bundler.setup

require 'textbelt'
require 'webmock/rspec'

def invalid_phone_body
  '{ "success": false, "message": "Invalid phone number."}'
end

def success_body
  '{ "success": true }'
end


def blacklist_hash
  { "success" => false, "message" => 'Sorry, texts to this number are disabled.'}
end

def gateway_hash
  { "success" => false, "message" => 'Communication with SMS gateway failed.'}
end

def invalid_phone_quota_hash
  { "success" => false, "message" => 'Could not validate phone# quota.'}
end

def invalid_ip_quota_hash
  { "success" => false, "message" => 'Could not validate IP quota.'}
end

def phone_quota_exceeded_hash
  { "success" => false, "message" => 'Exceeded quota for this phone number.'}
end

def ip_quota_exceeded_hash
  { "success" => false, "message" => 'Exceeded quota for this IP address.'}
end
