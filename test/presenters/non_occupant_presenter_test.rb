# frozen_string_literal: true

require 'test_helper'

class NonOccupentPresenterTest < ActiveSupport::TestCase
  test 'topic_house returns house address given house_id' do 
    nonoccupant = people(:pers_nonoccup)
    presenter = NonOccupantPresenter.new(nonoccupant, nil)
    house = houses(:hs_valid)
    assert_equal '123A Oak Dr', presenter.topic_house(house.id)
  end
end
