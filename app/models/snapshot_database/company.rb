class SnapshotDatabase::Company < ActiveRecord::Base
  establish_connection 'snapshot_database'
end