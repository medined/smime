require 'rubygems'
require 'app/models/contact'
require 'crack/xml'
require 'pp'
require 'savon'

Savon::Request.log = false
client = Savon::Client.new "http://www.exaltconsultinggroup.com/directory/SesService.asmx?WSDL"
#p client.wsdl.soap_actions

# :get_post_office_basic_info,
# :get_full_directory_list,
# :get_pkcs12,
# :get_root_cert

#response = client.get_post_office_basic_info { |soap| puts soap.body.inspect }
#response = client.get_pkcs12 { |soap| p soap.body.inspect }
#response = client.get_root_cert { |soap| p soap.body.inspect }

response = client.get_full_directory_list
#parsed = Crack::XML.parse(response)
hash = response.to_hash
entries = hash[:get_full_directory_list_result][:directory][:directory_entry]

contacts = []
entries.each do |entry|
  contacts << Contact.new(entry)
end
p contacts.to_yaml

File.open('db/directory.yml', 'w') do |f|
  f.puts contacts.to_yaml
end
