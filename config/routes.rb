Rails.application.routes.draw do
  devise_for :users
  root "dogs#index"
  
  #get("/", { :controller => "homepage", :action => "index" })

  # Routes For Dogs resource:
  get("/dogs", { :controller => "dogs", :action => "index" })
  get("/dogs/new_dog", { :controller => "dogs", :action => "new_dog" })
  get("/dogs/:path_id", { :controller => "dogs", :action => "show" })  
  post("/insert_dog", { :controller => "dogs", :action => "create" })

  get("/dogs/edit/:path_id", { :controller => "dogs", :action => "edit" })
  post("/modify_dog/:path_id", { :controller => "dogs", :action => "update" })

  get("/delete_dog/:path_id", { :controller => "dogs", :action => "destroy" })
  
  # Routes for the Vaccination resource:
  get("/vaccinations/:path_id", { :controller => "vaccinations", :action => "show" })
  get("/vaccinations/new/:path_id", { :controller => "vaccinations", :action => "new_vaccination" })
  post("/modify_vaccination/:path_id", { :controller => "vaccinations", :action => "update" })
  get("/delete_vaccination/:path_id", { :controller => "vaccinations", :action => "destroy" })
  post("/insert_vaccination", { :controller => "vaccinations", :action => "create" })
end
