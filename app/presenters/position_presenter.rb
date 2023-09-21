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
      name:        { kind: :text,      span: 3, lblfor: 'position_name',    lbltxt: 'Position'      },
      person_id:   { kind: :select,    span: 3, lblfor: 'position_person_id',  lbltxt: 'Person', collection: person_selectlist },
      start:       { kind: :date, span: 3, lblfor: 'position_start', lbltxt: 'Start' },
      stop:        { kind: :date, span: 3, lblfor: 'position_stop',  lbltxt: 'End'  },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel' },
    } 
  end

end
