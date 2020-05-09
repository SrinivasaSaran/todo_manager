class User < ApplicationRecord
  has_secure_password
  has_many :todos

  def to_neat_look
    "#{id}. Name: #{username}\n   Email-id: #{email}"
  end
end
