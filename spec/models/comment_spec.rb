require 'rails_helper'

describe Comment do

  context "belongs to User" do
      it {should belong_to (:user)}
  end

  context "belongs to Product" do
      it {should belong_to (:product)}
  end

  context "rating is not an integer" do
    let(:product) {FactoryBot.create(:product)}
    let(:user) {FactoryBot.create(:user)}
    let(:comment) {FactoryBot.build(:comment, rating: "xx")}

    it "is not a valid comment" do
      expect(comment).not_to be_valid
    end #it
  end #context

end #describe
