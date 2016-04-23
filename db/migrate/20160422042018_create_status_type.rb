class CreateStatusType < ActiveRecord::Migration
  def change
    create_table :status_types do |t|
      t.string :name
    end
  end
end
