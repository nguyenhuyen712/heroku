class AccidentsController < ApplicationController
  before_action :find_user, only: :new
  before_action :find_accident, except: [:index, :new]
  before_action :load_status, only: [:show, :update]

  def index
    @accidents = Accident.order_desc.paginate page: params[:page], per_page: 10
  end

  def new
    @accident = Accident.waiting_or_processing.user_exist(@user.id).first
    if (@accident.blank?)
      @accident = Accident.new accident_params
      if @accident.save
        redirect_to map_path
      end
    else
      if @accident.update_attributes accident_params
        redirect_to map_path
      end
    end
  end

  def show

  end

  def edit
    if @accident.update_attributes accident_update_params
      flash[:success] = t "flash.update_accident_success"
      redirect_to accident_path(@accident)
    else
      render :show
    end
  end

  private
  def accident_params
    params.permit(:lati, :longti).merge user_id: @user.id
  end

  def accident_update_params
    params.permit(:status, :description)
  end

  def find_user
    @user = User.find_by helmet_id: params[:ID]
    if @user.nil?
      flash[:danger] = t "flash.user_not_found"
      redirect_to users_path
    end
  end

  def find_accident
    @accident = Accident.find_by id: params[:id]
    if @accident.nil?
      flash[:danger] = "flash.accident_not_found"
      redirect_to accidents_path
    end
  end

  def load_status
    @accidents = Accident.statuses.keys
  end
end
