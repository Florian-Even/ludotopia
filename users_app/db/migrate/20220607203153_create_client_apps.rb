class CreateClientApps < ActiveRecord::Migration[7.0]
  def change
    create_table :client_apps do |t|
      t.string :app_name, null: false
      t.uuid :client_id, null: false
      t.string :redirect_uri, null: false

      t.timestamps
    end

    add_index :client_apps, :client_id, unique: true
  end
end
