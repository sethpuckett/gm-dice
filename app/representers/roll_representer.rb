# frozen_string_literal: true

require 'roar/decorator'
require 'roar/json'

class RollRepresenter < Roar::Decorator
  include Roar::JSON

  property :total
  property :values
  property :constant
end
