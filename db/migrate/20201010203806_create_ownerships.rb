# frozen_string_literal: true

class CreateOwnerships < ActiveRecord::Migration[6.0]
  def change
    create_table :ownerships, id: :uuid do |t|
      t.uuid :house_id,  null: false
      t.uuid :person_id, null: false

      t.timestamps
    end

    add_index :ownerships, :house_id
    add_index :ownerships, :person_id
  end
end
