class Job < ApplicationRecord
  belongs_to :user
  validates :title,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  has_rich_text :description
end
