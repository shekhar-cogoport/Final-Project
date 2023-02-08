Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/article/create', to: 'article#create'
  get '/article', to: 'article#show'
  delete '/article/delete/:id', to: 'article#delete'
  get '/article/explicit/:id', to: 'article#explicit'


  post '/category/create', to: 'category#create'
  get '/category', to: 'category#show'
  delete '/category/delete/:id', to: 'category#delete'
  get '/categorywisearticle/:id' , to: 'category#articlecategory'

  get '/find',to: 'article#category'
  get '/login', to: 'sessions#new'

  post '/auth/login', to: 'authentication#login'
  delete '/sessions', to: 'sessions#destroy'

  get '/author/show', to: 'author#index'
  get '/author/signup', to: 'author#new'
  post '/author/create', to: 'author#create'
  get '/author/show', to: 'author#show'
  put '/author/edit', to: 'author#edit'
  delete '/author/delete/:id', to: 'author#delete'
  get 'author/presarticle/:id', to: 'author#userarticle'
  
  put '/nooflike/:id', to: 'like#create'
  get  '/category/filter/:id', to: 'connectcategory#index'
end
