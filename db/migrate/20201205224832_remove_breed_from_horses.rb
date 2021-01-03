class RemoveBreedFromHorses < ActiveRecord::Migration[6.0]
  def change
    remove_column :horses, :breed, :string
  end
end
