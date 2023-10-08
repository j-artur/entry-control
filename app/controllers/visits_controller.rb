class VisitsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_visit, only: %i[ show edit update destroy ]
  before_action :set_visitors, only: %i[ new edit create update ]
  before_action :set_sectors, only: %i[ new edit create update ]
  before_action :set_employees, only: %i[ new edit create update ]

  # GET /visits or /visits.json
  def index
    @visits = Visit.accessible_by(current_ability)
  end

  # GET /visits/1 or /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits or /visits.json
  def create
    @visit = Visit.new(visit_params)

    respond_to do |format|
      if @visit.save
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully created." }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1 or /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully updated." }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1 or /visits/1.json
  def destroy
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url, notice: "Visit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def set_visitors
      @visitors = Visitor.pluck(:name, :id)
    end

    def set_sectors
      @sectors = Sector.pluck(:id, :name, :unit_id).map do |sector|
        [sector[1] + " | " + Unit.find(sector[2]).name, sector[0]]
      end
    end

    def set_employees
      @employees = User.where(role: "employee").pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:visitor_id, :sector_id, :user_id)
    end
end
