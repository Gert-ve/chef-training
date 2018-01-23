# # encoding: utf-8

# Inspec test for recipe hello::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.

# Check to see if file exist
describe file('/var/www/html/index.html') do
  it { should exist }
end

# Check if port is listening
describe port(80), :skip do
  it { should_not be_listening }
end

# Test page
describe http('http://192.168.33.33:80') do
  its('status') { should eq 200 }
  its('body') { should include 'Hello World' }
end
