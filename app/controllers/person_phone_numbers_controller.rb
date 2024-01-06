# frozen_string_literal: true

class PersonPhoneNumbersController < ApplicationController
  before_action :set_person

  def ph_nums
    @ph_nums = Phone.where(person_id: @person.id)
  end


private
  def set_person
    @person = Person.find(params[:id])
  end
end
