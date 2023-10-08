class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_sectors, only: %i[ new edit create update ]
  before_action :set_roles, only: %i[ new edit create update ]

  def index
    @users = User.accessible_by(current_ability)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(update_user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_sectors
      @sectors = Sector.pluck(:id, :name, :unit_id).map do |sector|
        [sector[1] + " | " + Unit.find(sector[2]).name, sector[0]]
      end
    end

    def set_roles
      @roles = User.roles.keys.map do |role|
        [role.capitalize, role]
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :role, :sector_id)
    end

    def update_user_params
      params.require(:user).permit(:name, :email, :sector_id, :role)
    end
end
