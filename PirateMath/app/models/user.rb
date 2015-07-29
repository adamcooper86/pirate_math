class User < ActiveRecord::Base
  has_many :practices
  # belongs_to :school

  # validates :username, presence: true, uniqueness: true, length: { in: 3..16 }
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  has_secure_password
end
