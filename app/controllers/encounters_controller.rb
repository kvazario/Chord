class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all

    render("encounters/index.html.erb")
  end

  def show
    @encounter = Encounter.find(params[:id])

    render("encounters/show.html.erb")
  end

  def new
    @encounter = Encounter.new

    render("encounters/new.html.erb")
  end

  def create
    @encounter = Encounter.new

    @encounter.person_id = params[:person_id]
    @encounter.event_id = params[:event_id]
    @encounter.thankyouletter_sent = params[:thankyouletter_sent]
    @encounter.user_id = params[:user_id]

    save_status = @encounter.save

    if save_status == true
      redirect_to("/encounters/#index.html.erb}", :notice => "Encounter created successfully.")
    else
      render("encounters/new.html.erb")
    end
  end

  def edit
    @encounter = Encounter.find(params[:id])

    render("encounters/edit.html.erb")
  end

  def update
    @encounter = Encounter.find(params[:id])

    @encounter.person_id = params[:person_id]
    @encounter.event_id = params[:event_id]
    @encounter.thankyouletter_sent = params[:thankyouletter_sent]
    @encounter.user_id = params[:user_id]

    save_status = @encounter.save

    if save_status == true
      redirect_to("/encounters/#{@encounter.id}", :notice => "Encounter updated successfully.")
    else
      render("encounters/edit.html.erb")
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])

    @encounter.destroy

    if URI(request.referer).path == "/encounters/#{@encounter.id}"
      redirect_to("/", :notice => "Encounter deleted.")
    else
      redirect_to(:back, :notice => "Encounter deleted.")
    end
  end
end
