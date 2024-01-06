# frozen_string_literal: true

class PersonEmailAddrsController < ApplicationController
  before_action :set_person

  def email_addrs
    @email_addrs = Email.where(person_id: @person.id)
  end


private
  def set_person
    @person = Person.find(params[:id])
  end
end
