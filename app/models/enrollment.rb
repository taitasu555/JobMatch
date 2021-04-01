class Enrollment < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :user, :job, presence: true
end
