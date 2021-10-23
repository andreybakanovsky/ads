# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/advertisements', type: :request do
  # Advertisement. As you add validations to Advertisement, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user) }
  let(:another_user) { create(:user, email: 'another@mail.com') }
  # let(:advertisement) { create(:advertisement) }
  # let(:valid_attributes) do
  #   skip('Add a hash of attributes valid for your model')
  # end

  # let(:invalid_attributes) do
  #   skip('Add a hash of attributes invalid for your model')
  # end

  before { sign_in user }

  describe 'GET /index' do
    it 'renders a successful response' do
      get advertisements_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_advertisement_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:advertisement) { create(:advertisement, user: user) }

    it 'renders a successful response' do
      # get advertisement_path(id: advertisement.id) other variant
      get advertisement_path(advertisement)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    let(:advertisement) { create(:advertisement, user: user) }

    it 'renders a successful response' do
      get edit_advertisement_path(advertisement)
      expect(response).to have_http_status(:success)
    end

    # context 'when the ad belongs to another user' do
    #   let(:advertisement) { create(:advertisement, user: another_user) }

    #   it 'redirects to advertisements page' do
    #     get edit_advertisement_path(advertisement)
    #     expect(response).to redirect_to(advertisements_path)
    #   end
    # end
  end

  describe 'POST /create' do
    context 'when passed valid parameters' do
      let(:advertisement_params) do
        {
          advertisement: {
            user_id: user.id,
            content: 'something'
          }
        }
      end

      it 'create new ad' do
        expect { post advertisements_path, params: advertisement_params }.to change(Advertisement, :count).by(+1)
      end

      it 'redirects to the created ad' do
        post advertisements_path, params: advertisement_params
        expect(response).to redirect_to(advertisement_path(Advertisement.last))
      end
    end

    context 'when passed invalid parameters' do
      let(:advertisement_invalid_params) do
        {
          advertisement: {
            user_id: user.id,
            content: ''
          }
        }
      end

      it 'does not created new ad' do
        expect { post advertisements_path, params: advertisement_invalid_params }.not_to change(Advertisement, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post advertisements_path, params: advertisement_invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    let(:advertisement) { create(:advertisement, user: user) }
    let(:new_advertisement_params) do
      {
        advertisement: {
          user_id: user.id,
          content: 'something new'
        }
      }
    end

    context 'with valid parameters' do
      it 'updates the requested advertisement' do
        patch advertisement_path(advertisement), params: new_advertisement_params

        expect(advertisement.reload.content).to eq('something new')
      end

      it 'redirects to the ad' do
        patch advertisement_path(advertisement), params: new_advertisement_params
        expect(response).to redirect_to(advertisement_path(advertisement))
      end
    end

    context 'with invalid parameters' do
      let(:advertisement_new_invalid_params) do
        {
          advertisement: {
            user_id: user.id,
            content: ''
          }
        }
      end

      it 'does not modifies the ad' do
        patch advertisement_path(advertisement), params: advertisement_new_invalid_params
        expect(advertisement.reload.content).to eq('it_s text of ad')
      end

      it 'renders edit action' do
        patch advertisement_path(advertisement), params: advertisement_new_invalid_params
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroy the ad' do
      advertisement = create(:advertisement, user: user) # why not let
      expect { delete advertisement_path(advertisement) }.to(change(Advertisement, :count).from(1).to(0))
    end

    it 'redirects to the advertisements list' do
      advertisement = create(:advertisement, user: user) # why
      delete advertisement_path(advertisement) # or advertisement_path(id: advertisement.id)
      expect(response).to redirect_to(advertisements_path)
    end
  end

  # +
  # describe 'GET /index' do
  #   it 'renders a successful response' do
  #     Advertisement.create! valid_attributes
  #     get advertisements_url
  #     expect(response).to be_successful
  #   end
  # end

  # +
  # describe 'GET /show' do
  #   it 'renders a successful response' do
  #     advertisement = Advertisement.create! valid_attributes
  #     get advertisement_url(advertisement)
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET /new' do
  #   it 'renders a successful response' do
  #     get new_advertisement_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET /edit' do
  #   it 'render a successful response' do
  #     advertisement = Advertisement.create! valid_attributes
  #     get edit_advertisement_url(advertisement)
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     it 'creates a new Advertisement' do
  #       expect do
  #         post advertisements_url, params: { advertisement: valid_attributes }
  #       end.to change(Advertisement, :count).by(1)
  #     end

  #     it 'redirects to the created advertisement' do
  #       post advertisements_url, params: { advertisement: valid_attributes }
  #       expect(response).to redirect_to(advertisement_url(Advertisement.last))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new Advertisement' do
  #       expect do
  #         post advertisements_url, params: { advertisement: invalid_attributes }
  #       end.to change(Advertisement, :count).by(0)
  #     end

  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post advertisements_url, params: { advertisement: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested advertisement' do
  #       advertisement = Advertisement.create! valid_attributes
  #       patch advertisement_url(advertisement), params: { advertisement: new_attributes }
  #       advertisement.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'redirects to the advertisement' do
  #       advertisement = Advertisement.create! valid_attributes
  #       patch advertisement_url(advertisement), params: { advertisement: new_attributes }
  #       advertisement.reload
  #       expect(response).to redirect_to(advertisement_url(advertisement))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       advertisement = Advertisement.create! valid_attributes
  #       patch advertisement_url(advertisement), params: { advertisement: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested advertisement' do
  #     advertisement = Advertisement.create! valid_attributes
  #     expect do
  #       delete advertisement_url(advertisement)
  #     end.to change(Advertisement, :count).by(-1)
  #   end

  #   it 'redirects to the advertisements list' do
  #     advertisement = Advertisement.create! valid_attributes
  #     delete advertisement_url(advertisement)
  #     expect(response).to redirect_to(advertisements_url)
  #   end
  # end
end
