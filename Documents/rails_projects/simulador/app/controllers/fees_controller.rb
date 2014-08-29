class FeesController < ApplicationController

	def index
		@credit = Credit.find(params[:credit_id])
		@fees = @credit.fees.paginate(page: params[:page], per_page: 50)
	end

end