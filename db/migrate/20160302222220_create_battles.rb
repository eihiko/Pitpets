class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.boolean :accepted, default: nil
      t.boolean :started, default: false
      t.boolean :finished, default: false
      t.boolean :won, default: nil
    end
  end
end
