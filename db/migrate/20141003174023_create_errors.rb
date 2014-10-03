class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.integer :user_id
      t.text :error_message
      t.integer :site_id
      t.integer :account_id
      t.integer :company_id
      t.text :site_name
      t.text :account_name
      t.text :company_name
      t.text :username
    end
  end
end
