require 'rails_helper'

describe "add new question", :js => true do

  # before :each do
  #   Question.make(:title => 'question one', :body=> 'what the heck')
  # end

  it "create a new question" do
    visit new_question_path
      fill_in 'Title', :with => 'question one'
      fill_in 'Body', :with => 'what the heck'

    click_button 'Save Question'
    expect(page).to have_content 'question one'
  end
end