Rails.application.routes.draw do
  resource :home
  devise_for :users
  #ActiveAdmin.routes(self)
  root 'home#index'
  post 'index' => 'home#index'
  match 'submit_answer' => 'tests#submit_answer', via: [:get,:post]
  match 'testquestions/:id' => 'tests#show' ,as: 'testquestions'  ,via: [:get,:post]
  match 'testsubmit/:id' => 'tests#final_submition', as: 'testsubmit' , via: [:get,:post]
  get 'contact_us' => 'home#contact_us'
  get 'about_us' => 'home#about_us'
  get 'check_test' => 'tests#check_test'
  get 'check_duration' => 'tests#check_duration'
  match 'skip_question' => 'tests#skip_question', as: 'skip' ,via: [:get,:post]
end
