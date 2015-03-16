require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


describe QuestionsController do


  describe "index" do
    it "renders the index template" do
      get :index
      response.should contain("Listing all Questions")
    end

    it "renders the questions/index template" do
      get :index
      response.should contain("Listing all Questions")
    end
  end
end