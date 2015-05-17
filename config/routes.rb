Rails.application.routes.draw do

 root 'main#index'
 get '/index', to: 'main#index'
 get "/events", to: "main#events"
 get "/about", to: "main#about"
 get "/teams", to: "main#teams"
 get "/results", to: "main#results"
 get "/team/:id", to: "team#show"
 get "/event/create", to: "event#create"
 get "/event/:id", to: "event#show"
 get "/register", to: "main#register"
 get "/logout", to: "main#logout"
 
 
 #post it bitch
 post "/", to: 'main#index'
 post '/index', to: 'main#index'
 post "/events", to: "main#index"
 post "/about", to: "main#index"
 post "/teams", to: "main#index"
 post "/results", to: "main#index"
 post "/event/create", to: "event#create"
 post "/team/:id", to: "main#index"
 post "/event/:id", to: "main#index"
 post "/register", to: "main#register"
 
 
end
