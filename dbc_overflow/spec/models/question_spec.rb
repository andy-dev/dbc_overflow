require 'rails_helper'

RSpec.describe Question, type: :model do
  describe Question do
    it "is invalid without a title" do
      question = Question.new(title: nil)
      question.valid?
      expect(question.errors[:title]).to include("can't be blank")
    end
    it "is invalid without a body" do
      question = Question.new(body: nil)
      question.valid?
      expect(question.errors[:body]).to include("can't be blank")
    end

  end
end



#pending "add some examples to (or delete) #{__FILE__}"
 # xit "returns a contact's full name as a string"
