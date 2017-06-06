require 'rails_helper'

RSpec.feature 'User sees tags on jobs page' do
  scenario 'a user can see appropriate tags on jobs page' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = company.jobs.tags.create!(name:'Software')
    tag_2 = company.jobs.tags.create!(name:'Good-Location')

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content(tag_1.name)
    expect(page).to have_content(tag_2.name)
  end
  scenario 'a user can see how many jobs each tag has'
end
