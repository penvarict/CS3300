require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path #(in routes) root "projects#index"
    expect(page).to have_text("Projects")
  end
  
end