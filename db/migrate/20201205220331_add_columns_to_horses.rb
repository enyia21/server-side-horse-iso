class AddColumnsToHorses < ActiveRecord::Migration[6.0]
  def change
    add_reference :horses, :user, null: true, foreign_key: true
    add_reference :horses, :breed, null: true, foreign_key: true
  end
end
