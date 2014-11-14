class SeedTaskforces < ActiveRecord::Migration
  def change
    Taskforce.create! :name => "TF1"
    Taskforce.create! :name => "TF2"
    Taskforce.create! :name => "TF3"
    Taskforce.create! :name => "App Support"
  end
end
