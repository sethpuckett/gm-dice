# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Roll do
  describe 'initialize' do
    it 'sets attributes correctly' do
      roll = Roll.new(values: [1, 2], constant: 3)
      expect(roll.values).to eq([1, 2])
      expect(roll.constant).to eq(3)
    end

    it 'defaults constant to 0' do
      roll = Roll.new(values: [1, 2])
      expect(roll.constant).to eq(0)
    end
  end

  describe 'total' do
    context 'with positive input' do
      it 'sums correctly' do
        roll = Roll.new(values: [1, 2], constant: 3)
        expect(roll.total).to eq(6)
      end
    end

    context 'with negative input' do
      it 'returns 0' do
        roll = Roll.new(values: [1, 2], constant: -4)
        expect(roll.total).to eq(0)
      end
    end
  end
end
