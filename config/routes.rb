CafApp::Application.routes.draw do
  resources :social_brands


  resources :social_links


  resources :unit_assignments


  resources :contents

  match 'contacts' => 'contents#show', :id => 3, :as => :contacts


  post 'preview', :to => 'previews#show', :as => :preview

  resources :menus
  resources :menus do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'menu_versions#diff'
        put 'rollback', :to => 'menu_versions#rollback'
      end
    end
  end

  resources :menus do
    collection { post :sort}
  end

  resources :units
  resources :units do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'unit_versions#diff'
        put 'rollback', :to => 'unit_versions#rollback'
      end
    end
  end

#  resources :aircrafts
  resources :aircrafts do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'aircrafts_versions#diff'
        put 'rollback', :to => 'aircrafts_versions#rollback'
      end
    end
  end


#  resources :aircraft_types
  resources :aircraft_types do
      resources :versions, :only => [:destroy] do
        member do
          get 'diff', :to => 'aircraft_type_versions#diff'
          put 'rollback', :to => 'aircraft_type_versions#rollback'
        end
      end
    end


  resources :aircraft_classes


  resources :assignments


  resources :grants


  resources :roles


  resources :rights

#  resources :members
  resources :members do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'members_versions#diff'
        put 'rollback', :to => 'members_versions#rollback'
      end
    end
  end


devise_for :users, :skip => [:registrations]                                          
    as :user do
      get "login", :to => "devise/sessions#new"
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users' => 'devise/registrations#update', :as => 'user_registration'            
    end



#  resources :users
resources :users do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'users_versions#diff'
        put 'rollback', :to => 'users_versions#rollback'
      end
    end
  end

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
   root :to => 'contents#show', :id => 2

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
