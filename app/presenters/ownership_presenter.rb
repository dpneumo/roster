# frozen_string_literal: true

class OwnershipPresenter < ApplicationPresenter
  def owner_name
    owner.fullname
  end

  def people_list
    PersonPresenter.new(nil, nil).select_list
  end

  def house_list
    HousePresenter.new(nil, nil).select_list
  end

  def house_address
    HousePresenter.new(property, nil).house_address
  end
  alias assoc_name house_address

  def instance_path
    id ? ownership_path(self) : nil
  end

  def collection_path
    ownerships_path
  end

  def belongs_to_path
    person_id ? person_path(person_id) : nil
  end

  def belongs_to_name
    'Person'
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:house_id] },
      { elements: [:person_id] },
      { elements: [:submit, :navlinks] },
    ]
  end

  def element_info 
    {
      house_id:    { kind: :address, blank: true, prompt: true, disable_edit: true },
      person_id:   { kind: :select, lblfor: 'ownership_person_id', lbltxt: 'Person', collection: people_list, 
                     blank: true, prompt: true, disable_edit: false },
      submit:      { kind: :submit,         subtxt: 'Submit' },
      submit_cncl: { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: ownerships_path },
      navlinks:    { kind: :navlinks_sl },
    } 
  end
end
