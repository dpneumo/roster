# frozen_string_literal: true

require 'test_helper'

class ContributionPresenterTest < ActiveSupport::TestCase
  setup do
    @contrib = contributions(:cntr_valid)
    @presenter = ContributionPresenter.new(@contrib, nil)
  end

  test 'returns contributions for a house for a year (text or integer)' do  
    house = houses(:hs_valid)
    Contribution.new(house: house, date_paid: '2000-01-22', amount_cents: 1000).save 
    Contribution.new(house: house, date_paid: '2000-09-17', amount_cents: 200).save  
    assert_equal 1200, @presenter.for(house_id: house.id, year: '2000')
    assert_equal 1200, @presenter.for(house_id: house.id, year: '2000')
  end


  test 'returns total contributions for all houses for a year (text or integer)' do
    house1 = houses(:hs_valid)
    house2 = houses(:hs_valid2)
    Contribution.new(house: house1, date_paid: '2000-01-22', amount_cents: 1000).save 
    Contribution.new(house: house2, date_paid: '2000-09-17', amount_cents: 200).save  
    assert_equal 1200, @presenter.total_for(year: '2000')
    assert_equal 1200, @presenter.total_for(year: 2000)
  end

  test 'year_range accepts an integer year' do  
    myrange = @presenter.year_range(1923)
    assert_instance_of(Range, myrange)
    assert_includes(myrange, '1923-01-01')
    assert_includes(myrange, '1923-12-31')
    refute_includes(myrange, '1922-12-31')
    refute_includes(myrange, '1924-01-01')
  end

  test 'year_range accepts text year' do  
    myrange = @presenter.year_range('1923')
    assert_instance_of(Range, myrange)
    assert_includes(myrange, '1923-01-01')
    assert_includes(myrange, '1923-12-31')
    refute_includes(myrange, '1922-12-31')
    refute_includes(myrange, '1924-01-01')
  end

  test 'returns a sorted array of arrays: houses for selection' do
    house_list = @presenter.house_list
    assert_instance_of(Array, house_list)
    assert_instance_of(Array, house_list.first)
  end

  test 'returns the house_address of the associated house' do
    address = '123A Oak Dr'
    assert_equal address, @presenter.house_address
    assert_equal address, @presenter.assoc_name  
  end

  test 'returns show_path if contribution id assigned' do  
    path = "/contributions/#{@contrib.id}"
    assert_equal path, @presenter.instance_path
  end

  test 'returns nil if contribution id is not assigned' do  
    @contrib.id = nil
    assert_nil @presenter.instance_path
  end

  test 'collection_path returns the contributions_path' do
    path = '/contributions'
    assert_equal path, @presenter.collection_path
  end

  test 'returns belongs_to_path if <assoc>_id assigned' do
    path = "/houses/#{ @contrib.house_id }"
    assert_equal path, @presenter.belongs_to_path
  end

  test 'returns the belongs_to assoc class name' do  
    assert_equal 'House', @presenter.belongs_to_name
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
