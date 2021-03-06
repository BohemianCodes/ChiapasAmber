require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) {FactoryBot.create(:user)}
  let(:user2) {FactoryBot.create(:user, email: "user2@user2.com")}

  describe 'GET #show' do
    context "when a user is logged_in" do

      before do
        sign_in user
      end #before

      context "when a user is trying to view another user" do
        it 'redirects to root' do
          get :show, params: { id: user2.id }
          expect(response).to redirect_to(root_path)
        end #it
      end #context

        it "can view user show-page" do
          get :show, params: { id: user.id }
          expect(assigns(:user)).to eq user
        end #it
      end #context

    context "when a user is not logged_in" do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end # it
    end #context
  end #describe get show
end #describe UserController
