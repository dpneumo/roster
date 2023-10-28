# frozen_string_literal: true

class PositionPresenter < ApplicationPresenter
  def person_selectlist
    PersonPresenter.new(nil, nil).select_list
  end

  def position_names
    [['Officers', Enums.officers], ['Committee Chairs', Enums.chairs]]
  end

  def person_name
    return 'UnAssigned' unless person

    PersonPresenter.new(person, nil).informal_name
  end

  def currently_active?
    position.date_range.includes_date? Date.current
  end

  def person_pref_phone
    ph = Persons::GetPreferredPhone.call(person.id)
    ph.nil? ? '' : PhonePresenter.new(ph, nil).ph_number
  end

  def person_pref_email
    em = Persons::GetPreferredEmail.call(person.id)
    em.nil? ? '' : EmailPresenter.new(em, nil).addr
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:name] },      
      { elements: [:person_id] },
      { elements: [:start, :stop] },
      { elements: [:submit_cncl] },      
    ]
  end

  def element_info 
    {
      name:        { kind: :text, rstart: 1,   start: 1, span: 3, lblfor: 'position_name',    lbltxt: 'Position'      },
      person_id:   { kind: :select, rstart: 2, start: 1, span: 3, lblfor: 'position_person_id',  lbltxt: 'Person', collection: person_selectlist },
      start:       { kind: :date, rstart: 3,   start: 1, span: 3, lblfor: 'position_start', lbltxt: 'Start' },
      stop:        { kind: :date, rstart: 3,   start: 4, span: 3, lblfor: 'position_stop',  lbltxt: 'End'  },
      submit_cncl: { kind: :submit_or_cncl, rstart: 4, start: 1, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: positions_path },
    } 
  end
end
