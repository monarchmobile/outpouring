class ContactsController < ApplicationController

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		respond_to do |format|
			if @contact.save
				format.html { redirect_to dashboard_path}
				format.js
			else
				format.html { render 'new', :notice => "please check to make sure your info is correct" }
			end
		end
	end

	def edit 
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])

		respond_to do |format|
	      if @contact.update_attributes(params[:contact])
	        format.html { redirect_to dashboard_path, notice: 'Contact was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @contact.errors, status: :unprocessable_entity }
	      end
	    end

	end

end