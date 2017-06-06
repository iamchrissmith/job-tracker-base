require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    it { should validate_presences_of(:name) }
  end

  describe "relationships" do
    it { should have_many(:jobs).through(:tag_jobs) }
  end

  describe ".job_count" do
    it "should return the number of jobs" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      job_2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      tag_1 = job.tags.create!(name:'Software')

      expect(tag_1.job_count).to eq 1

      job_2.tags << tag_1

      expect(tag_1.job_count).to eq 2

    end
  end
end
