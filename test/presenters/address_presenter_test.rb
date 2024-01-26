# frozen_string_literal: true

require 'test_helper'

class AddressPresenterTest < ActiveSupport::TestCase
  setup do
    @addr = addresses(:valid)
    @presenter = AddressPresenter.new(@addr, nil)
  end

  test 'types returns an array of address types' do
    addr_types = @presenter.types
    assert_instance_of(Array, addr_types)
    assert_includes(addr_types, 'Home')
  end

  test 'primary returns preferred status as Yes or No' do
    assert_equal  '', @presenter.primary # default
    @addr.preferred = true
    assert_equal  'Yes', @presenter.primary
  end

  test 'returns a sorted array of people for selection' do
    person1 = people(:valid2)
    person2 = people(:valid)
    persons_list = @presenter.persons_list
    assert_instance_of(Array, persons_list)
    assert_equal 'Heinlin, Robert A', persons_list.first[0]
    assert_equal person2.id, persons_list.first[1]
    assert_equal 'Satre, Michael B', persons_list.second[0]
    assert_equal person1.id, persons_list.second[1]
  end

  test 'returns a formatted complete address' do
    ca = '123A Oak Dr, Arlington, TX 76016'
    assert_equal ca, @presenter.complete_address
  end

  test 'returns a formatted complete address hint' do
    ca = '123A Oak Dr, Arlingt...'
    assert_equal ca, @presenter.complete_address_hint
  end

  test 'returns the fullname of the associated addressee' do
    fullname = 'Robert A Heinlin'
    assert_equal fullname, @presenter.addressee
    assert_equal fullname, @presenter.assoc_name  
  end

  test 'returns a note hint' do 
    @addr.note = 'a very long note does not fit in the index table'
    note_hint =  'a very long note doe...'
    assert_equal note_hint, @presenter.note_hint    
  end

  test 'returns <model>_path if model has an id assigned' do
    addr_path = "/addresses/#{ @addr.id }"
    assert_equal addr_path, @presenter.instance_path
  end

  test 'returns nil if model id is not assigned' do  
    @addr.id = nil
    presenter = AddressPresenter.new(@addr, nil)
    assert_nil presenter.instance_path
  end

  test 'collection_path returns the addresses_path' do
    path = '/addresses'
    assert_equal path, @presenter.collection_path
  end

  test 'returns belongs_to_path if <assoc>_id assigned' do
    path = "/people/#{ @addr.person_id }"
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
