class PeopleController < ApplicationController
  def index
    @people = Person.all

    render("people/index.html.erb")
  end

  def show
    @person = Person.find(params[:id])
    @encounter = Encounter.find(params[:id])

    render("people/show.html.erb")
  end

  def new
    @person = Person.new

    render("people/new.html.erb")
  end

  def create
    @person = Person.new

    @person.first_name = params[:first_name]
    @person.last_name = params[:last_name]
    @person.talking_points = params[:talking_points]
    @person.times_met = params[:times_met]
    @person.title = params[:title]
    @person.boothie = params[:boothie]
    @person.office_location = params[:office_location]
    @person.company_id = params[:company_id]

    save_status = @person.save

    if save_status == true
      redirect_to("/people/#{@person.id}", :notice => "Person created successfully.")
    else
      render("people/new.html.erb")
    end
  end

  def edit
    @person = Person.find(params[:id])

    render("people/edit.html.erb")
  end

  def update
    @person = Person.find(params[:id])

    @person.first_name = params[:first_name]
    @person.last_name = params[:last_name]
    @person.talking_points = params[:talking_points]
    @person.times_met = params[:times_met]
    @person.title = params[:title]
    @person.boothie = params[:boothie]
    @person.office_location = params[:office_location]
    @person.company_id = params[:company_id]

    save_status = @person.save

    if save_status == true
      redirect_to("/people/#{@person.id}", :notice => "Person updated successfully.")
    else
      render("people/edit.html.erb")
    end
  end

  def destroy
    @person = Person.find(params[:id])

    @person.destroy

    if URI(request.referer).path == "/people/#{@person.id}"
      redirect_to("/", :notice => "Person deleted.")
    else
      redirect_to(:back, :notice => "Person deleted.")
    end
  end
end
