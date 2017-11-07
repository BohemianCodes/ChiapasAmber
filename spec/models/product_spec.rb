require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) {Product.create!(name: "Amber", image_url: "http://www.example.com")}
    let(:user) {User.create!(email: "eliane@gmail.com", password: "123456")}
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful!")
      product.comments.create!(rating: 3, user: user, body: "Ok !")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
      end

    it "returns average rating of comments" do
      expect(product.average_rating).to eq 3

    end
  end

  context "when Product has no name" do
    let(:product) {Product.new(name: "", image_url: "http://www.example.com")}

    it "is not valid without a name" do
      expect(product).not_to be_valid
    end
  end
end
