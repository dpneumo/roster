# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links, id: :uuid do |t|
      t.uuid :house_id, null: false
      t.uuid :lot_id, null: false

      t.timestamps
    end

    add_index :links, :house_id
    add_index :links, :lot_id
  end
end
