class User < ApplicationRecord
  has_many :jobs
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    email
  end

  def online?
    updated_at > 2.minutes.ago
  end

end
