require 'rails_helper'

RSpec.describe DiceRollerService do
  describe '.roll' do
    it 'fails validation with negative sides' do
      result = DiceRollerService.roll(sides: -1)
      expect(result).to eq(0)
    end
  end
end
