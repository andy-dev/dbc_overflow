require 'rails_helper'

describe QuestionsController do
  describe "Get index" do

    it "assigns @questions instace variable" do
      question= Question.create(title:"question one", body:"what the hell")
      get :index
      expect(assigns(:questions)).to eq([question])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "returns a status of 200" do
      expect(response.status).to eq(200)
    end
  end
end


