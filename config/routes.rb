Rails.application.routes.draw do
  get 'proxy/input'
  get 'proxy/view'
  get '/view' => 'proxy#view'
  root 'proxy#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
