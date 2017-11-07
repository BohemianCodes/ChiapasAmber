require 'rails_helper'

describe Comment do
  context "rating is not an integer" do
    let(:product) {Product.create!(name: "Amber", image_url: "http://www.example.com")}
    let(:user) {User.create!(email: "eliane@gmail.com", password: "123456")}
    let(:comment) {Comment.new(body: "Meh", user: user, product: product, rating: "xx")}

    it "is not a valid comment" do
      expect(comment).not_to be_valid
    end
  end
end
