# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiceRollerService do
  describe '.roll' do
    context 'with invalid input' do
      it 'raises error with invalid sides' do
        expect { DiceRollerService.roll(sides: -1) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(sides: 3) }.to raise_error(ArgumentError)
      end

      it 'raises error with invalid constant' do
        expect { DiceRollerService.roll(constant: -1_000_001) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(constant: 1_000_001) }.to raise_error(ArgumentError)
      end

      it 'raises error with invalid count' do
        expect { DiceRollerService.roll(count: 0) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(count: 101) }.to raise_error(ArgumentError)
      end

      it 'raises error with invalid attempts' do
        expect { DiceRollerService.roll(attempts: 0) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(attempts: 101) }.to raise_error(ArgumentError)
      end
    end
  end
end
