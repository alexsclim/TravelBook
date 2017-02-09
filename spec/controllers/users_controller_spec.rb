require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET #index' do

    context 'when user is signed in' do

      login_user

      it 'assigns @users' do
        get :index
        expect(assigns(:users)).to eq([subject.current_user, user])
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when user is not signed_in' do

      it 'returns http 302' do
        get :index
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #show' do

    context 'when user is signed in' do

      login_user

      it 'assigns @user' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end

      it 'returns http success' do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        get :index
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #following" do

    context 'when user is signed in' do

      login_user

      it 'assigns @users' do
        get :following, params: { id: user.id }
        expect(assigns(:users)).to eq(user.following)
      end

      it 'returns http success' do
        get :following, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        get :following, params: { id: user.id }
        expect(response).to render_template(:show_follow)
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        get :index
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #followers" do
    context 'when user is signed in' do

      login_user

      it 'assigns @users' do
        get :followers, params: { id: user.id }
        expect(assigns(:users)).to eq(user.followers)
      end

      it 'returns http success' do
        get :followers, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        get :followers, params: { id: user.id }
        expect(response).to render_template(:show_follow)
      end
    end

    context 'when user is not signed in' do

      it 'returns http 302' do
        get :index
        expect(response).to have_http_status(302)
      end

      it 'redirects to sign in' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
