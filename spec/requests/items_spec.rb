# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items', type: :request do
  let(:user) { create(:user) }

  describe 'GET /' do
    it 'returns a successful response' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:advertisement) { create(:advertisement, user: user) }

    it 'renders a successful response' do
      get root_path(id: advertisement.id)
      # get '/items/7'
      expect(response).to have_http_status(:success)
    end
  end
end
