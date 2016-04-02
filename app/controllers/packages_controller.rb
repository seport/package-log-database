class PackagesController < ApplicationController

	def index
		if params[:search]
	    	@packages = Package.search(params[:search]).paginate(:page => params[:page], :per_page => 30).order("created_at DESC")
	  	else
	    	@packages = Package.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
	  	end
	end

	def new
		@package = Package.new
	end

	def create
		@package = Package.new(package_params)
		if @package.save
			redirect_to '/packages'
		else
			render 'new'
		end
	end

	def edit
		@package = Package.find(params[:id])
	end

	def update
		@package = Package.find(params[:id])
		if @package.update_attributes(package_params)
			redirect_to '/packages'
		else
			render 'edit' 
			
		end
	end

	private
	def package_params
		params.require(:package).permit(:in_date, :name, :sender, :package_type, :carrier, :in_by, :out_by, :out_date, :signature)
	end
end
