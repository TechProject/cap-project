Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  resources :programs do  
    member do  
      post 'like'
    end
  end
  
  resources :developers, except: [:new] 
  
  get '/register', to: 'developers#new'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"  
  get '/logout', to: "logins#destroy"
  
  
  
  

  
end
