require 'rails_helper'

describe Order do
  context "belongs to Products" do
    it { should belong_to (:product)}
  end

  context "belongs to User" do
    it { should belong_to (:user)}
  end

end # describe
