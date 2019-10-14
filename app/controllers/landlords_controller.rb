class LandlordsController < ApplicationController
  def about
  end

  def index
    @landlords = Landlord.all
    @apartments = Apartment.all
    render :index
  end

  def new 
    @landlord = Landlord.new 
  end 

  def create 
    @landlord = Landlord.new(name: landlord_params[:name], user:current_user)
      if @landlord.save
          @landlord.user.landlord_role
          redirect_to landlord_path(@landlord)
      else 
        flash[:notice] = "An error occured, landlord was not saved"
        render :new
      end 
  end 

  def show
    @landlord = Landlord.find(params[:id])
    @apartments = @landlord.apartments.all 
  end

  def landlord_params
    params.require(:landlord).permit(:name)
  end 
end
