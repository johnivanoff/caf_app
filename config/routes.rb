CafApp::Application.routes.draw do


  resources :content_types


  resources :content_categories


  resources :caf_documents

  resources :caf_documents do
    collection { post :sort}
  end

  resources :document_categories


  resources :hq_position_assignments


  resources :hq_positions


  resources :events
  resources :events do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'event_versions#diff'
        put 'rollback', :to => 'events_versions#rollback'
      end
    end
  end

  resources :locations


  resources :unit_types


  resources :social_brands


  resources :social_links


  resources :unit_assignments


  resources :contents
    resources :contents do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'content_versions#diff'
        put 'rollback', :to => 'content_versions#rollback'
      end
    end
  end
  
  
  
  match 'news' => 'contents#news_index', :as => :news

  match 'contacts' => 'contents#show', :id => 3, :as => :contacts
  match 'admin' => 'contents#show', :id => 4, :as => :admin
  match 'member_home' => 'contents#show', :id => 8, :as => :member_home
  match 'unit_admin' => 'units#unit_admin', :as => :unit_admin
  match 'hq_directory' => 'members#hq_directory', :as => :hq_directory
  match 'aircraft_admin' => 'aircraft#aircraft_admin', :as => :aircraft_admin
  match 'hq_position_admin' => 'hq_position_assignments#hq_position_admin', :as => :hq_position_admin
  match 'home' => 'contents#home', :as => :home
  match 'content/:id/news_edit'


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

#  resources :aircraft
  resources :aircraft do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'aircraft_versions#diff'
        put 'rollback', :to => 'aircraft_versions#rollback'
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

   root :to => 'units#index'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
