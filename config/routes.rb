Go::Application.routes.draw do
  root :to => 'links#index'

  resources :links

  match "/:shortcut" => "links#show"
  match "/:shortcut/*path" => "links#show"
end
