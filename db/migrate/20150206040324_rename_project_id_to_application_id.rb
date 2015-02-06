class RenameProjectIdToApplicationId < ActiveRecord::Migration
  def change
    rename_column :errors, :project_id, :application_id
  end
end
