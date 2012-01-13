class CreateServerappinfos < ActiveRecord::Migration
  def change
    create_table :serverappinfos do |t|
      t.string :name
      t.integer :server_id
      t.integer :app_id

      t.timestamps
    end
  end
end
