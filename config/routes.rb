Rails.application.routes.draw do

  resources :categories
  resources :tasks do
  	collection do
  	  get 'finished'
  	  get 'unfinished'
  	  get 'all_tasks'
    end
    post :update_row_order, on: :collection
    get "delete"
    get "complete"
    put "save_complete"
  end

  root to: "tasks#index"

end
