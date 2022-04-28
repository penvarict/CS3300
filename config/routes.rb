Rails.application.routes.draw do
  devise_for :students
  root "projects#index"
  get '/projects/new', to: "projects#new"
  get '/projects/edit', to: "projects#edit"
  get '/projects/:id', to: "projects#show" 
  get '/students/sign_in(.:format)', to: "devise/sessions#new"

  resources :projects
  # See https://stackoverflow.com/a/5911863 for how the routing below works. (it is for the about me page)
  get '/:page' =>   "static#show"
  
end
