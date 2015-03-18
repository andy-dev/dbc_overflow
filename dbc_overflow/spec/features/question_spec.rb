require 'rails_helper'

describe "add new question", :js => true do

  it "creates a new question" do
    visit new_question_path
    fill_in 'Title', :with => 'question one'
    fill_in 'Body', :with => 'what the heck'

    click_button 'Save Question'

    expect(page).to have_content 'question one'
    expect(page).to have_content 'what the heck'
  end
end