class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :server_id
      t.integer :service_id
      t.integer :service_server_id

      t.timestamps
    end
  end
end
