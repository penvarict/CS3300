require 'rails_helper'

#from https://github.com/UCCSCS3300/rails-rspec-tutorial/blob/master/README.md

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      login_and_logout_with_warden do
        visit new_project_path
        within("form") do
          fill_in "Title", with: "Test title"
        end
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end

  end

end
