class EmailAlertsController < ApplicationController
  before_action :set_email_alert, only: [:show, :edit, :update, :destroy]

  # GET /email_alerts
  # GET /email_alerts.json
  def index
    @email_alerts = EmailAlert.all
  end

  # GET /email_alerts/1
  # GET /email_alerts/1.json
  def show
  end

  # GET /email_alerts/new
  def new
    @email_alert = EmailAlert.new
  end

  # GET /email_alerts/1/edit
  def edit
  end

  # POST /email_alerts
  # POST /email_alerts.json
  def create
    @email_alert = EmailAlert.new(email_alert_params)

    respond_to do |format|
      if @email_alert.save
        format.html { redirect_to @email_alert, notice: 'Email alert was successfully created.' }
        format.json { render :show, status: :created, location: @email_alert }
      else
        format.html { render :new }
        format.json { render json: @email_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_alerts/1
  # PATCH/PUT /email_alerts/1.json
  def update
    respond_to do |format|
      if @email_alert.update(email_alert_params)
        format.html { redirect_to @email_alert, notice: 'Email alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_alert }
      else
        format.html { render :edit }
        format.json { render json: @email_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_alerts/1
  # DELETE /email_alerts/1.json
  def destroy
    @email_alert.destroy
    respond_to do |format|
      format.html { redirect_to email_alerts_url, notice: 'Email alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_alert
      @email_alert = EmailAlert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_alert_params
      params.require(:email_alert).permit(:subject, :machine_group, :machine_name, :all_params)
    end
end
