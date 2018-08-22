# frozen_string_literal: true

class Roll
  attr_reader :values, :constant

  def initialize(values:, constant: 0)
    @values = values
    @constant = constant
  end

  def total
    [0, @values.sum + @constant].max
  end
end
