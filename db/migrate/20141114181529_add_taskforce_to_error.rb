class AddTaskforceToError < ActiveRecord::Migration
  def up
    add_column :errors, :taskforce_id, :integer
  end

  def down
    remove_column :errors, :taskforce_id
  end
end
