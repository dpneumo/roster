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
    return '' unless note 
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:person_id] },
      { elements: [:cc, :area, :prefix, :number] },
      { elements: [:phone_type, :preferred, :txt_capable] },
      { elements: [:note] },
      { elements: [:submit_cncl] },
    ]
  end

  def element_info 
    {
      person_id:   { kind: :select, span: 3, lblfor: 'phone_person_id', lbltxt: 'Person', 
                      collection: persons_list, blank: true, prompt: true },
      cc:          { kind: :text,   span: 1, lblfor: 'phone_cc',        lbltxt: 'Country Code' },
      area:        { kind: :text,   span: 1, lblfor: 'phone_area',      lbltxt: 'Area Code' },
      prefix:      { kind: :text,   span: 1, lblfor: 'phone_prefix',    lbltxt: 'Prefix' },
      number:      { kind: :text,   span: 1, lblfor: 'phone_number',    lbltxt: 'Number' },
      phone_type:  { kind: :select, span: 3, lblfor: 'phone_type',      lbltxt: 'Type', collection: types },
      preferred:   { kind: :checkbox, span: 1, lblfor: 'phone_preferred', lbltxt: 'Preferred' },
      txt_capable: { kind: :checkbox, span: 1, lblfor: 'phone_txt_capable', lbltxt: 'Text Capable' },
      note:        { kind: :textarea, span: 3, lblfor: 'phone_note',      lbltxt: 'Note' },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: phones_path },
    } 
  end
end
