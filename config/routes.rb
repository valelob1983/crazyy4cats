Rails.application.routes.draw do
  # Configura Devise para manejar la autenticación de usuarios fuera del bloque de publicaciones
  devise_for :users
  
  # Define las rutas para las publicaciones y anida user_comments dentro de publications
  resources :publications do
    resources :user_comments, only: [:create]
  end

  # Ruta para verificar el estado de salud de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check

  # Define la ruta raíz
  root "publications#index"
end


