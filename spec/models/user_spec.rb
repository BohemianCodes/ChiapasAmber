require 'rails_helper'

describe User do
  context "when User is created" do
    let(:user) {User.new(email: "", password: 123456)}

    it "is not valid without email" do
      expect(user).not_to be_valid
    end
  end

end
