class VaccinationsController < ApplicationController
  def index
    matching_vaccinations = Vaccination.all

    @list_of_vaccinations = matching_vaccinations.order({ :created_at => :desc })

    render({ :template => "vaccinations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vaccinations = Vaccination.where({ :id => the_id })

    @the_vaccination = matching_vaccinations.at(0)

    render({ :template => "vaccinations/show" })
  end

  def create
    the_vaccination = Vaccination.new
    the_vaccination.dog_id = params.fetch("query_dog_id")
    the_vaccination.vaccintation_name = params.fetch("query_vaccintation_name")
    the_vaccination.given_date = params.fetch("query_given_date")
    the_vaccination.expiration_date = params.fetch("query_expiration_date")

    if the_vaccination.valid?
      the_vaccination.save
      redirect_to("/vaccinations", { :notice => "Vaccination created successfully." })
    else
      redirect_to("/vaccinations", { :alert => the_vaccination.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vaccination = Vaccination.where({ :id => the_id }).at(0)

    the_vaccination.dog_id = params.fetch("query_dog_id")
    the_vaccination.vaccintation_name = params.fetch("query_vaccintation_name")
    the_vaccination.given_date = params.fetch("query_given_date")
    the_vaccination.expiration_date = params.fetch("query_expiration_date")

    if the_vaccination.valid?
      the_vaccination.save
      redirect_to("/vaccinations/#{the_vaccination.id}", { :notice => "Vaccination updated successfully."} )
    else
      redirect_to("/vaccinations/#{the_vaccination.id}", { :alert => the_vaccination.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vaccination = Vaccination.where({ :id => the_id }).at(0)

    the_vaccination.destroy

    redirect_to("/vaccinations", { :notice => "Vaccination deleted successfully."} )
  end
end
