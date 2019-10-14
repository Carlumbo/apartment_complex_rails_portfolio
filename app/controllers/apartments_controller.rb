class ApartmentsController < ApplicationController
 

  def new 
     @landlord = Landlord.find(params[:landlord_id])
     @apartment = Apartment.new 
    
     @url = new_landlord_apartment_path(@landlord)
     
  end
  
  def create
    @landlord = Landlord.find(params[:id])
    @apartment = @landlord.apartments.build
    @apartment.update_attributes(apartment_params)
    if @apartment.save 
      binding.pry
          redirect_to landlord_apartment_path(@apartment.landlord, @apartment)
                      
    else 
          flash[:notice] = "This Apartment Complex could not be saved"
          redirect_to new_landlord_apartment_path(@landlord)
    end 
  end 

  def update 
   # binding.pry
    @url = landlord_apartment_path 

    @apartment= Apartment.find(params[:id])
    @apartment.update_attributes(apartment_params)
    binding.pry
    
    if @apartment.save 
      flash[:notice] = "The apartment has been saved!"
      binding.pry
         redirect_to landlord_path(@apartment.landlord, @apartment)
    else 
      flash[:notice] = "The apartment could not be saved"
      render :show
    end 
  end 

  def show 
    @apartment = Apartment.find(params[:id])
    @url =landlord_apartment_path
    if @apartment.floor_plans.size < @apartment.num_of_floor_plans
        new_floor_plan_forms = @apartment.num_of_floor_plans - @apartment.floor_plans.size
        new_floor_plan_forms.times { @apartment.floor_plans.build}
    end 
  end 

  private 

  def apartment_params 
    params.require(:apartment).permit(:name, :address, :landlord_id, :num_of_floor_plans, floor_plans_attributes: [:id, :type, :price, :description, :max_tenants, :apartment_id, layout_ids: [], layouts_attributes: [:name], floor_layouts_attributes:[:quanity, :id]])
  end 
end
