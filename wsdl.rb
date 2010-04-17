require 'rubygems'
require 'app/models/contact'
require 'crack/xml'
require 'pp'
require 'savon'

wsdl = "http://www.exaltconsultinggroup.com/directory/SesService.asmx?WSDL"

Savon::Request.log = false
client = Savon::Client.new wsdl
#p client.wsdl.soap_actions

# :get_post_office_basic_info,
# :get_full_directory_list,
# :get_pkcs12,
# :get_root_cert

#response = client.get_post_office_basic_info { |soap| puts soap.body.inspect }
#response = client.get_pkcs12 { |soap| p soap.body.inspect }

get_root_cert = true
if get_root_cert
  soap_action = "<getRootCert xmlns='http://tempuri.org/'><storeLocationName>rdisig</storeLocationName></getRootCert>"
  response = client.get_root_cert do |soap|
    soap.xml = "<s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>#{soap_action}</s:Body></s:Envelope>"
  end
  hash = response.to_hash
  p hash[:get_root_cert_response][:get_root_cert_result]
end

get_pkcs12 = false
if get_pkcs12
  soap_action = "<getPKCS12 xmlns='http://tempuri.org/'><distinguishedName>Exalt Consulting Group</distinguishedName><storeLocationName>rdisig</storeLocationName></getPKCS12>"
  response = client.get_pkcs12 do |soap|
    soap.xml = "<s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>#{soap_action}</s:Body></s:Envelope>"
  end
  hash = response.to_hash
end
#     <distinguishedName>string</distinguishedName>
#      <storeLocationName>string</storeLocationName>#end

directory = false
if directory
  response = client.get_full_directory_list
  hash = response.to_hash
  entries = hash[:get_full_directory_list_result][:directory][:directory_entry]
  entries.each do |entry|
    p '--------------------------------'
    p entry
  end
end
