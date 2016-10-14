class BillTosController < ApplicationController
  def index
  end
  def create
  	@bill_to = BillTo.new(bill_to_params)
  	respond_to do |format|
      if @bill_to.save
        format.html { redirect_to @bill_to, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def show
  	redirect_to '/paynow'
  end
   def bill_to_params
      params.require(:bill_to).permit(:user_id, :email, :firstname, :middlename, :lastname, :address1,:address2,:pin, :country,:state,:phone)
    end
end
