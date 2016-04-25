class CreateGameScores < ActiveRecord::Migration
  def change
    create_table :game_scores do |t|
      t.references :game
      t.references :user
      t.float :score
      t.integer :time
      t.float :ratio
      t.timestamps
    end
  end
end
