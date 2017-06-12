class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.integer :person_id
      t.integer :event_id
      t.boolean :thankyouletter_sent
      t.integer :user_id

      t.timestamps

    end
  end
end
