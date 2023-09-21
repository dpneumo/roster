# frozen_string_literal: true

class DateRange
  attr_reader :start, :stop

  def initialize(start, stop)
    @start = start
    @stop = stop
  end

  def includes_date?(date)
    date >= start && date <= stop
  end

  def includes_date_range?(date_range)
    start <= date_range.start && stop >= date_range.stop
  end

  def overlaps_date_range?(date_range)
    start <= date_range.stop && stop >= date_range.start
  end

  def to_s
    "#{start.strftime('%d-%B-%Y')}  to  #{stop.strftime('%d-%B-%Y')}"
  end

  def valid?
    return false if start.nil? || stop.nil?
    return false unless start.instance_of?(Date) && stop.instance_of?(Date)

    start < stop
  end
end
