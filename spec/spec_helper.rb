require 'bundler/setup'
Bundler.setup

require 'textbelt'
require 'webmock/rspec'

def failure_body
  '{ "success": false, "message": "Invalid phone number."}'
end

def success_body
  '{ "success": true }'
end

