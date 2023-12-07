class CreateVaccinations < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccinations do |t|
      t.integer :dog_id
      t.string :vaccintation_name
      t.datetime :given_date
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
