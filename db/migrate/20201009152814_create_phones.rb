# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones, id: :uuid do |t|
      t.uuid    :person_id, null: false
      t.string  :cc, default: '1'
      t.string  :area,   null: false
      t.string  :prefix, null: false
      t.string  :number, null: false
      t.string  :phone_type
      t.boolean :preferred, default: false
      t.boolean :txt_capable, default: false
      t.text    :note

      t.timestamps
    end

    add_index :phones, :person_id
  end
end
