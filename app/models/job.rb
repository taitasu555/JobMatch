class Job < ApplicationRecord
  validates :title, :status ,:japanese, :salary, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user
  has_many :enrollments
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  has_rich_text :description

  def to_s
    title
  end

  def self.jobs_serach(search)
    Job.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end
 
  def save_jobs(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
  
    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    # Create
    new_tags.each do |new_name|
      job_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << job_tag
    end
  end
  

  STATUS = [:"Full-time employee", :"Contract employee", :"part time job"]
  def self.status
    STATUS.map { |status| [status, status] }
  end

  
end
