require 'open-uri'
class CompaniesController < ApplicationController
  def index
    @companies = Company.all

    render("companies/index.html.erb")
  end

  def show
    @company = Company.find(params[:id])
    apigoogle = "http://maps.googleapis.com/maps/api/geocode/json?address="
    address_array=@company.local_address.split
    address = address_array.join("+")
    @url = apigoogle+address

    parsed_data = JSON.parse(open(@url).read)

    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    @lat = @latitude.to_s
    @long = @longitude.to_s


    render("companies/show.html.erb")
  end

  def new
    @company = Company.new

    render("companies/new.html.erb")
  end

  def create
    @company = Company.new

    @company.company_name = params[:company_name]
    @company.local_address = params[:local_address]

    save_status = @company.save

    if save_status == true
      redirect_to("/companies/#{@company.id}", :notice => "Company created successfully.")
    else
      render("companies/new.html.erb")
    end
  end

  def edit
    @company = Company.find(params[:id])

    render("companies/edit.html.erb")
  end

  def update
    @company = Company.find(params[:id])

    @company.company_name = params[:company_name]
    @company.local_address = params[:local_address]

    save_status = @company.save

    if save_status == true
      redirect_to("/companies/#{@company.id}", :notice => "Company updated successfully.")
    else
      render("companies/edit.html.erb")
    end
  end

  def destroy
    @company = Company.find(params[:id])

    @company.destroy

    if URI(request.referer).path == "/companies/#{@company.id}"
      redirect_to("/", :notice => "Company deleted.")
    else
      redirect_to(:back, :notice => "Company deleted.")
    end
  end
end
