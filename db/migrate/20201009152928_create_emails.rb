# frozen_string_literal: true

class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails, id: :uuid do |t|
      t.uuid     :person_id, null: false
      t.string   :addr, null: false
      t.string   :email_type
      t.boolean  :preferred, default: false
      t.text     :note

      t.timestamps
    end

    add_index :emails, :person_id
  end
end
