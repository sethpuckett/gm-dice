# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiceRollerController, type: :controller do
  describe 'GET /roll' do
    let(:roll) { Roll.new(values: [4,2], constant: 1) }
    let(:multi_roll) { [Roll.new(values: [4,2], constant: 1), Roll.new(values: [5,3], constant: 2)] }

    it 'has json response type' do
      get :roll
      expect(subject.content_type).to eq('application/json')
    end

    it 'has 200 response' do
      get :roll
      expect(subject.status).to eq(200)
    end

    it 'calls dice roller service with no paramaters' do
      expect(DiceRollerService).to receive(:roll).and_return(roll)
      get :roll
    end

    it 'calls dice roller service with parameters' do
      expect(DiceRollerService).to receive(:roll).with(count: 2, sides: 8, constant: 1, attempts: 2).and_return(roll)

      get :roll, params: { count: 2, sides: 8, constant: 1, attempts: 2 }
    end

    context 'with single attempt' do
      let(:expected_response) do
        {
          total: 7,
          values: [4, 2],
          constant: 1
        }
      end

      it 'returns correct payload' do
        allow(DiceRollerService).to receive(:roll).and_return(roll)

        get :roll

        expect(response.body).to include_json(expected_response)
      end
    end

    context 'with multiple attempt' do
      let(:expected_response) do
        [
          {
            total: 7,
            values: [4, 2],
            constant: 1
          },
          {
            total: 10,
            values: [5, 3],
            constant: 2
          }
        ]
      end

      it 'returns correct payload' do
        allow(DiceRollerService).to receive(:roll).and_return(multi_roll)

        get :roll

        expect(response.body).to include_json(expected_response)
      end
    end
  end
end
