Rails.application.routes.draw do
    resources :tweets
    root 'tweets#index'
    
    get 'get_image/:id', to: 'tweets#get_image'
end
