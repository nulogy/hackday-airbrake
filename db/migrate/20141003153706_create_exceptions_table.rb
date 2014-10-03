class CreateExceptionsTable < ActiveRecord::Migration
  def change
    create_table :airbrake_exceptions do |t|
      t.text :xml_result
    end
  end
end
