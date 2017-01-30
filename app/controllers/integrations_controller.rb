class IntegrationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_integrations
  before_action :set_integration, only: [:show, :edit, :update, :destroy]

  # GET users/1/integrations
  def index
    @integrations = @user.integrations
  end

  # GET users/1/integrations/1
  def show
    @integration = @user.integrations.find(params[:id])
  end

  # GET users/1/integrations/new
  def new
    @integration = @user.integrations.build
  end

  # GET users/1/integrations/1/edit
  def edit
  end

  # POST users/1/integrations
  def create
    @integration = @user.integrations.build(integration_params)

    if @integration.save
      redirect_to(@integration, notice: 'Integration was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/integrations/1
  def update
    if @integration.update_attributes(integration_params)
      redirect_to(@integration, notice: 'Integration was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/integrations/1
  def destroy
    @integration.destroy
    redirect_to integrations_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integrations
      @user = current_user
    end

    def set_integration
      @integration = @user.integrations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def integration_params
      params.require(:integration).permit(:software_type, :software_username, :software_api_key)
    end
end
