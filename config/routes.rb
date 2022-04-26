Rails.application.routes.draw do
  devise_for :students
  root "projects#index"
  get '/projects/new', to: "projects#new"
  get '/projects/edit', to: "projects#edit"
  get '/projects/:id', to: "projects#show" 
  get '/students/sign_in(.:format)', to: "devise/sessions#new"
  

  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
