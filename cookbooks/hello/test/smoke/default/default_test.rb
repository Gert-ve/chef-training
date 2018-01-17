# # encoding: utf-8

# Inspec test for recipe hello::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe group('nginx') do
  it { should exist }
end

describe user('nginx') do
  it { should exist }
end

describe file('/var/www/index.html') do
  it { should exist }
end

describe port(80), :skip do
  it { should_not be_listening }
end

describe http('http://192.168.33.33:8080') do
  its('status') { should eq 200 }
  its('body') { should include 'Hello' }
end
