# frozen_string_literal: true

require 'test_helper'

class PositionPresenterTest < ActiveSupport::TestCase
  setup do
    @position = positions(:active)
    @presenter = PositionPresenter.new(@position, nil)
  end

  test 'return true if the position is currently active' do 
    assert @presenter.currently_active?
  end

  test 'return false if the position is currently inactive' do 
    posn = positions(:inactive)
    presenter = PositionPresenter.new(posn, nil)
    refute presenter.currently_active?
  end

  test 'returns the prefered phone for the associated person' do  
    pref_phone = phones(:valid)
    person = people(:valid)
    person.pref_phone_id = pref_phone.id
    person.save
    assert_equal '(817) 123-4567', @presenter.person_pref_phone
  end

  test 'returns nil if no prefered phone for the associated person' do  
    person = people(:valid)
    person.pref_phone_id = nil
    person.save
    assert_nil @presenter.person_pref_phone
  end

  test 'returns the prefered email for the associated person' do  
    pref_email = emails(:valid)
    person = people(:valid)
    person.pref_email_id = pref_email.id
    person.save
    assert_equal 'aaa@bbb.ccc', @presenter.person_pref_email
  end

  test 'returns nil if no prefered email for the associated person' do  
    person = people(:valid)
    person.pref_email_id = nil
    person.save
    assert_nil @presenter.person_pref_email
  end

  test 'returns a sorted array of arrays: persons for selection' do
    person_list = @presenter.person_selectlist
    assert_instance_of(Array, person_list)
    assert_instance_of(Array, person_list.first)
  end

  test 'returns the name of the associated person' do
    name = 'Bob Heinlin'
    assert_equal name, @presenter.person_name
    assert_equal name, @presenter.assoc_name  
  end

  test 'returns UnAssigned if a person_id is nil' do
    @position.person_id = nil
    name = 'UnAssigned'
    assert_equal name, @presenter.person_name
    assert_equal name, @presenter.assoc_name  
  end

  test 'returns show_path if position id assigned' do  
    path = "/positions/#{@position.id}"
    assert_equal path, @presenter.instance_path
  end

  test 'returns nil if position id is not assigned' do  
    @position.id = nil
    assert_nil @presenter.instance_path
  end

  test 'collection_path returns the contributions_path' do
    path = '/positions'
    assert_equal path, @presenter.positions_path
  end

  test 'returns belongs_to_path if <assoc>_id assigned' do
    path = "/people/#{ @position.person_id }"
    assert_equal path, @presenter.belongs_to_path
  end

  test 'returns the belongs_to assoc class name' do  
    assert_equal 'Person', @presenter.belongs_to_name
  end

  test 'form_rows returns an array of hashes' do 
    fr = @presenter.form_rows
    assert_instance_of(Array, fr)
    assert_instance_of(Hash, fr[0])
    assert_equal :elements, fr[0].keys[0]
  end

  test 'element_info returns a hash of hashes' do 
    ei = @presenter.element_info
    assert_instance_of(Hash, ei)
    assert_instance_of(Hash, ei.shift[1])
  end
end
