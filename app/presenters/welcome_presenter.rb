# frozen_string_literal: true

class WelcomePresenter < ApplicationPresenter
  def welcome
    "Welcome to the WWNA Roster!"
  end

  def board_title
    "WWNA Board"
  end

  def current_year
    Date.current.year
  end

  def last_year
    Date.current.years_ago(1).year
  end

  def total_dues_current
    "Total Dues Paid #{current_year}:" + 
      humanized_money_with_symbol(current_contribs/100).rjust(14)
  end

  def total_dues_last_year
    "Total Dues Paid #{last_year}:" + 
      humanized_money_with_symbol(last_yr_contribs/100).rjust(14)
  end

  def current_positions
    Position.current_active_posns
            .all
            .map { |p| PositionPresenter.new(p, view_context) }
  end

  private
  def current_contribs
    ContributionPresenter.new(nil,nil).total_for(year: current_year)
  end

  def last_yr_contribs
    ContributionPresenter.new(nil,nil).total_for(year: last_year)
  end
end
