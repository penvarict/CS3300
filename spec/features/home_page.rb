require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path #(in routes) root "projects#index"
    expect(page).to have_text("Projects")
  end

  context "A logged in user shoud be able to remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "should be sucessful" do
      login_and_logout_with_warden do    
        visit root_path
        click_button "Destroy"
        expect(page).to have_content("Project was successfully destroyed")
        expect(Project.count).to eq(0)
      end
    end
  
  end
  
end