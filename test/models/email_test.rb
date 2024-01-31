# frozen_string_literal: true

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @valid_em = emails(:em_valid)
  end

  test 'a valid email succeeds' do
    assert @valid_em.save
  end

  test 'person_id must be present' do
    @valid_em.person_id = nil
    refute @valid_em.save, 'Saved email without person_id'
  end

  test 'address must be present' do
    @valid_em.addr = ''
    refute @valid_em.save, 'Saved email without addr'
  end

  # Schema tests (db enforces)
  test 'preferred defaults to false' do
    assert_equal false, emails(:em_not_pref).preferred,
                 'Default value for preferred not inserted by DB'
  end

  test 'note may be null' do
    @valid_em.note = nil
    assert @valid_em.save, 'Save email failed with null note'
  end

  test 'note may be blank' do
    @valid_em.note = ''
    assert @valid_em.save, 'Save email failed with blank note'
  end
end
