class CreateJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :joins do |t|

      # Relations
      t.integer :team_id
      t.integer :event_id

      # Join information
      t.text :description
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
