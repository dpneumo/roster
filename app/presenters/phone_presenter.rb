# frozen_string_literal: true

class PhonePresenter < ApplicationPresenter
  def types
    Enums.phone_types
  end

  def primary
    preferred ? 'yes' : ''
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

  def form_rows
    [ 
      { elements: [:person_id] },
      { elements: [:cc, :area, :prefix, :number] },
      { elements: [:phone_type, :preferred, :txt_capable] },
      { elements: [:note] }
    ]
  end

  def element_info 
    {
      person_id:   { kind: :select, span: 3, lblfor: 'phone_person_id', lbltxt: 'Person', collection: person_selectlist },
      cc:          { kind: :text,   span: 3, lblfor: 'phone_cc',        lbltxt: 'Country Code' },
      area:        { kind: :text,   span: 3, lblfor: 'phone_area',      lbltxt: 'Area Code' },
      prefix:      { kind: :text,   span: 3, lblfor: 'phone_prefix',    lbltxt: 'Prefix' },
      number:      { kind: :text,   span: 3, lblfor: 'phone_number',    lbltxt: 'Number' },
      phone_type:  { kind: :select, span: 3, lblfor: 'phone_type',      lbltxt: 'Type', collection: types },
      preferred:   { kind: :date,   span: 3, lblfor: 'phone_preferred', lbltxt: 'Preferred' },
      txt_capable: { kind: :date,   span: 3, lblfor: 'phone_txt_capable', lbltxt: 'Text Capable' },
      note:        { kind: :text,   span: 3, lblfor: 'phone_note',      lbltxt: 'Note' },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel' },
    } 
  end
end
