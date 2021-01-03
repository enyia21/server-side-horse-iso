class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :common_name
      t.string :country
      t.string :uses
      t.string :color_comments
      t.string :adaptablity

      t.timestamps
    end
  end
end
