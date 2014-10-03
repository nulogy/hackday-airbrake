class AddControllerToErrors < ActiveRecord::Migration
  def change
    add_column :errors, :controller, :text
  end
end
