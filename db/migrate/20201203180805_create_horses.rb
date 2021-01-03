class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :location
      t.string :breed
      t.string :gender
      t.string :size
      t.string :color
      t.datetime :foal_date
      t.string :profile_picture
      t.string :video
      t.string :temperment
      t.string :description

      t.timestamps
    end
  end
end
