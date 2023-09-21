# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses, id: :uuid do |t|
      t.string  :number, null: false
      t.string  :street, null: false
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :lng, precision: 9, scale: 6
      t.string  :image_link
      t.boolean :flag,   default: false
      t.boolean :rental, default: false
      t.boolean :listed, default: false
      t.string  :status, default: 'Occupied'
      t.string  :current_dues, default: '$0.00'
      t.text    :note

      t.timestamps
    end
  end
end
