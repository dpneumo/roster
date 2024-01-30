# frozen_string_literal: true

class PositionPresenter < ApplicationPresenter
  def position_names
    [['Officers', Enums.officers], ['Committee Chairs', Enums.chairs]]
  end

  def currently_active?
    date_range.includes_date? Date.current
  end

  def person_pref_phone
    ph = Persons::GetPreferredPhone.call(person.id)
    ph.nil? ? '' : PhonePresenter.new(ph, nil).ph_number
  end

  def person_pref_email
    em = Persons::GetPreferredEmail.call(person.id)
    em.nil? ? '' : EmailPresenter.new(em, nil).addr
  end

  def person_selectlist
    PersonPresenter.new(nil, nil).select_list
  end

  def person_name
    return 'UnAssigned' unless person
    PersonPresenter.new(person, nil).informal_name
  end
  alias assoc_name person_name

  def instance_path
    id ? position_path(self) : nil
  end

  def collection_path
    positions_path
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
      { elements: [:name] },      
      { elements: [:person_id] },
      { elements: [:start, :stop] },
      { elements: [:submit, :navlinks] },      
    ]
  end

  def element_info 
    {
      name:        { kind: :text,   lblfor: 'position_name',      lbltxt: 'Position', disable_edit: true },
      person_id:   { kind: :select, lblfor: 'position_person_id', lbltxt: 'Person', 
                      collection: person_selectlist, blank: true, prompt: true, disable_edit: true },
      start:       { kind: :date,   lblfor: 'position_start',     lbltxt: 'Start Date' },
      stop:        { kind: :date,   lblfor: 'position_stop',      lbltxt: 'End Date'  },
      submit:      { kind: :submit,         subtxt: 'Submit' },
      submit_cncl: { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: positions_path },
      navlinks:    { kind: :navlinks_sl },
    } 
  end
end
