class CreateJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :joins do |t|

      t.text :team_name
      t.text :genre
      t.text :team_phonenumber
      t.integer :team_member_number
      t.integer :team_id
      t.integer :event_id
      
      


      t.timestamps
    end
  end
end
