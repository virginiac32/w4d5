require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "redirects to goals index page" do
        post :create, user: {username: "virginia", password: "password123"}
        expect(response).to redirect_to(goals_url)
      end
    end

    context "with invalid params" do
      it "renders new user page" do
        post :create, user: {username: "jeff"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

    end
  end

end
