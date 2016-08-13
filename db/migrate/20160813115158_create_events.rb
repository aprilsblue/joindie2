class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.text :event_place
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :event_date
      t.integer :rental_fee

      t.integer :team_id

      t.timestamps
    end
  end
end
