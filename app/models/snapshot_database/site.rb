class SnapshotDatabase::Site < ActiveRecord::Base
  establish_connection 'snapshot_database'
end