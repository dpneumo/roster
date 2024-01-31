# frozen_string_literal: true

require 'test_helper'

class PhonePresenterTest < ActiveSupport::TestCase
  setup do
    @phone = phones(:ph_valid)
    @presenter = PhonePresenter.new(@phone, nil)
  end

  test 'types returns an array of phone types' do
    phone_types = @presenter.types
    assert_instance_of(Array, phone_types)
    assert_includes(phone_types, 'Home')
  end

  test 'primary returns preferred status as Yes or No' do
    @phone.preferred = false
    assert_equal  '', @presenter.primary
    @phone.preferred = true
    assert_equal  'Yes', @presenter.primary
  end

  test 'textable returns txt_capable status as Yes or No' do
    @phone.txt_capable = false
    assert_equal  '', @presenter.textable
    @phone.txt_capable = true
    assert_equal  'Yes', @presenter.textable
  end

  test 'ph_number returns a formated phone number' do  
    assert_equal '(817) 123-4567', @presenter.ph_number
  end

  test 'returns a note hint' do 
    @phone.note = 'a very long note does not fit in the index table'
    note_hint =   'a very long note doe...'
    assert_equal note_hint, @presenter.note_hint    
  end

  test 'returns a sorted array of arrays: persons for selection' do
    person_list = @presenter.person_list
    assert_instance_of(Array, person_list)
    assert_instance_of(Array, person_list.first)
  end

  test 'returns the fullname of the associated person' do
    fullname = 'Robert A Heinlin'
    assert_equal fullname, @presenter.person_name
    assert_equal fullname, @presenter.assoc_name  
    assert_equal fullname, @presenter.person_fullname  
  end

  test 'returns <model>_path if model has an id assigned' do
    phone_path = "/phones/#{ @phone.id }"
    assert_equal phone_path, @presenter.instance_path
  end

  test 'returns nil if model id is not assigned' do  
    @phone.id = nil
    assert_nil @presenter.instance_path
  end

  test 'collection_path returns the phones_path' do
    path = '/phones'
    assert_equal path, @presenter.collection_path
  end

  test 'returns belongs_to_path if <assoc>_id assigned' do
    path = "/people/#{ @phone.person_id }"
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
