# frozen_string_literal: true

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @em = emails(:one)
  end

  test 'a valid email succeeds' do
    assert @em.save
  end

  test 'person_id must be present' do
    @em.person_id = nil
    refute @em.save, 'Saved email without person_id'
  end

  test 'address must be present' do
    @em.addr = ''
    refute @em.save, 'Saved email without addr'
  end

  # Schema tests (db enforces)
  test 'preferred defaults to false' do
    @em = emails(:two)
    assert_equal false, @em.preferred
  end

  test 'note may be null' do
    @em.note = nil
    assert @em.save, 'Save email failed with null note'
  end

  test 'note may be blank' do
    @em.note = ''
    assert @em.save, 'Save email failed with blank note'
  end
end
