# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people, id: :uuid do |t|
      t.string  :nickname
      t.string  :first, null: false
      t.string  :middle
      t.string  :last, null: false
      t.string  :suffix
      t.string  :honorific
      t.string  :role
      t.string  :status
      t.uuid    :pref_email_id
      t.uuid    :pref_phone_id
      t.uuid    :pref_address_id
      t.uuid    :house_id
      t.text    :note

      t.timestamps
    end

    add_index :people, :house_id
  end
end
