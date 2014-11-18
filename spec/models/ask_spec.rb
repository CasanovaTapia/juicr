require 'rails_helper'

RSpec.describe Ask, :type => :model do
  it "has a valid factory" do
    FactoryGirl.create(:ask).should be_valid
  end

  it "is invalid without a project name" do
    FactoryGirl.build(:ask, project_name: nil).should_not be_valid
  end

  it "is invalid without a project description" do
    FactoryGirl.build(:ask, project_description: nil).should_not be_valid
  end

  it "is invalid without skills" do
    FactoryGirl.build(:ask, skills: nil).should_not be_valid
  end

  it "is invalid without a time commitment" do
    FactoryGirl.build(:ask, time_commitment: nil).should_not be_valid
  end

  it "is invalid without a location" do
    FactoryGirl.build(:ask, location: nil).should_not be_valid
  end

  it "is invalid without expectations" do
    FactoryGirl.build(:ask, expectations: nil).should_not be_valid
  end

  describe "shows accepted offers" do
    context "no offers" do
      ask = FactoryGirl.create(:ask)
      ask.has_accepted_offer?.should == false
    end
  end
end
