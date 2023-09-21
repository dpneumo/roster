# frozen_string_literal: true

class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions, id: :uuid do |t|
      t.uuid :house_id, null: false
      t.date      :date_paid, null: false
      t.monetize  :amount,    null: false

      t.timestamps
    end

    add_index :contributions, :house_id
  end
end
