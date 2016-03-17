class CreateOwnerTypes < ActiveRecord::Migration
  def change
    create_table :owner_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
