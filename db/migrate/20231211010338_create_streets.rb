class CreateStreets < ActiveRecord::Migration[7.0]
  def change
    create_table :streets do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
