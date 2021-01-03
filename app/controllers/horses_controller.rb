class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :update, :destroy]
  # GET /horses
  def index
    @horses = Horse.all

    render json: @horses
  end

  # GET /horses/1
  def show
    render json: @horse, serializer: HorsesShowSerializer
  end

  # POST /horses
  def create
    @horse = Horse.new(horse_params)
    if verify_permissions
      if @horse.save
        render json: @horse, status: :created, location: @horse
      else
        render json: @horse.errors, status: :unprocessable_entity
      end
    else
      render json: {errors: "USER NOT AUTHORIZED TO MAKE CHANGES!"}
    end
  end

  # PATCH/PUT /horses/1
  def update
    if verify_permissions
      if @horse.update(horse_params)
        render json: @horse
      else
        render json: @horse.errors, status: :unprocessable_entity
      end
    else
      render json: {errors: "USER NOT AUTHORIZED TO MAKE CHANGES!"}
    end
  end

  # DELETE /horses/1
  def destroy
    if verify_permissions
      horse = @horse
      @horse.destroy
      render json: {horse: horse}, status: :created
    else
      render json: {errors: "USER NOT AUTHORIZED TO MAKE CHANGES!"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horse
      @horse = Horse.find(params[:id])
    end

    def verify_permissions
      if !!get_token
        (@horse.user_id === current_app_user.id)
      else
        false
      end
    end
    # Only allow a trusted parameter "white list" through.
    def horse_params
      params.require(:horse).permit(:name, :location, :breed, :gender, :size, :color, :foal_date, :profile_picture, :video, :temperment, :description, :user_id, :breed_id)
    end
end
 