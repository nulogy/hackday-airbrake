class CreateApplicationsTable < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.integer :airbrake_id

      t.timestamps
    end

    add_column :errors, :project_id, :integer
  end
end
