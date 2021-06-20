Rails.application.routes.draw do

  root to: 'travel#index'

  get 'travel/search'
  
end
