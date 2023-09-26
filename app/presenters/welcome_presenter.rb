# frozen_string_literal: true

class WelcomePresenter < ApplicationPresenter
  def welcome
    "Welcome to the WWNA Roster!"
  end

  def current_year
    Date.current.year
  end

  def last_year
    Date.current.years_ago(1).year
  end

  def total_dues_current
    contribs = Contributions::GetForYear.call(current_year)
    total = contribs.reduce(0) { |sum, c| sum + c.amount }
    "Total Dues Paid #{current_year}:" + humanized_money_with_symbol(total).rjust(14)
  end

  def total_dues_last_year
    contribs = Contributions::GetForYear.call(last_year)
    total = contribs.reduce(0) { |sum, c| sum + c.amount_cents }
    "Total Dues Paid #{last_year}:" + humanized_money_with_symbol(total).rjust(14)
  end

  def board_title
    "WWNA Board"
  end

  def current_positions
    Position.current_active_posns.all.map { |p| PositionPresenter.new(p, view_context) }
  end
end
