Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'
  get :marketing, to: 'application#marketing'
  get :materials, to: 'application#materials'
  get :lectures, to: 'application#lectures'
  get :guides, to: 'application#guides'
  get :images, to: 'application#images'
  get :documents, to: 'application#documents'
  get :digital, to: 'application#digital'
  get :themes, to: 'application#themes'

  get 'download/:file', as: :download_file, to: 'application#download'
  get 'submit/:type', as: :submit, to: 'application#submit'
end
