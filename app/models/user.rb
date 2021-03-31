class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    email
  end

  def online?
    updated_at > 2.minutes.ago
  end

end
