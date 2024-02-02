# frozen_string_literal: true

require 'test_helper'

class AddressPresenterTest < ActiveSupport::TestCase
  setup do
    @addr = addresses(:addr_valid)
    @presenter = AddressPresenter.new(@addr, nil)
  end

  test 'types returns an array of address types' do
    addr_types = @presenter.types
    assert_instance_of(Array, addr_types)
    assert_includes(addr_types, 'Home')
  end

  test 'primary returns preferred status as Yes or No' do
    @addr.preferred = false
    assert_equal  '', @presenter.primary
    @addr.preferred = true
    assert_equal  'Yes', @presenter.primary
  end

  test 'returns a formatted complete address' do
    ca = '123A Oak Dr, Arlington, TX 76016'
    assert_equal ca, @presenter.complete_address
  end

  test 'returns a formatted complete address hint' do
    ca = '123A Oak Dr, Arlingt...'
    assert_equal ca, @presenter.complete_address_hint
  end

  test 'returns a note hint' do 
    @addr.note = 'a very long note does not fit in the index table'
    note_hint =  'a very long note doe...'
    assert_equal note_hint, @presenter.note_hint    
  end

  test 'returns a sorted array of arrays: persons for selection' do
    person_list = @presenter.person_list
    assert_instance_of(Array, person_list)
    assert_instance_of(Array, person_list.first)
  end

  test 'returns the fullname of the associated addressee' do
    fullname = 'Robert A Heinlin'
    assert_equal fullname, @presenter.addressee
    assert_equal fullname, @presenter.assoc_name  
    assert_equal fullname, @presenter.person_fullname  
  end

  test 'returns <model>_path if model has an id assigned' do
    addr_path = "/addresses/#{ @addr.id }"
    assert_equal addr_path, @presenter.instance_path
  end

  test 'returns nil if model id is not assigned' do  
    @addr.id = nil
    assert_nil @presenter.instance_path
  end

  test 'collection_path returns the addresses_path' do
    path = '/addresses'
    assert_equal path, @presenter.collection_path
  end

  test 'returns belongs_to_path if <assoc>_id assigned' do
    path = "/people/#{ @addr.person_id }"
    assert_equal path, @presenter.belongs_to_path
  end

  test 'belongs_to_path returns nil if person_id not assigned' do
    @addr.person_id = nil
    assert_nil @presenter.belongs_to_path
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
