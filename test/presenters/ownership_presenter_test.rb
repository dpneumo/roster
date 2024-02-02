# frozen_string_literal: true

require 'test_helper'

class OwnershipPresenterTest < ActiveSupport::TestCase
  setup do
    @ownership = ownerships(:own_valid)
    @presenter = OwnershipPresenter.new(@ownership, nil)
  end

  test 'returns the owner fullname' do 
    assert_equal 'Robert A Heinlin', @presenter.owner_name
  end

  test 'returns a sorted array of arrays: persons for selection' do
    people_list = @presenter.people_list
    assert_instance_of(Array, people_list)
    assert_instance_of(Array, people_list.first)
  end

  test 'returns a sorted array of arrays: houses for selection' do
    house_list = @presenter.house_list
    assert_instance_of(Array, house_list)
    assert_instance_of(Array, house_list.first)
  end

  test 'returns the address of the associated house' do
    address = '123A Oak Dr'
    assert_equal address, @presenter.house_address
    assert_equal address, @presenter.assoc_name  
  end

  test 'returns <model>_path if model has an id assigned' do
    ownership_path = "/ownerships/#{ @ownership.id }"
    assert_equal ownership_path, @presenter.instance_path
  end

  test 'returns nil if model id is not assigned' do  
    @ownership.id = nil
    assert_nil @presenter.instance_path
  end

  test 'collection_path returns the ownerships_path' do
    path = '/ownerships'
    assert_equal path, @presenter.collection_path
  end

  test 'belongs_to_path returns the person path if person_id assigned' do
    path = "/people/#{ @ownership.person_id }"
    assert_equal path, @presenter.belongs_to_path
  end

  test 'belongs_to_path returns nil if person_id not assigned' do
    @ownership.person_id = nil
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
