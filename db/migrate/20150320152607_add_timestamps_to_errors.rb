class AddTimestampsToErrors < ActiveRecord::Migration
  def change
    add_column :errors, :created_at, :datetime
    add_column :errors, :updated_at, :datetime
  end
end
