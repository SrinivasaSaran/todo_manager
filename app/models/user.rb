class User < ApplicationRecord
  def to_neat_look
    "#{id}. Name: #{name}\n   Email-id: #{email}"
  end
end
