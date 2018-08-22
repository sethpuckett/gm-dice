require 'rails_helper'

RSpec.describe DiceRollerController, type: :controller do
  describe 'GET /roll' do
    subject { get :roll }

    it 'has json response type' do
      expect(subject.content_type).to eq('application/json')
    end

    it 'has 200 response' do
      expect(subject.status).to eq(200)
    end
  end
end
