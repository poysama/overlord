class AddDescriptionToServer < ActiveRecord::Migration
  def change
    add_column :servers, :description, :text
  end
end
