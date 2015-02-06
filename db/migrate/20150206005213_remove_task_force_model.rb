class RemoveTaskForceModel < ActiveRecord::Migration
  def up
    drop_table :taskforces
  end

  def down
    create_table :taskforces do |t|
      t.string :name

      t.timestamps
    end
  end
end
