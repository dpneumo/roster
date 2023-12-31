# frozen_string_literal: true

class PhonePresenter < ApplicationPresenter
  def types
    Enums.phone_types
  end

  def primary
    preferred ? 'Yes' : ''
  end

  def textable
    txt_capable ? 'Yes' : ''
  end

  def persons_list
    PersonPresenter.new(nil, nil).select_list
  end

  def ph_number
    "(#{area}) #{prefix}-#{number}"
  end

  def person_name
    return 'Unknown' unless person
    person.fullname
  end

  def note_hint  
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

  def assoc_name
    person_name
  end

  def instance_path
    id ? phone_path(self) : nil
  end

  def collection_path
    phones_path
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
      { elements: [:area, :prefix, :number] },
      { elements: [:phone_type, :preferred, :txt_capable] },
      { elements: [:note] },
      { elements: [:submit, :navlinks] },
    ]
  end

  def element_info 
    {
      person_id:   { kind: :select, lblfor: 'phone_person_id', lbltxt: 'Person', 
                     collection: persons_list, blank: true, prompt: true, disable_edit: true },
      cc:          { kind: :text,   lblfor: 'phone_cc',        lbltxt: 'Country Code' },
      area:        { kind: :text,   lblfor: 'phone_area',      lbltxt: 'Area Code' },
      prefix:      { kind: :text,   lblfor: 'phone_prefix',    lbltxt: 'Prefix' },
      number:      { kind: :text,   lblfor: 'phone_number',    lbltxt: 'Number' },
      phone_type:  { kind: :select, lblfor: 'phone_type',      lbltxt: 'Type', collection: types },
      preferred:   { kind: :checkbox, lblfor: 'phone_preferred',   lbltxt: 'Preferred' },
      txt_capable: { kind: :checkbox, lblfor: 'phone_txt_capable', lbltxt: 'Textable' },
      note:        { kind: :textarea, lblfor: 'phone_note',        lbltxt: 'Note' },
      submit:      { kind: :submit,         subtxt: 'Submit' },
      submit_cncl: { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: phones_path },
      navlinks:    { kind: :navlinks },
    } 
  end
end
