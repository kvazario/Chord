class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :talking_points
      t.integer :times_met
      t.string :title
      t.boolean :boothie
      t.string :office_location
      t.integer :company_id

      t.timestamps

    end
  end
end
