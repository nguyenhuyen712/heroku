class AccidentsController < ApplicationController
  before_action :find_user

  def new
    @accident = Accident.new accident_params
    if @accident.save
      redirect_to map_path
    else
      flash[:danger] = "false"
    end
  end

  private
  def accident_params
    params.permit(:lati, :longti).merge user_id: @user.id
  end

  def find_user
    @user = User.find_by phone: params[:ID]
    if @user.nil?
      flash[:danger] = t "flash.user_not_found"
      redirect_to root_path
    end
  end
end
