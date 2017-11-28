require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:product) {FactoryBot.create(:product)}
  let(:user) {FactoryBot.create(:user)}
  let(:admin) {FactoryBot.create(:admin)}
  let(:comment) {FactoryBot.create(:comment)}

  context "create valid comment" do

    before do
      sign_in user
    end

    it "saves comment to database" do
      expect {
        post :create, {comment: {body: 'asdasdasd', rating: 3}}
      }.to change(Comment, :count).by(1)
    end

    it "shows flash of success" do
    end



  end

end
