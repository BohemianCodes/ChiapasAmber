require 'rails_helper'

describe Product do

  context "has many Orders" do
    it {should have_many (:orders)}
  end

  context "has many Comments" do
    it {should have_many (:comments)}
  end

  context "when the product has comments" do
    let(:product) {FactoryBot.create(:product)}
    let(:user) {FactoryBot.create(:user)}
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
    let(:product) {FactoryBot.build(:product, name: "", image_url: "http://www.example.com")}

    it "is not valid without a name" do
      expect(product).not_to be_valid
    end
  end

  context "when Product has an invalid url" do
    let(:product) {FactoryBot.build(:product, name: "Jewelery", image_url: "no-validurl")}

    it "is not valid without a valid url" do
      expect(product).not_to be_valid
    end
  end


end
