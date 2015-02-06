class AddErrorTypeToError < ActiveRecord::Migration
  def change
    add_column :errors, :error_type, :string
  end
end
