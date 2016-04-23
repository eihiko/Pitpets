class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :pet
      t.references :status_type
    end
  end
end
