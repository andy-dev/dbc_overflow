require 'rails_helper'

RSpec.describe Answer, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe Answer do
    it "is invalid without a title" do
      answer = Answer.new(title: nil)
      answer.valid?
      expect(answer.errors[:title]).to include("can't be blank")
    end
    it "is invalid without a body" do
      answer = Answer.new(body: nil)
      answer.valid?
      expect(answer.errors[:body]).to include("can't be blank")
    end
  end
end
