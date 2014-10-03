class SnapshotDatabase::User < ActiveRecord::Base
  establish_connection 'snapshot_database'
end