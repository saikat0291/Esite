class EAddressMstrsController < ApplicationController
  def index
  end
  def create
  	@e_address_mstr = EAddressMstr.new(e_address_mstr_params)
  	respond_to do |format|
      if @e_address_mstr.save
        format.html { redirect_to @e_address_mstr, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def show
  	redirect_to '/paynow'
  end
   def e_address_mstr_params
      params.require(:e_address_mstr).permit(:user_id, :email, :firstname, :middlename, :lastname, :address1,:address2,:pin, :country,:state,:phone,:status)
    end
end
