YoPrevengo::Application.routes.draw do
  
  resources :users
  resources :user_sessions
  resources :user_types

  resources :matrix_headers
  resources :risk_matrices   
  resources :preventive_procedures  
  resources :risks_damages
  resources :criteria_types
  resources :activity_types
  resources :damages

  resources :companies do
    resources :work_areas  
    resources :evaluation_criteries
  end  

  resources :work_areas do 
      resources :work_flows
  end   

  resources :work_flows do 
    resources :activities
  end

  resources :activities do
    resources :unitary_tasks
  end

  resources :dangers do
    resources :risks
  end 
  
  
  get "welcome/index"

  match 'listar' => 'unitary_tasks#list', as: :listar

  ############### Usuarios ############
  match 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout
  match 'asignarRol/:id' => 'users#asignarRol', :as => :asignarRol

  #generar nueva matriz
  match 'new_matriz/:id' => 'matrix_headers#new_matriz', as: :new_matriz
  match 'borrar_cabecera/:id' => 'matrix_headers#borrar_cabecera', as: :borrar_cabecera
  match 'generar_nueva_matriz/:id' => 'risk_matrices#generar_nueva_matriz', as: :generar_nueva_matriz

  #generar matrices existentes  
  match 'asignar/:id/asignar' => 'matrix_headers#asignar', as: :asignar
  match 'quitar_riesgo/:id/' => 'matrix_headers#quitar_riesgo', as: :quitar_riesgo

  match 'generar_matriz/:id' => 'risk_matrices#generar_matriz', as: :generar_matriz  
  match 'actualizar_riesgo_evaluado/:id' => 'risk_matrices#actualizar_riesgo_evaluado', as: :actualizar_riesgo_evaluado
  match 'ver_matriz/:id' => 'risk_matrices#ver_matriz', as: :ver_matriz

  #procedimientos
  match 'generar_procedimiento/:id' => 'preventive_procedures#generar_procedimiento', as: :generar_procedimiento
  match 'ver_procedimiento/:id' => 'preventive_procedures#ver_procedimiento', as: :ver_procedimiento
  match 'actualizar_procedimiento/:id' => 'preventive_procedures#actualizar_procedimiento', as: :actualizar_procedimiento

  #usuarios
  match 'users/:id/actualizar_datos' => 'users#actualizar_datos', as: :actualizar_datos
  match 'editarpassword/:id/edit_password' => 'users#edit_password', as: :edit_password
  match 'update_password/:id' => 'users#update_password', as: :update_password


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
