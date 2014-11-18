require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "returns the name as a string of first name and last name" do
    user = FactoryGirl.create(:user)

    expect(user.name).to eq(user.first_name + " " + user.last_name)
  end
end
