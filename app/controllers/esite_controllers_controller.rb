class EsiteControllersController < ApplicationController
  #before_action :authenticate_user!, except: [:index]	
  def index
  	@searched_products = Admin::Product.where(["upper(product_name) LIKE upper(?)","%#{params[:search]}%"])
  	 @admin_products = Admin::Product.all
  	  @categoryList=ECategoryMst.all.where(is_active: 1)
  	  #if there is a cart , pass it to the page for display else pass an emoty value
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	
  end

	def add
		id = params[:product_id]
		#if the cart has already been create,use the existing cart else create a new cart
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart]={}
			cart = session[:cart]
		end
		#if the product has already beeen added to the cart, increment the value else set the value
		if cart[id] then
			cart[id] = cart[id]+1
		else
			cart[id]=1
			
		end
		redirect_to :action => :index
	end #end add method

	def contact
		
	end

	def E404
		
	end

	def blog
		
	end
end
