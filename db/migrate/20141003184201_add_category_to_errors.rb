class AddCategoryToErrors < ActiveRecord::Migration
  def change
    add_column :errors, :category, :text
  end
end
