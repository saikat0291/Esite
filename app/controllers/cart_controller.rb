class CartController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]
	def add
		id = params['product_id']
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

	def clearcart
		session[:cart]= nil
		redirect_to :action => :index
		
	end
	def clearcartById
		product_id = params['product_id']
		session[:cart].delete(product_id)
		redirect_to :action => :index
	end

	def clearAddQtyById
		id = params['product_id']
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
	end

	def clearDelQtyById
		id = params['product_id']
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart]={}
			cart = session[:cart]
		end
		#if the product has already beeen added to the cart, increment the value else set the value
		if cart[id] then
			cart[id] = cart[id]-1
		else
			cart[id]=1
			
		end
		redirect_to :action => :index
	end

	def checkout
		if session[:cart] then
			@cart = session[:cart]
			#@sessionId=session[:session_id]
			@cart_id=current_user.id	
				@cart.each do |product_id ,quantity |
					if(product_id.length>0) then 
							product =Admin::Product.find(product_id) 
							EProducttempDtl.create(:product_id => product_id, :price => product.price,:quantity => quantity,:user_name => current_user.email,:cart_id => @cart_id,:offer_id => product.offerId)
					end	
				end
		else
			@cart = {}
		end
	end
	
	def index
		#if there is a cart , pass it to the page for display else pass an emoty value
		@searched_products = Admin::Product.where(["upper(product_name) LIKE upper(?)","%#{params[:search]}%"])
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
end
