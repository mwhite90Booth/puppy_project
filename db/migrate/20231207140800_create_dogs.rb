class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.string :breed
      t.text :home_address
      t.datetime :date_of_birth
      t.string :vet_name
      t.text :vet_address
      t.string :vet_phone
      t.text :food_brand
      t.text :food_instructions
      t.string :chip_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
