class User < ApplicationRecord
  rolify
  has_many :jobs
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    email
  end

  def online?
    updated_at > 2.minutes.ago
  end

  # rolifyを使用して就活生、リクルーターを作成
  after_create :assign_default_role
  
  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:recruiter)
      self.add_role(:user)
    else
      self.add_role(:user) if self.roles.blank?
      self.add_role(:recruiter) 
    end
  end

end
