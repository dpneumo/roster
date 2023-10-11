# frozen_string_literal: true

class AddressPresenter < ApplicationPresenter
  def types
    Enums.address_types
  end

  def primary
    preferred ? 'Yes' : ''
  end

  def persons_list
    PersonPresenter.new(nil, nil).select_list
  end

  def complete_address
    "#{number} #{street}, #{city}, #{state} #{zip}"
  end

  def addressee
    return 'Unknown' unless person
    person.fullname
  end

  def note_hint 
    return '' unless note 
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:person_id] },
      { elements: [:number, :street] },
      { elements: [:city, :state, :zip] },
      { elements: [:address_type, :preferred] },
      { elements: [:note] },
      { elements: [:submit_cncl] },
    ]
  end

  def element_info 
    {
      person_id:    { kind: :select, span: 3, lblfor: 'address_person_id', lbltxt: 'Addressee', 
                      collection: persons_list, blank: true, prompt: true },
      number:       { kind: :text,   span: 1, lblfor: 'address_number',  lbltxt: 'Number' },
      street:       { kind: :text,   span: 1, lblfor: 'address_street',  lbltxt: 'Street' },
      city:         { kind: :text,   span: 1, lblfor: 'address_city',    lbltxt: 'City' },
      state:        { kind: :text,   span: 1, lblfor: 'address_state',   lbltxt: 'State' },
      zip:          { kind: :text,   span: 1, lblfor: 'address_zip',     lbltxt: 'Zip' },
      address_type: { kind: :select, span: 3, lblfor: 'address_address_type',    lbltxt: 'Type', collection: types },
      preferred:    { kind: :checkbox, span: 1, lblfor: 'address_preferred', lbltxt: 'Preferred' },
      note:         { kind: :textarea, span: 3, lblfor: 'address_note',      lbltxt: 'Note' },
      submit_cncl:  { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: addresses_path },
    } 
  end
end
