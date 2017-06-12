class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_location
      t.date :date
      t.integer :company_id

      t.timestamps

    end
  end
end
