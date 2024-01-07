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
    ca = "#{number} #{street}, #{city}, #{state} #{zip}"
  end

  def complete_address_hint
    ca = complete_address
    ca.length > 20 ? ca.slice(0..19)+'...' : ca
  end

  def addressee
    return 'Unknown' unless person
    person.fullname
  end

  def note_hint
    return '' unless note  
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

  def assoc_name
    addressee
  end

  def instance_path
    id ? address_path(self) : nil
  end

  def collection_path
    addresses_path
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
      { elements: [:person_id] },
      { elements: [:number, :street] },
      { elements: [:city, :state, :zip] },
      { elements: [:address_type, :preferred] },
      { elements: [:note] },
      { elements: [:submit, :navlinks] },
    ]
  end

  def element_info 
    {
      person_id:    { kind: :select, lblfor: 'address_person_id', lbltxt: 'Person', 
                      collection: persons_list, blank: true, prompt: true, disable_edit: true },
      number:       { kind: :text,   lblfor: 'address_number',  lbltxt: 'Number' },
      street:       { kind: :text,   lblfor: 'address_street',  lbltxt: 'Street' },
      city:         { kind: :text,   lblfor: 'address_city',    lbltxt: 'City' },
      state:        { kind: :text,   lblfor: 'address_state',   lbltxt: 'State' },
      zip:          { kind: :text,   lblfor: 'address_zip',     lbltxt: 'Zip' },
      address_type: { kind: :select, lblfor: 'address_address_type',    lbltxt: 'Type', collection: types },
      preferred:    { kind: :checkbox, lblfor: 'address_preferred', lbltxt: 'Preferred' },
      note:         { kind: :textarea, lblfor: 'address_note',      lbltxt: 'Note' },
      submit:       { kind: :submit,         subtxt: 'Submit' },
      submit_cncl:  { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: addresses_path },
      navlinks:     { kind: :navlinks_sla },
    } 
  end
end
