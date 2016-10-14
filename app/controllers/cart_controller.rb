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
			@cart_id=session[:session_id]
			@user_id=current_user.id	
			@addressList=EAddressMstr.all.where(user_id: @user_id).where(status: 'Y')
			@tempProdList=EProducttempDtl.all.where(userId: @user_id)
			@billdetails = EAddressMstr.new 
			if(@tempProdList.size>0 && params[:commit]!='' &&  params[:conFirm]!='Y' && params[:conFirm]!='I') then 
				redirect_to :action => :index ,:conFirm => 'I' 
			else 	
				if(params[:commit]=='No') then 
					EProducttempDtl.destroy_all(userId: @user_id)
				end	
					@cart.each do |product_id ,quantity |
						if(product_id.length>0) then 
								product =Admin::Product.find(product_id) 
								EProducttempDtl.create(:product_id => product_id, :price => product.price,:quantity => quantity,:user_name => current_user.email,:cart_id => @cart_id,:offer_id => product.offerId,:userId => @user_id)
						end	
					end
					if(params[:commit]=='Yes') then 
						EProducttempDtl.where(:userId => @user_id).update_all(:cart_id => @cart_id)
					end
				@updatedProdList=EProducttempDtl.all.where(userId: @user_id)	
				params[:commit]={}
				params[:conFirm]=""
			end	
		else
			@cart = {}
		end
	end
	def paynow
		@user_id=current_user.id
		@addressList=EAddressMstr.all.where(user_id: @user_id)
		@updatedProdList=EProducttempDtl.all.where(userId: @user_id)
		if session[:cart] then
			@cart = session[:cart]
			@cart_id=session[:session_id]
			@user_id=current_user.id	
			@addressList=EAddressMstr.all.where(user_id: @user_id).where(status: 'Y')
			@tempProdList=EProducttempDtl.all.where(userId: @user_id)
			@billdetails = EAddressMstr.new 
			@updatedProdList=EProducttempDtl.all.where(userId: @user_id)
			session[:cart]={}	
		else
			@cart = {}
		end
	end 

	def deladdressById
		id = params['addressid']
		@searchaddress=EAddressMstr.find(id)
		@searchaddress.update(:status => 'N')
		redirect_to '/paynow'
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
