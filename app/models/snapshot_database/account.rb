class SnapshotDatabase::Account < ActiveRecord::Base
  establish_connection 'snapshot_database'
end