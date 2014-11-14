class CreateTaskforces < ActiveRecord::Migration
  def change
    create_table :taskforces do |t|
      t.string :name

      t.timestamps
    end
  end
end
