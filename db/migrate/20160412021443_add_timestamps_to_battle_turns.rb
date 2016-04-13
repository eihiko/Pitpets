class AddTimestampsToBattleTurns < ActiveRecord::Migration
  def change
    change_table(:battle_turns) { |t| t.timestamps }
  end
end
