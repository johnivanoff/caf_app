CafApp::Application.routes.draw do


  resources :terms


  resources :positions


  resources :content_galleries


  resources :position_assignments


  resources :document_files


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
  
  
  get 'home' => 'contents#home', :as => :home
  get 'news' => 'contents#news_index', :as => :news
	get 'new_page' => 'contents#new_page', :as => :new_page
	get 'add_news' => 'contents#add_news', :as => :add_news
  get 'blogs' => 'contents#blogs_index', :as => :blogs

	get 'add_blog' => 'contents#add_blog', :as => :add_blog
  get 'contacts' => 'contents#show', :id => 3, :as => :contacts
  get 'careers' => 'contents#show', :id => 65, :as => :careers
  get 'airbase' => 'contents#show', :id => 64, :as => :airbase
  get 'rtl-support' => 'contents#show', :id => 45, :as => :rtl_support
  
  get 'privacy_policy' => 'contents#show', :id => 82, :as => :privacy_policy
  get 'membership' => 'contents#show', :id => 21, :as => :membership
  get 'admin' => 'contents#show', :id => 4, :as => :admin
  get 'member_home' => 'contents#member_home', :as => :member_home
  get 'how_to_get_involved_with_the_caf' => 'contents#show', :id => 61, :as => :how_to_get_involved_with_the_caf
  
  get 'education' => 'contents#show', :id => 92, :as => :education
  get 'non_profit_information'  => 'contents#show', :id => 63, :as => :non_profit_information
  get 'media_inquiries' => 'contents#show', :id => 7, :as => :media_inquiries
  get 'request_an_aircraft_appearance' => 'contents#show', :id => 25, :as => :request_an_aircraft_appearance

  # Support page and associated links
  get 'support' => 'contents#show', :id => 10, :as => :support
  get 'donation' => 'contents#show', :id => 11, :as => :donation
  get 'sponsor_an_aircraft' => 'contents#show', :id => 5, :as => :sponsor_an_aircraft
  get 'support_a_special_caf_project' => 'contents#show', :id => 16, :as => :support_a_special_caf_project
  get 'join_the_heritage_club' => 'contents#show', :id => 13, :as => :join_the_heritage_club
  get 'join_the_victory_circle' => 'contents#show', :id => 12, :as => :join_the_victory_circle
  get 'aircraft_donations' => 'contents#show', :id => 15, :as => :aircraft_donations

  # Membership page and associated links
  get 'membership' => 'contents#show', :id => 21, :as => :membership
  get 'membership_options' => 'contents#show', :id => 17, :as => :membership_options
  get 'how_to_get_involved' => 'contents#show', :id => 61, :as => :how_to_get_involved
  get 'renew_membership' => 'contents#show', :id => 19, :as => :renew_membership
  get 'member_benefits' => 'contents#show', :id => 31, :as => :member_benefits
  get 'contact_member_services' => 'contents#show', :id => 62, :as => :contact_member_services
  

  match 'unit_admin' => 'units#unit_admin', :as => :unit_admin
  match 'hq_directory' => 'members#hq_directory', :as => :hq_directory
  match 'aircraft_admin' => 'aircraft#aircraft_admin', :as => :aircraft_admin
  match 'hq_position_admin' => 'hq_position_assignments#hq_position_admin', :as => :hq_position_admin
  match 'headquarters_staff' => 'position_assignments#headquarters_staff', :as => :headquarters_staff
  match 'general_staff' => 'members#gen_staff_directory', :as => :general_staff

  match 'content/:id/news_edit'
  match 'aircraft_rides' => 'aircraft#aircraft_rides', :as => :aircraft_rides
  match 'hall_of_fame' => 'members#hall_of_fame', :as => :hall_of_fame
  get "contents/password_reset"
  match 'password_reset' => 'contents#password_reset', :as => :password_reset

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



#devise_for :users, :skip => [:registrations]                                          
    devise_scope :user do
      get "login", :to => "devise/sessions#new"
#      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
#      put 'users' => 'devise/registrations#update', :as => 'user_registration'            
    end

 devise_for :users, :controllers => { :passwords =>  "passwords" }

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
   root :to => 'contents#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
