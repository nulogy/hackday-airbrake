class CreateErrorTags < ActiveRecord::Migration
  def change
    create_table :error_tags do |t|
      t.references :error, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
