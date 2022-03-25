require "rails_helper"
# controller unit tests for Projects

# from rspec tutorial:
# https://github.com/UCCSCS3300/rails-rspec-tutorial/blob/master/README.md

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
    it "renders the index template" do
        get :index
        # expect(response.success).to eq(true)
        expect(response).to render_template("index")
      end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
      
    end
    
    it "renders the show template" do 
        get :show, params: { id: project }
        expect(response).to render_template("show")
    end

  end
end