Rails.application.routes.draw do

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  # Routes for the Company resource:
  # CREATE
  get "/companies/new", :controller => "companies", :action => "new"
  post "/create_company", :controller => "companies", :action => "create"

  # READ
  get "/companies", :controller => "companies", :action => "index"
  get "/companies/:id", :controller => "companies", :action => "show"

  # UPDATE
  get "/companies/:id/edit", :controller => "companies", :action => "edit"
  post "/update_company/:id", :controller => "companies", :action => "update"

  # DELETE
  get "/delete_company/:id", :controller => "companies", :action => "destroy"
  #------------------------------

  # Routes for the Encounter resource:
  # CREATE
  get "/encounters/new", :controller => "encounters", :action => "new"
  post "/create_encounter", :controller => "encounters", :action => "create"

  # READ
  get "/encounters", :controller => "encounters", :action => "index"
  get "/encounters/:id", :controller => "encounters", :action => "show"

  # UPDATE
  get "/encounters/:id/edit", :controller => "encounters", :action => "edit"
  post "/update_encounter/:id", :controller => "encounters", :action => "update"

  # DELETE
  get "/delete_encounter/:id", :controller => "encounters", :action => "destroy"
  #------------------------------

  # Routes for the Person resource:
  # CREATE
  get "/people/new", :controller => "people", :action => "new"
  post "/create_person", :controller => "people", :action => "create"

  # READ
  get "/people", :controller => "people", :action => "index"
  get "/people/:id", :controller => "people", :action => "show"

  # UPDATE
  get "/people/:id/edit", :controller => "people", :action => "edit"
  post "/update_person/:id", :controller => "people", :action => "update"

  # DELETE
  get "/delete_person/:id", :controller => "people", :action => "destroy"
  #------------------------------

  devise_for :users
  root to: "encounters#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
