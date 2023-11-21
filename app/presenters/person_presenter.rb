# frozen_string_literal: true

class PersonPresenter < ApplicationPresenter
  def select_list
    Person.all
          .collect { |person| [person.sortable_name, person.id] }
          .sort_by(&:first)  
  end

  def roles
    Enums.person_roles
  end

  def statuses
    Enums.person_statuses
  end

  def house_address
    return '' unless house
    HousePresenter.new(house, view_context).house_address
  end

  def house_street
    return '' unless house
    house.street
  end

  def house_number
    return '' unless house 
    house.number
  end

  def current_position
    p = Positions::GetCurrentForPerson.call(person_id).last
    p ? p.name : ''
  end

  def current_street
    Persons::GetStreet.call(house_id) || ''
  end

  def current_number
    Persons::GetNumber.call(house_id) || ''
  end

  def preferred_email
    em = Persons::GetPreferredEmail.call(person_id)
    em ? EmailPresenter.new(em, view_context).addr : ''
  end

  def preferred_phone
    ph = Persons::GetPreferredPhone.call(person_id)
    ph ? PhonePresenter.new(ph, view_context).ph_number : ''
  end

  def preferred_address
    ad = Persons::GetPreferredAddress.call(person_id)
    ad ? AddressPresenter.new(ad, view_context).complete_address : ''
  end

  def addrs
    addresses.map { |addr| AddressPresenter.new(addr, view_context) }
  end

  def email_addrs
    emails.map { |email| EmailPresenter.new(email, view_context) }
  end

  def phone_nums
    phones.map { |ph| PhonePresenter.new(ph, view_context) }
  end

  def houses
    House.all.map do |house|
      hs = HousePresenter.new(house, view_context)
      [hs.house_address, house.id]
    end
  end

  def houses_grouped_by_street(selected=nil)
    grouped_options = Houses::GetForSelectOpts.call.group_by(&:shift)
    grouped_options_for_select(grouped_options,selected)
  end

  def houses_on_street(street)
    Houses::GetHousesOnStreet.new(street).call 
  end

  def house_options(street)
    Houses::GetHousesOnStreet.new(street).call.to_h
  end


  def streets
     HousePresenter.new(house, view_context).street_names
  end

  def person_id
    id
  end

  def note_hint  
    note.length > 15 ? note.slice(0..14)+'...' : note
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:first, :middle, :last] },
      { elements: [:nickname, :suffix, :honorific] },
      { elements: [:streets, :house_id, :status, :role] },
      { elements: [:pref_email_id, :pref_phone_id, :pref_address_id] },
      { elements: [:note] },
      { elements: [:submit_cncl] },
    ]
  end

  def element_info 
    {
      first:     { kind: :text, lblfor: 'person_first',     lbltxt: 'First' },
      middle:    { kind: :text, lblfor: 'person_middle',    lbltxt: 'Middle' },
      last:      { kind: :text, lblfor: 'person_last',      lbltxt: 'Last' },
      nickname:  { kind: :text, lblfor: 'person_nickname',  lbltxt: 'Nickname' },
      suffix:    { kind: :text, lblfor: 'person_suffix',    lbltxt: 'Suffix' },
      honorific: { kind: :text, lblfor: 'person_honorific', lbltxt: 'Honorific' },
      role:      { kind: :select, lblfor: 'person_role',      lbltxt: 'Role',
                   collection: roles,    blank: true, prompt: true },
      status:    { kind: :select, lblfor: 'person_status',    lbltxt: 'Occupy As',
                   collection: statuses, blank: true, prompt: true },
      house_id:  { kind: :select, lblfor: 'person_house_id',  lbltxt: 'House',
                   data_target: 'house_id', 
                   collection: houses_grouped_by_street, blank: true, prompt: true },
      streets:   { kind: :group,  lblfor: 'person_streets',   lbltxt: 'Street',
                   collection: streets, blank: false, prompt: true },
      pref_email_id:   { kind: :text, lblfor: 'person_pref_email_id',   lbltxt: 'Preferred Email' },
      pref_phone_id:   { kind: :text, lblfor: 'person_pref_phone_id',   lbltxt: 'Preferred Phone' },
      pref_address_id: { kind: :text, lblfor: 'person_pref_address_id', lbltxt: 'Preferred Address' },
      note:        { kind: :textarea, lblfor: 'person_note',  lbltxt: 'Note' },
      submit_cncl: { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: people_path },
    } 
  end
end
