class CreateServerserviceinfos < ActiveRecord::Migration
  def change
    create_table :serverserviceinfos do |t|
      t.integer :server_id
      t.integer :service_id

      t.timestamps
    end
  end
end
