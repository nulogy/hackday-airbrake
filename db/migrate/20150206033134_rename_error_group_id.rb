class RenameErrorGroupId < ActiveRecord::Migration
  def change
    remove_column :errors, :group_id, :integer
    add_column :errors, :airbrake_id, :string
  end
end
