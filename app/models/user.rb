class User < ApplicationRecord
  has_secure_password
  has_many :todos
  validates :username, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true

  def to_neat_look
    "#{id}. Name: #{username}\n   Email-id: #{email}"
  end
end
