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
        post :create, :params => {product_id: product.id, comment: {body: 'asdasdasd', rating: 3}}
      }.to change(Comment, :count).by(1)
    end #it
  end #context

  context "admin use of comments" do

    before do
      sign_in admin
      @product = FactoryBot.create(:product)
      @comment = FactoryBot.create(:comment)
    end

    it "deletes a comment from database" do
      expect {
        delete :destroy, :params => {product_id: @product.id, comment: @comment}
      }.to change(Comment, :count).by(1)
    end
  end


end #describe
