require 'rails_helper'

RSpec.describe OffersController, :type => :controller do
  before do
    @user1 = FactoryGirl.create(:user, email: "user1@example.com")
    @user2 = FactoryGirl.create(:user, email: "user2@example.com")
    @ask = FactoryGirl.create(:ask, user: @user1)
  end

  describe "POST create" do
    it "saves the new offer in the database" do
      sign_in @user2

      expect{ post :create, ask_id: 1, offer: FactoryGirl.attributes_for(:offer, ask: @ask, user: @user2) }.to change{ Offer.all.size }.by(1)
    end

    it "does not save offer if ask.user is the same as offer.user" do
      sign_in @user1

      expect{ post :create, ask_id: 1, offer: FactoryGirl.attributes_for(:offer, ask: @ask, user: @user1) }.to change{ Offer.all.size }.by(0)
    end

    it "saves only one offer for each user for each ask" do
      sign_in @user1

      expect{ post :create, ask_id: 1, offer: FactoryGirl.attributes_for(:offer, ask: @ask, user: @user1) }.to change{ Offer.all.size }.by(0)
    end
  end

  describe "PUT update" do
    before { @offer = FactoryGirl.create(:offer, ask: @ask, user: @user1) }

    it "assigns @offer" do
      put :update, ask_id: 1, id: @offer, offer: FactoryGirl.attributes_for(:offer)
      expect(assigns(:offer)).to eq(@offer)
    end
  end

  describe "DELETE destroy" do
    before do
      @ask2 = FactoryGirl.create(:ask, user: @user1)
      @offer = FactoryGirl.create(:offer, ask: @ask2, user: @user2)
    end

    it "deletes @offer belonging to user" do
      sign_in @user2
      expect{ delete :destroy, ask_id: 2, id: @offer }.to change{ Offer.all.size }.by(-1)
    end
  end
end
