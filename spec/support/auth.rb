# Add functionality for feature testing 
# Code obtained from here: https://stackoverflow.com/questions/32628093/using-devise-in-rspec-feature-tests
module Auth
    def create_student!
      @student = Student.create(email: 'fakeUser@fakemail.com', password: '123456789')
    end
  
    def sign_in_student!
      setup_devise_mapping!
      sign_in @student
    end
  
    def sign_out_user!
      setup_devise_mapping!
      sign_out @student
    end
  
    def setup_devise_mapping!
      @request.env["devise.mapping"] = Devise.mappings[:student]
    end
  
    def login_with_warden!
      login_as(@student, scope: :student)
    end
  
    def logout_with_warden!
      logout(:student)
    end
  
    def login_and_logout_with_devise
      sign_in_student!
      yield
      sign_out_student!
    end
  
    def login_and_logout_with_warden
      Warden.test_mode!
      login_with_warden!
      yield
      logout_with_warden!
      Warden.test_reset!
    end
  end
  