class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :remote_id
      t.string :npi
      t.text :enckey
      t.text :signkey
      t.string :email_contact
      t.string :email_as1
      t.string :created_by
      t.string :mb_duns
      t.string :organization
      t.string :name
      t.string :date_created

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
