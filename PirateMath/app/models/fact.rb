class Fact < ActiveRecord::Base
  has_many :questions
  has_many :practices, through: :questions
end
