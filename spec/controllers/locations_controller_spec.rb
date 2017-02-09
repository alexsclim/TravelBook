require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  let(:user) { create(:user) }
  let(:location) { create(:location, user: user) }

  describe 'GET #index' do

    context 'when user is signed in' do

      login_user

      it 'assigns @users' do
        get :index, params: { user_id: subject.current_user.id }
        expect(assigns(:locations)).to eq(subject.current_user.locations)
      end

      it 'returns http success' do
        get :index, params: { user_id: subject.current_user.id }
        expect(response).to have_http_status(:success)
      end

      it 'responds with json' do
        get :index, params: { user_id: subject.current_user.id }
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'when user is not signed_in' do

      it 'returns http 302' do
        get :index, params: { user_id: user.id }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        get :index, params: { user_id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #new' do

    context 'when user is signed in' do

      login_user

      it 'assigns @location' do
        get :new, params: { user_id: user.id }
        expect(assigns(:location))
      end

      it 'returns http success' do
        get :new, params: { user_id: user.id }
        expect(response).to have_http_status(:success)
      end

      it 'renders the new template' do
        get :new, params: { user_id: user.id }
        expect(response).to render_template(:new)
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        get :new, params: { user_id: user.id }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        get :new, params: { user_id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do

    context 'when user is signed in' do

      login_user

      context 'with valid attributes' do

        it 'creates a new location' do
          expect  {
            post :create, params: { user_id: subject.current_user.id, location: attributes_for(:location) }
          }.to change(Location, :count).by(1)
        end

        it 'returns http 302' do
          post :create, params: { user_id: subject.current_user.id, location: attributes_for(:location) }
          expect(response).to have_http_status(302)
        end

        it 'redirects to the root page' do
          post :create, params: { user_id: subject.current_user.id, location: attributes_for(:location) }
          expect(response).to redirect_to(root_path)
        end
      end

      context 'with invalid attributes' do

        it 'does not save the new location' do
          expect {
            post :create, params: { user_id: subject.current_user.id, location: { address: nil } }
          }.to_not change(Location, :count)
        end

        it 'renders the new template' do
          post :create, params: { user_id: subject.current_user.id, location: { address: nil } }
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
