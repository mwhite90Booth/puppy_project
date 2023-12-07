Rails.application.routes.draw do
  devise_for :users
  root "dogs#index"
  
  # Routes For Dogs resource:
  get("/dogs", { :controller => "dogs", :action => "index" })
  get("/dogs/:path_id", { :controller => "dogs", :action => "show" })  
  post("/insert_dog", { :controller => "dogs", :action => "create" })
  post("/modify_dog/:path_id", { :controller => "dogs", :action => "update" })
  get("/delete_dog/:path_id", { :controller => "dogs", :action => "destroy" })
  
  # Routes for the Vaccination resource:
  # CREATE
  post("/insert_vaccination", { :controller => "vaccinations", :action => "create" })
  get("/vaccinations", { :controller => "vaccinations", :action => "index" })
  get("/vaccinations/:path_id", { :controller => "vaccinations", :action => "show" })
  post("/modify_vaccination/:path_id", { :controller => "vaccinations", :action => "update" })
  get("/delete_vaccination/:path_id", { :controller => "vaccinations", :action => "destroy" })
end
