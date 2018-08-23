# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiceRollerController, type: :controller do
  describe 'GET /roll' do
    it 'has json response type' do
      get :roll
      expect(subject.content_type).to eq('application/json')
    end

    it 'has 200 response' do
      get :roll
      expect(subject.status).to eq(200)
    end

    it 'calls dice roller service with no paramaters' do
      expect(DiceRollerService).to receive(:roll)
      get :roll
    end

    it 'calls dice roller service with parameters' do
      expect(DiceRollerService).to receive(:roll).with(count: 2, sides: 8, constant: 1, attempts: 2).and_return({ })

      get :roll, params: { count: 2, sides: 8, constant: 1, attempts: 2 }
    end
  end
end
