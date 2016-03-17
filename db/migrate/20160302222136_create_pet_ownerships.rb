class CreatePetOwnerships < ActiveRecord::Migration
  def change
    create_table :pet_ownerships
    add_foreign_key :pet_ownerships, :users
    add_foreign_key :pet_ownerships, :pets
  end
end 
