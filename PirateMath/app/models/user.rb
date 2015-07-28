class User < ActiveRecord::Base
  # belongs_to :school

  # validates :username, presence: true, uniqueness: true, length: { in: 3..16 }
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  has_secure_password
end
