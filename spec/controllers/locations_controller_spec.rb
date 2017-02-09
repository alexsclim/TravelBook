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

        it 'returns http 200' do
          post :create, params: { user_id: subject.current_user.id, location: { address: nil } }
          expect(response).to have_http_status(:success)
        end

        it 'renders the new template' do
          post :create, params: { user_id: subject.current_user.id, location: { address: nil } }
          expect(response).to render_template(:new)
        end
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        post :create, params: { user_id: location.user_id, location: attributes_for(:location) }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        post :create, params: { user_id: location.user_id, location: attributes_for(:location) }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'PUT #update' do

    context 'when user is signed in' do

      login_user

      context 'with valid attributes' do

        it 'located the requested location' do
          put :update, params: { user_id: location.user_id, id: location.id, location: attributes_for(:location) }
          expect(assigns(:location)).to eq(location)
        end

        it 'changes the attributes of the requested location' do
          put :update, params: { user_id: location.user_id, id: location.id, location: attributes_for(:location, description: 'Hello World!') }
          location.reload
          expect(location.description).to eq("Hello World!")
        end

        it 'returns http 302' do
          put :update, params: { user_id: location.user_id, id: location.id, location: attributes_for(:location, description: 'Hello World!') }
          expect(response).to have_http_status(302)
        end

        it 'redirects to root path' do
          put :update, params: { user_id: location.user_id, id: location.id, location: attributes_for(:location, description: 'Hello World!') }
          expect(response).to redirect_to root_url
        end
      end

      context 'with invalid attributes' do

        it 'located the requested location' do
          put :update, params: { user_id: location.user_id, id: location.id, location: { address: nil } }
          expect(assigns(:location)).to eq(location)
        end

        it 'does not change the attributes of the requested location' do
          put :update, params: { user_id: location.user_id, id: location.id, location: { address: nil, description: 'Hello World!' } }
          location.reload
          expect(location.description).to_not eq("Hello World!")
        end

        it 'returns http 200' do
          put :update, params: { user_id: location.user_id, id: location.id, location: { address: nil } }
          expect(response).to have_http_status(:success)
        end

        it 'renders the edit template' do
          put :update, params: { user_id: location.user_id, id: location.id, location: { address: nil } }
          expect(response).to render_template(:edit)
        end
      end
    end


    context 'when user is not signed in' do

      it 'returns http 302' do
        put :update, params: { user_id: location.user_id, id: location.id, location: attributes_for(:location) }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        put :update, params: { user_id: location.user_id, id: location.id, location: attributes_for(:location) }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE #destroy' do

    context 'when user is signed in' do

      login_user

      before(:each) do
        subject.current_user.locations.create(attributes_for(:location))
      end

      it 'deletes a location' do
        expect {
          delete :destroy, params: { user_id: subject.current_user.id, id: subject.current_user.locations.first.id }
        }.to change(Location, :count).by(-1)
      end

      it 'returns http 302' do
        delete :destroy, params: { user_id: subject.current_user.id, id: subject.current_user.locations.first.id }
        expect(response).to have_http_status(302)
      end

      it "redirects to root path" do
        delete :destroy, params: { user_id: subject.current_user.id, id: subject.current_user.locations.first.id }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        delete :destroy, params: { user_id: location.user_id, id: location.id }
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        delete :destroy, params: { user_id: location.user_id, id: location.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
