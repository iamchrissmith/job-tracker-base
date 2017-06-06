class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  
  has_many :job_tags
  has_many :tags, through: :job_tags
end
