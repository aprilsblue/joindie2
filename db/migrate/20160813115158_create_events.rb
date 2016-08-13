class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      # Relations
      t.integer :team_id

      # Event information
      t.string :place
      t.string :poster
      t.datetime :showtime
      t.integer :rental_fee

      t.timestamps
    end
  end
end
