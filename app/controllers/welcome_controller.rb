class WelcomeController < ApplicationController

  def index
  end

  def download_full_directory
    @directory_yaml = DIRECTORY_YAML
    client = Savon::Client.new WSDL
    # :get_post_office_basic_info,
    # :get_full_directory_list,
    # :get_pkcs12,
    # :get_root_cert

    #response = client.get_post_office_basic_info { |soap| puts soap.body.inspect }
    #response = client.get_pkcs12 { |soap| p soap.body.inspect }
    #response = client.get_root_cert { |soap| p soap.body.inspect }

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

end
