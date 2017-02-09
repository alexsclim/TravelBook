require 'rails_helper'

RSpec.describe TripsController, type: :controller do

  let(:user) { create(:user) }
  let(:trip) { create(:trip, user: user)}
  let(:location) { create(:location, user: user, location: location) }

  describe 'GET #index' do

    it 'assigns @trips' do
      get :index, params: { user_id: user.id }
      expect(assigns(:trips)).to eq(user.trips)
    end

    it 'returns http success' do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do

    context 'when user is signed in' do

      login_user

      it 'assigns @trip' do
        get :new, params: { user_id: user.id }
        expect(assigns(:trip))
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

        it 'creates a new trip' do
          expect  {
            post :create, params: { user_id: subject.current_user.id, trip: attributes_for(:trip) }
          }.to change(Trip, :count).by(1)
        end

        it 'returns http 302' do
          post :create, params: { user_id: subject.current_user.id, trip: attributes_for(:trip) }
          expect(response).to have_http_status(302)
        end

        it 'redirects to the root page' do
          post :create, params: { user_id: subject.current_user.id, trip: attributes_for(:trip) }
          expect(response).to redirect_to(user_trips_path)
        end
      end

      context 'with invalid attributes' do

        it 'does not save the new trip' do
          expect {
            post :create, params: { user_id: subject.current_user.id, trip: { address: nil } }
          }.to_not change(Trip, :count)
        end

        it 'renders the new template' do
          post :create, params: { user_id: subject.current_user.id, trip: { address: nil } }
          expect(response).to render_template(:new)
        end

        it 'returns http 200' do
          post :create, params: { user_id: subject.current_user.id, trip: { address: nil } }
          expect(response).to have_http_status(:success)
        end

        it 'renders the new template' do
          post :create, params: { user_id: subject.current_user.id, trip: { address: nil } }
          expect(response).to render_template(:new)
        end
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        post :create, params: { user_id: trip.user_id, trip: attributes_for(:trip) }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        post :create, params: { user_id: trip.user_id, trip: attributes_for(:trip) }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #show' do

    context 'when user is signed in' do

      login_user

      it 'assigns @trip' do
        get :show, params: { user_id: trip.user_id, id: trip.id }
        expect(assigns(:trip)).to eq(trip)
      end

      it 'returns http success' do
        get :show, params: { user_id: trip.user_id, id: trip.id }
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        get :show, params: { user_id: trip.user_id, id: trip.id }
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'DELETE #destroy' do

    context 'when user is signed in' do

      login_user

      before(:each) do
        subject.current_user.trips.create(attributes_for(:trip))
      end

      it 'deletes a trip' do
        expect {
          delete :destroy, params: { user_id: subject.current_user.id, id: subject.current_user.trips.first.id }
        }.to change(Trip, :count).by(-1)
      end

      it 'returns http 302' do
        delete :destroy, params: { user_id: subject.current_user.id, id: subject.current_user.trips.first.id }
        expect(response).to have_http_status(302)
      end

      it "redirects to root path" do
        delete :destroy, params: { user_id: subject.current_user.id, id: subject.current_user.trips.first.id }
        expect(response).to redirect_to(user_trips_path)
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        delete :destroy, params: { user_id: trip.user_id, id: trip.id }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        delete :destroy, params: { user_id: trip.user_id, id: trip.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
