# frozen_string_literal: true

class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions, id: :uuid do |t|
      t.uuid :person_id
      t.string :name
      t.date :start
      t.date :stop

      t.timestamps
    end

    add_index :positions, :person_id
  end
end
