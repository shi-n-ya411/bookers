Rails.application.routes.draw do
# constraints host: 'old.example.net' do
#   get '/(*path)', to: redirect { |path_params,| "https://new.example.com/#{path_params[:path]}" }
# end
  # get 'bookers_taka.com', to: 'homes#top'

  get 'top' => 'homes#top'
  get 'books/index'
  get 'books/show'
  get 'books/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
