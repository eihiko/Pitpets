class AddPetToContender < ActiveRecord::Migration
  def change
    change_table(:contenders) { |t| t.references :pet }
  end
end
