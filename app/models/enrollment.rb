class Enrollment < ApplicationRecord
  belongs_to :job
  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"
  has_many :messages
  
  validates :to_user, :job, :from_user_id, presence: true

  validates_uniqueness_of :to_user_id, scope: :job_id 
  validates_uniqueness_of :job_id, scope: :to_user_id 

  # リクルーターが求人にapplyすることを防ぐ
  



  
end
