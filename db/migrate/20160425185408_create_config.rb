class CreateConfig < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.integer :wage, null: false, default: 725
    end
  end
end
