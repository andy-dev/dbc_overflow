class Question < ActiveRecord::Base
  has_many :answers

end


# validates :title, presence: true,
#                     length: {minimum: 5}