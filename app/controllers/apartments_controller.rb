class ApartmentsController < ApplicationController
 

  def new 
     @landlord = Landlord.find(params[:landlord_id])
     @apartment = Apartment.new 
     @url = new_landlord_apartment_path(@landlord)
  end
  
  def create
    @landlord = Landlord.find(params[:id])
    @apartment = @landlord.apartments.build
    if @apartment.save 
          redirect_To landlord_apartments_path(@apartment.landlord, @apartment)
    else 
          flash[:notice] = "This Apartment Complex could not be saved"
          redirect_to new_landlord_apartment_path(@landlord)
    end 
  end 

  def update 
    @url = landlord_apartment_path 
    @apartment= apartment.find(parmas[:id])
    @apartment.update_attributes(apartment_params)
    if @apartment.save 
      flash[:notice] = "The apartment has been saved!"
      redirect_to landlord_apartment_path(@apartment.landlord, @apartment)
    else 
      flash[:notice] = "The apartment could not be saved"
      render :show
    end 
  end 

  def show 
    @apartment = Apartment.find(params[:id])
    @url = landlord_apartment_path
    if @apartment.floor_plans.size < @apartment.num_of_floor_plans
        new_floor_plan_avail = @apartment.num_of_floor_plans - @apartment.floor_plans.size
        new_floor_plan_avail.times { @apartment.floor_plans.build}
    end 
  end 

  private 
  def apartment_params 
    params.requrie(:apartment).permit(:name, :address, :landlord_id, :num_of_floor_plans, :id )
  end 
end
