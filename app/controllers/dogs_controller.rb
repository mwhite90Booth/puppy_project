class DogsController < ApplicationController
  
  def index
    matching_dogs = Dog.all
    @list_of_dogs = matching_dogs.order({ :created_at => :desc })
    render({ :template => "dogs/index" })
  end

  def new_dog
    render({ :template => "dogs/insert" })
  end

  def create
    the_dog = Dog.new
    the_dog.first_name = params.fetch("query_first_name")
    the_dog.last_name = params.fetch("query_last_name")
    the_dog.profile_picture = params.fetch("query_profile_picture")
    the_dog.breed = params.fetch("query_breed")
    the_dog.home_address = params.fetch("query_home_address")
    the_dog.date_of_birth = params.fetch("query_date_of_birth")
    the_dog.vet_name = params.fetch("query_vet_name")
    the_dog.vet_address = params.fetch("query_vet_address")
    the_dog.vet_phone = params.fetch("query_vet_phone")
    the_dog.food_brand = params.fetch("query_food_brand")
    the_dog.food_instructions = params.fetch("query_food_instructions")
    the_dog.chip_id = params.fetch("query_chip_id")
    the_dog.owner_id = params.fetch("query_owner_id")
    if the_dog.valid?
      the_dog.save
      redirect_to("/dogs", { :notice => "Dog created successfully." })
    else
      redirect_to("/dogs", { :alert => the_dog.errors.full_messages.to_sentence })
    end
  end

  def show
    the_id = params.fetch("path_id")
    matching_dogs = Dog.where({ :id => the_id })
    @the_dog = matching_dogs.at(0)
    @the_vaccinations = Vaccination.where({ :dog_id => the_id})
    render({ :template => "dogs/show" })
  end

  def edit
    the_id = params.fetch("path_id")
    matching_dogs = Dog.where({ :id => the_id })
    @the_dog = matching_dogs.at(0)
    render({ :template => "dogs/edit" })
  end

  def update
    the_id = params.fetch("path_id")
    the_dog = Dog.where({ :id => the_id }).at(0)
    the_dog.first_name = params.fetch("query_first_name")
    the_dog.last_name = params.fetch("query_last_name")
    the_dog.profile_picture = params.fetch("query_profile_picture")
    the_dog.breed = params.fetch("query_breed")
    the_dog.home_address = params.fetch("query_home_address")
    the_dog.date_of_birth = params.fetch("query_date_of_birth")
    the_dog.vet_name = params.fetch("query_vet_name")
    the_dog.vet_address = params.fetch("query_vet_address")
    the_dog.vet_phone = params.fetch("query_vet_phone")
    the_dog.food_brand = params.fetch("query_food_brand")
    the_dog.food_instructions = params.fetch("query_food_instructions")
    the_dog.chip_id = params.fetch("query_chip_id")
    the_dog.owner_id = params.fetch("query_owner_id")
    if the_dog.valid?
      the_dog.save
      redirect_to("/dogs/#{the_dog.id}", { :notice => "Dog updated successfully."} )
    else
      redirect_to("/dogs/#{the_dog.id}", { :alert => the_dog.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dog = Dog.where({ :id => the_id }).at(0)
    the_dog.destroy
    redirect_to("/dogs", { :notice => "Dog deleted successfully."} )
  end

end
