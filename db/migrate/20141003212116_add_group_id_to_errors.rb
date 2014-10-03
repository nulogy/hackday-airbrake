class AddGroupIdToErrors < ActiveRecord::Migration
  def change
    add_column :errors, :group_id, :integer
    add_column :errors, :action, :string
    add_column :errors, :environment, :string
    add_column :errors, :group_xml, :text
  end
end
