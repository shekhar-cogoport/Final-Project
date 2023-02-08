Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/article/create', to: 'article#create' #-1
  get '/article', to: 'article#show'    #-2
  delete '/article/delete/:id', to: 'article#delete'   #-3
  get '/article/explicit/:id', to: 'article#explicit'    #-4


  post '/category/create', to: 'category#create'       #-5
  get '/category', to: 'category#show'                 #-6
  delete '/category/delete/:id', to: 'category#delete'  #-7
  get '/categorywisearticle/:id' , to: 'category#articlecategory' #-8

  get '/find',to: 'article#category'  #-9
  get '/login', to: 'sessions#new'    #-10

  post '/auth/login', to: 'authentication#login'   #-11
  delete '/sessions', to: 'sessions#destroy'      #-12

  get '/author/show', to: 'author#index'       #13
  get '/author/signup', to: 'author#new'       #14
  post '/author/create', to: 'author#create'    #15
  get '/author/pershow', to: 'author#show'        #16
  put '/author/edit', to: 'author#edit'      #17
  delete '/author/delete/:id', to: 'author#delete' #18
  get 'author/presarticle/:id', to: 'author#userarticle' #19
  
  put '/nooflike/:id', to: 'like#create' #20
  get  '/category/filter/:id', to: 'connectcategory#index'  #21
end
