require 'rails_helper'

RSpec.describe AsksController, :type => :controller do
  describe "GET index" do
    it "assigns @asks" do
      ask = FactoryGirl.create(:ask)
      get :index
      expect(assigns(:asks)).to eq([ask])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before { @ask = FactoryGirl.create(:ask) }

    it "assigns @ask" do
      get :show, id: @ask
      expect(assigns(:ask)).to eq(@ask)
    end

    it "renders the show template" do
      get :show, id: @ask
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns a new Ask to @ask" do
      get :new
      expect(assigns(:ask)).to be_a_new(Ask)
    end

    it "renders the new template" do
      user = FactoryGirl.create(:user)
      sign_in user
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new ask in the database" do
        user = FactoryGirl.create(:user)
        sign_in user

        expect{ post :create, ask: FactoryGirl.attributes_for(:ask) }.to change{ Ask.all.size }.by(1)
      end

      it "does not save ask without user" do
        expect{ post :create, ask: FactoryGirl.attributes_for(:ask) }.to change{ Ask.all.size }.by(0)
      end
    end
  end

  describe "PUT update" do
    before { @ask = FactoryGirl.create(:ask) }

    it "located the requested @ask" do
      put :update, id: @ask, ask: FactoryGirl.attributes_for(:ask)
      expect(assigns(:ask)).to eq(@ask)
    end

    it "changes @ask attributes" do
      put :update, id: @ask, ask: FactoryGirl.attributes_for(:ask, project_name: "updated")
      @ask.reload
      expect(@ask.project_name).to eq("updated")
    end

  end

  describe "DELETE destroy" do
    before do
      @user = FactoryGirl.create(:user)
      @ask = FactoryGirl.create(:ask, user: @user)
    end

    it "deletes the ask" do
      sign_in @user
      expect{ delete :destroy, id: @ask }.to change{ Ask.all.size }.by(-1)
    end

    it "does not delete ask if it does not belong to current user" do
      expect{ delete :destroy, id: @ask }.to change{ Ask.all.size }.by(0)
    end
  end
end
