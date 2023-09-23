# frozen_string_literal: true

class OwnershipPresenter < ApplicationPresenter
  def house_list
    HousePresenter.new(nil, nil).select_list
  end

  def people_list
    PersonPresenter.new(nil, nil).select_list
  end

  def house_address
    HousePresenter.new(property, nil).house_address
  end

  def owner_name
    owner.fullname
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:house_id] },
      { elements: [:person_id] }
    ]
  end

  def element_info 
    {
      house_id:   { kind: :select, span: 3, lblfor: 'ownership_house_id', lbltxt: 'House', collection: house_list },
      person_id:   { kind: :select, span: 3, lblfor: 'ownership_person_id', lbltxt: 'Person', collection: people_list },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: ownerships_path },
    } 
  end
end
