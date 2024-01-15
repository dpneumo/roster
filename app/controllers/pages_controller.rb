# frozen_string_literal: true

class PagesController < ApplicationController
  NBSP = "\u00A0"
  Tab4 = NBSP*4

  def download
    pdf = Prawn::Document.new
    pdf.text 'Hello World'
    send_data(pdf.render, 
              filename: 'hello.pdf',
              type: 'application/pdf')
  end

  def preview
    pdf = Prawn::Document.new
    houses = House.select(:id, :number, :street).where(street: 'Englishoak Dr').limit(10).includes(:occupants)
    houses.each do |h|
      pdf.text "#{h.number} #{h.street}"
      h.occupants.each do |o|
        pdf.text "#{Tab4}#{o.first} #{o.last}"
      end
      pdf.text "\n\n"
    end
 
    send_data(pdf.render, 
              filename: 'flag_list.pdf',
              type: 'application/pdf',
              disposition: 'inline')
  end

end
