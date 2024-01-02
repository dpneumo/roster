# frozen_string_literal: true

class PersonAddressesController < ApplicationController
  before_action :set_person

  def addresses
    @addresses = Address.where(person_id: @person.id)
  end


private
  def set_person
    @person = Person.find(params[:id])
  end
end
