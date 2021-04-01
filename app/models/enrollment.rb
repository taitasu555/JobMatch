class Enrollment < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :user, :job, presence: true

  validates_uniqueness_of :user_id, scope: :job_id 
  validates_uniqueness_of :job_id, scope: :user_id 

  # リクルーターが求人にapplyすることを防ぐ
  validate :cant_subscribe_to_own_job  

  protected

  def cant_subscribe_to_own_job
    if self.new_record?
      if self.user_id.present?
        if self.user_id == job.user_id
          errors.add(:base, "You can not apply to your job")
        end
      end
    end
  end
end
