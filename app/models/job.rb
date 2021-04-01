class Job < ApplicationRecord
  validates :title, :status ,:japanese, :salary, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user
  has_many :enrollments

  has_rich_text :description

  def to_s
    title
  end

  

  STATUS = [:"Full-time employee", :"Contract employee", :"part time job"]
  def self.status
    STATUS.map { |status| [status, status] }
  end

  
end
