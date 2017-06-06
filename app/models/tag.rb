class Tag < ActiveRecord::Base
  has_many :job_tags
  has_many :jobs, through: :job_tags

  validates :name, presence: true

  def job_count
    jobs.count
  end
end
