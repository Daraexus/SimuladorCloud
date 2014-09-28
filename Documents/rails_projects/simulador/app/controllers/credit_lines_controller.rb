class CreditLinesController < ApplicationController
  before_action :signed_in_user , only: [:create, :edit, :destroy]
  before_action :correct_user, only: [:edit, :destroy]


  def new
    @credit_line = current_user.credit_lines.build if signed_in?
  end
  def create
  	@credit_line = current_user.credit_lines.build(credit_line_params)
  	if @credit_line.save
  		flash[:success] = "Nueva linea de credito creada"
  		redirect_to current_user
  	else
  		render 'new'
  	end
  end

  def edit
    @credit_line = current_user.credit_lines.find(params[:id])
  end

  def update
    @credit_line = current_user.credit_lines.find(params[:id])
    if @credit_line.update_attributes(credit_line_params)
      flash[:success] = "Linea de credito actualizada"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @credits = current_user.credits.find( :all, :conditions => ["lineaCredito = ?", @credit_line.id])
    @credits.each do |credit|
      credit.destroy
    end

    @credit_line.destroy
    flash[:success] = "Linea de credito eliminada con exito"
    redirect_to current_user
  end


  private

  	def credit_line_params
  		params.require(:credit_line).permit(:name, :annualRate)
  	end

    def correct_user
      @credit_line = current_user.credit_lines.find_by(id: params[:id])
      redirect_to root_url if @credit_line.nil?
    end

end