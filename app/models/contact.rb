class Contact
  attr_accessor :remote_id
  attr_accessor :npi            # the national provider ID used in healthcare
  attr_accessor :enckey         # encryption public key
  attr_accessor :signkey        # signing public key
  attr_accessor :email_contact
  attr_accessor :email_as1      # email for secure (AS1 S/MIME)
  attr_accessor :created_by
  attr_accessor :mb_duns
  attr_accessor :organization
  attr_accessor :name
  attr_accessor :date_created

  def initialize(hash)
    @remote_id = hash[:id]
    @npi = hash[:npi]
    @enckey = hash[:enckey]
    @signkey = hash[:signkey]
    @email_contact = hash[:email_contact]
    @email_as1 = hash[:email_as1]
    @created_by = hash[:created_by]
    @mb_duns = hash[:mb_duns]
    @organization = hash[:organization]
    @name = hash[:name]
    @date_created = hash[:date_created]
  end

end
