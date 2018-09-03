Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "chat#index"
  get "/new" => "registration#new"
  post "/new" => "registration#create"
  get "/load_chat" => "chat#load_chat"
  post "/add_message" => "chat#add_message"
end
