# frozen_string_literal: true

class WelcomePresenter < ApplicationPresenter
  def current_year
    Date.current.year
  end

  def last_year
    Date.current.years_ago(1).year
  end

  def total_dues_current
    contribs = Contributions::GetForYear.call(current_year)
    contribs.reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def total_dues_last_year
    contribs = Contributions::GetForYear.call(last_year)
    contribs.reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def current_positions
    Position.current_active_posns.all.map { |p| PositionPresenter.new(p, view_context) }
  end
end
