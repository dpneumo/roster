# frozen_string_literal: true

class HousePresenter < ApplicationPresenter
  def statuses
    Enums.house_statuses
  end

  def street_names
    House.all.collect(&:street).uniq
  end

  def for_select
    House.all.each_with_object({}) do |house, acc|
      acc[house.street] ||= []
      acc[house.street] << [house.number, house.id]
    end
  end

  def select_list
    House.all.map { |h| [addr(h), h.id] }
  end

  def house_address
    addr(__getobj__)
  end

  def linked_lot_addresses
    return '' unless lots
    lots
      .map { |lot| HousePresenter.new(lot, nil).house_address }
      .join('; ')
  end

  def err_msgs
    errors.full_messages
  end

  def my_contributions(year: Date.current.year)
    contribs = Contributions::GetForHouseAndYear.call(house_id, year)
    contribs.reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def yearly_contributions_for_house
    Contributions::GetForHouse.call(house_id)
      .group_by(&:shift)
      .transform_values(&:flatten)
      .map {|k,v| [k.year, Money.new(v.inject(:+))] }
  end

  def occupants
    Person.where('house_id = ?', id)
  end

  def owners
    Ownership.where('house_id = ?', id)
  end

  def gets_flag
    flag ? 'Yes' : ''
  end

  def is_rented
    rental ? 'Yes' : ''
  end

  def is_listed
    listed ? 'Yes' : ''
  end

  def note_hint
    return '' unless note  
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

  private

  def addr(house)
    "#{house.number} #{house.street}"
  end

  def house_id
    id
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:number, :street] },
      { elements: [:lat, :lng, :image_link] },
      { elements: [:flag, :rental] },
      { elements: [:listed, :status] },
      { elements: [:current_dues] },
      { elements: [:note] },
      { elements: [:submit_cncl] },
    ]
  end

  def element_info 
    {
      number:       { kind: :text,     span: 1, lblfor: 'house_number',     lbltxt: 'Number' },
      street:       { kind: :text,     span: 1, lblfor: 'house_street',     lbltxt: 'Street' },
      lat:          { kind: :text,     span: 1, lblfor: 'house_lat',        lbltxt: 'Latitude' },
      lng:          { kind: :text,     span: 1, lblfor: 'house_long',       lbltxt: 'Longitude' },
      image_link:   { kind: :text,     span: 1, lblfor: 'house_image_link', lbltxt: 'Image Link' },
      flag:         { kind: :checkbox, span: 1, lblfor: 'house_flag',       lbltxt: 'Flag' },
      rental:       { kind: :checkbox, span: 1, lblfor: 'house_rental',     lbltxt: 'Rental' },
      listed:       { kind: :checkbox, span: 3, lblfor: 'house_listed',     lbltxt: 'Listed' },
      status:       { kind: :select,   span: 1, lblfor: 'house_status',     lbltxt: 'Status',
                      collection: statuses },
      current_dues: { kind: :text,     span: 1, lblfor: 'house_current_dues', lbltxt: 'Current Dues' },
      note:         { kind: :textarea, span: 3, lblfor: 'house_note',       lbltxt: 'Note' },
      submit_cncl:  { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: addresses_path },
    } 
  end
end
