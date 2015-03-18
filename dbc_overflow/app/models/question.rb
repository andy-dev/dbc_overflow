class Question < ActiveRecord::Base
  has_many :answers

  validates :title, presence: true,
                     length: {minimum: 5}

  validates :body, presence: true


end


