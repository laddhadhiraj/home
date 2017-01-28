class CreateIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :integrations do |t|
      t.references :user, foreign_key: true
      t.string :software_type
      t.string :software_username
      t.string :software_api_key

      t.timestamps
    end
  end
end
