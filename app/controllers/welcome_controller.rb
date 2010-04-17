class WelcomeController < ApplicationController

  def index
  end

  def download_full_directory
    @directory_yaml = DIRECTORY_YAML
    client = Savon::Client.new WSDL
    response = client.get_full_directory_list
    hash = response.to_hash
    entries = hash[:get_full_directory_list_result][:directory][:directory_entry]
    @contacts = []
    entries.each do |entry|
      @contacts << Contact.new(entry)
    end
    File.open(@directory_yaml, 'w') do |f|
      f.puts @contacts.to_yaml
    end
  end

  def get_root_certificate
    @base64_root_certificate_file = BASE64_ROOT_CERTIFICATE_FILE
    client = Savon::Client.new WSDL
    soap_action = "<getRootCert xmlns='http://tempuri.org/'><storeLocationName>rdisig</storeLocationName></getRootCert>"
    response = client.get_root_cert do |soap|
      soap.xml = "<s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>#{soap_action}</s:Body></s:Envelope>"
    end
    hash = response.to_hash
    File.open(@base64_root_certificate_file, 'w') do |f|
      f.puts hash[:get_root_cert_response][:get_root_cert_result]
    end
  end
end

    # :get_post_office_basic_info,
    # :get_full_directory_list,
    # :get_pkcs12,
    # :get_root_cert

    #response = client.get_post_office_basic_info { |soap| puts soap.body.inspect }
    #response = client.get_pkcs12 { |soap| p soap.body.inspect }
    #response = client.get_root_cert { |soap| p soap.body.inspect }

