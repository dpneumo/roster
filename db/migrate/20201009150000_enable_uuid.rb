# frozen_string_literal: true

# config/db/migrate/enable_uuid.rb
class EnableUuid < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-oosp')
  end
end
