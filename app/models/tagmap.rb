class Tagmap < ApplicationRecord
  belongs_to :job
  belongs_to :tag

  validates :job_id, presence: true
  validates :tag_id, presence: true
end
