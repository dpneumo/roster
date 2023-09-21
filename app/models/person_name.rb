# frozen_string_literal: true

class PersonName
  def initialize(first, middle, last, nickname, suffix, honorific)
    @first = first
    @middle = middle
    @last = last
    @nickname = nickname
    @suffix = suffix
    @honorific = honorific
  end

  def fullname
    padded_first + padded_middle + last
  end

  def sortable_name
    "#{last}, #{padded_first}#{middle}"
  end

  def informal_name
    padded_nick + last
  end

  def formal_name
    padded_honorific + fullname + padded_suffix
  end

  def padded_nick
    return '' if @nickname.nil?

    n = @nickname.strip
    return '' if n.empty?

    "#{n} "
  end

  def nickname
    return '' if @nickname.nil?

    @nickname.strip
  end

  def padded_first
    return '' if @first.nil?

    f = @first.strip
    return '' if f.empty?

    "#{f} "
  end

  def first
    return '' if @first.nil?

    @first.strip
  end

  def padded_middle
    return '' if @middle.nil?

    m = @middle.strip
    return '' if m.empty?

    "#{m} "
  end

  def middle
    return '' if @middle.nil?

    @middle.strip
  end

  def last
    return 'Not Provided' if @last.nil?

    @last.strip
  end

  def padded_honorific
    return '' if @honorific.nil?

    h = @honorific.strip
    return '' if h.empty?

    "#{h} "
  end

  def honorific
    return '' if @honorific.nil?

    @honorific.strip
  end

  def padded_suffix
    return '' if @suffix.nil?

    s = @suffix.strip
    return '' if s.empty?

    " #{s}"
  end

  def suffix
    return '' if @suffix.nil?

    @suffix.strip
  end
end
