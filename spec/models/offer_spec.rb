require 'rails_helper'

RSpec.describe Offer, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:offer)).to be_valid
  end

  it "is invalid without a body of at least 140 characters" do
    expect(FactoryGirl.build(:offer, body: nil)).to be_invalid
  end
end
